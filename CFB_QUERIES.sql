/* Query 1 Alfred Ramos, Query that displays the names of all the conferences followed by the conference’s Best rated team and worst rated team based off their overall rating, Aggregate Functions used were: MAX and MIN*/ 
SELECT conf.CONF_ID, conferences.CONF_NAME AS Conference, MAX(rating.OVR_RATING) as "Conference MAX Rating", MIN( rating.OVR_RATING ) as "Conference MIN Rating"
FROM cfb.teams as teams
INNER JOIN cfb.conference_match as conf
ON conf.TEAM_ID = teams.TEAM_ID
INNER JOIN cfb.conferences as conferences
ON conf.CONF_ID = conferences.CONF_ID
INNER JOIN cfb.rating_match as ratingM
ON ratingM.TEAM_ID = teams.TEAM_ID
INNER JOIN cfb.rating as rating
ON rating.RATING_ID = ratingM.RATING_ID
GROUP BY CONF_ID;

/*Query 2 Andres Tostado, Query that displays all bowl games and their projected matchups. Uses Distinct to prevent duplicates as there are 2 rows with the same GAME_ID in GAME_MATCH .*/
SELECT DISTINCT gm1.GAME_ID AS 'ID', bg.GAME_NAME AS 'Bowl Game', CONCAT(team1.TEAM_NAME, ' vs ', team2.TEAM_NAME) AS 'Matchup'
FROM cfb.GAME_MATCH gm1
JOIN cfb.GAME_MATCH gm2 ON gm1.GAME_ID = gm2.GAME_ID AND gm1.TEAM_ID < gm2.TEAM_ID
JOIN cfb.TEAMS team1 ON gm1.TEAM_ID = team1.TEAM_ID
JOIN cfb.TEAMS team2 ON gm2.TEAM_ID = team2.TEAM_ID
JOIN cfb.BOWL_GAMES bg ON gm1.GAME_ID = bg.GAME_ID;

/* Query 3 Daniel Sigala, finds the average rating of the top 10 teams using a subquery. */
SELECT ROUND(AVG(r.OVR_RATING), 2) AS 'Average Rating Of Top 10 Teams'
FROM (
    SELECT RM.TEAM_ID, RA.OVR_RATING
    FROM cfb.RATING_MATCH RM
    JOIN cfb.RATING RA ON RM.RATING_ID = RA.RATING_ID
    JOIN cfb.STANDINGS_MATCH SM ON RM.TEAM_ID = SM.TEAM_ID
    JOIN cfb.STANDINGS S ON SM.STANDINGS_ID = S.STANDINGS_ID
    ORDER BY S.RANKING ASC
    LIMIT 10
) AS r;

/* Query 4 Daniel Sigala, displays teams in the Big 12 conference ordered by the number of wins they have. */
SELECT cfb.TEAMS.TEAM_NAME AS Team, cfb.CONFERENCES.CONF_NAME AS Conference, cfb.STANDINGS.WINS AS Wins
FROM cfb.TEAMS
JOIN cfb.STANDINGS_MATCH ON cfb.TEAMS.TEAM_ID = cfb.STANDINGS_MATCH.TEAM_ID
JOIN cfb.STANDINGS ON cfb.STANDINGS_MATCH.STANDINGS_ID = cfb.STANDINGS.STANDINGS_ID
JOIN cfb.CONFERENCE_MATCH ON cfb.TEAMS.TEAM_ID = cfb.CONFERENCE_MATCH.TEAM_ID
JOIN cfb.CONFERENCES ON cfb.CONFERENCE_MATCH.CONF_ID = cfb.CONFERENCES.CONF_ID
WHERE cfb.CONFERENCES.CONF_NAME = 'BIG 12'
ORDER BY cfb.STANDINGS.WINS DESC;



/*Query 5 Andres Tostado, When 2 teams are inserted into GAME_MATCH under the same GAME_ID, the trigger created will add the new game to PROJECTED_WINNERS and will set the TEAM_ID column (projected winner) to whoever has the higher OVR_RATING of the 2 teams. GAME_MATCH does not allow duplicate TEAM_IDs*/

/* TRIGGER */
DELIMITER //
CREATE TRIGGER cfb.INSERT_PROJ_WINNER
AFTER INSERT ON cfb.GAME_MATCH
FOR EACH ROW
BEGIN
    DECLARE TEAM1_ID INT;
    DECLARE TEAM2_ID INT;
    DECLARE TEAM1_RATING DECIMAL(8,2);
    DECLARE TEAM2_RATING DECIMAL(8,2);
    DECLARE HIGHER_RATED_TEAM INT;

    IF (SELECT COUNT(*) FROM cfb.GAME_MATCH WHERE GAME_ID = NEW.GAME_ID) = 2 THEN

        SELECT RM.TEAM_ID INTO TEAM1_ID
        FROM cfb.RATING_MATCH RM
        JOIN cfb.GAME_MATCH GM ON RM.TEAM_ID = GM.TEAM_ID
        WHERE GM.GAME_ID = NEW.GAME_ID
        ORDER BY TEAM_ID DESC
        LIMIT 1;

        SELECT RM.TEAM_ID INTO TEAM2_ID
        FROM cfb.RATING_MATCH RM
        JOIN cfb.GAME_MATCH GM ON RM.TEAM_ID = GM.TEAM_ID
        WHERE GM.GAME_ID = NEW.GAME_ID
        ORDER BY TEAM_ID ASC
        LIMIT 1;

        SELECT R.OVR_RATING INTO TEAM1_RATING
        FROM cfb.RATING R
        JOIN cfb.RATING_MATCH RM ON R.RATING_ID = RM.RATING_ID
        WHERE RM.TEAM_ID = TEAM1_ID;

        SELECT R.OVR_RATING INTO TEAM2_RATING
        FROM cfb.RATING R
        JOIN cfb.RATING_MATCH RM ON R.RATING_ID = RM.RATING_ID
        WHERE RM.TEAM_ID = TEAM2_ID;

        IF TEAM1_RATING IS NOT NULL AND TEAM2_RATING IS NOT NULL THEN 
            IF TEAM1_RATING > TEAM2_RATING THEN
                SET HIGHER_RATED_TEAM = TEAM1_ID;
            ELSE
                SET HIGHER_RATED_TEAM = TEAM2_ID;
            END IF;

            INSERT INTO cfb.PROJECTED_WINNERS (GAME_ID, TEAM_ID)
            VALUES (NEW.GAME_ID, HIGHER_RATED_TEAM);
        END IF;
    END IF;
END //
DELIMITER ;

/* Sample insert for test */
INSERT INTO cfb.BOWL_GAMES(GAME_ID, GAME_NAME)
VALUES(29, 'Exhibition Game');

INSERT INTO cfb.GAME_MATCH(GAME_ID, TEAM_ID)
VALUES(29, 60), (29, 42);

*Query 6 Nicholas O’Connell,  when a team is deleted from the team table a corresponding trigger will remove that team from all other tables. It will also fix the rating of all other teams to move up one in   */

-- Trigger to update ratings after a team is deleted
DELIMITER // 
CREATE TRIGGER cfb.trg_delete_team_update_ratings
AFTER DELETE ON cfb.teams
FOR EACH ROW
BEGIN
    DECLARE rating_to_move_up INT;
    
    -- Find the rating of the deleted team
    SELECT RATING_ID INTO rating_to_move_up FROM cfb.RATING_MATCH WHERE TEAM_ID = OLD.team_id;
    
    -- Move up other ratings
    UPDATE cfb.RATING_MATCH SET RATING_ID = RATING_ID - 1 WHERE RATING_ID > rating_to_move_up;
    
    -- Delete the record of the deleted team
    DELETE FROM cfb.RATING_MATCH WHERE TEAM_ID = OLD.team_id;
    
    -- Delete corresponding records in cfb.conference_match
    DELETE FROM cfb.conference_match WHERE TEAM_ID = OLD.team_id;
    
    -- Delete corresponding records in cfb.def_stats
    DELETE FROM cfb.def_stats WHERE TEAM_ID = OLD.team_id;
    
    -- Delete corresponding records in cfb.game_match
    DELETE FROM cfb.game_match WHERE TEAM_ID = OLD.team_id;
    
    -- Delete corresponding records in cfb.off_stats
    DELETE FROM cfb.off_stats WHERE TEAM_ID = OLD.team_id;
    
    -- Delete corresponding records in cfb.projected_winners
    DELETE FROM cfb.projected_winners WHERE TEAM_ID = OLD.team_id;

    -- Delete corresponding records in cfb.standings_match
    DELETE FROM cfb.standings_match WHERE TEAM_ID = OLD.team_id;

    -- Add more delete statements for other related tables
    -- DELETE FROM other_related_table WHERE TEAM_ID = OLD.team_id;
END;
//

//



-- Query 7a Alfred Ramos In this query we wanted to find the best teams in each conference and see what their yardages on defense and offense. In the query I used a subquery that pulled the best ratings from each conference from there I built out the the team stats we wanted from the subquery. / 
SELECT TEAMS.TEAM_ID AS "Team ID", RATING, TEAMS.TEAM_NAME AS Team, OFFENSE.OFF_AVG_YDS_PLAY AS "Average Yardage on Offense", DEFENSE.DEF_AVG_YDS_PLAY AS "Average Yardage on Defense"
FROM (SELECT MAX(rating.OVR_RATING) AS RATING
FROM cfb.teams as teams
INNER JOIN cfb.conference_match as conf
ON conf.TEAM_ID = teams.TEAM_ID
INNER JOIN cfb.conferences as conferences
ON conf.CONF_ID = conferences.CONF_ID
INNER JOIN cfb.rating_match as ratingM
ON ratingM.TEAM_ID = teams.TEAM_ID
INNER JOIN cfb.rating as rating
ON rating.RATING_ID = ratingM.RATING_ID
GROUP BY conf.CONF_ID) AS T
INNER JOIN cfb.rating ON rating.OVR_RATING = RATING
INNER JOIN cfb.rating_match AS RATINGM ON RATINGM.RATING_ID = rating.RATING_ID
INNER JOIN cfb.teams AS TEAMS ON TEAMS.TEAM_ID = RATINGM.TEAM_ID
INNER JOIN cfb.off_stats AS OFFENSE ON TEAMS.TEAM_ID = OFFENSE.TEAM_ID
INNER JOIN cfb.def_stats AS DEFENSE ON TEAMS.TEAM_ID = DEFENSE.TEAM_ID;

/*Query 7b Nicholas O’Connell, This query joins the necessary tables (CONFERENCES, CONFERENCE_MATCH, RATING_MATCH, and RATING) to retrieve the conference names, team ratings, and then calculates the average rating for each conference using the AVG function. The GROUP BY clause groups the results by conference.  */
SELECT
    c.CONF_NAME AS Conference,
    AVG(r.OVR_RATING) AS AverageRating
FROM
    cfb.CONFERENCES c
JOIN
    cfb.CONFERENCE_MATCH cm ON c.CONF_ID = cm.CONF_ID
JOIN
    cfb.RATING_MATCH rm ON cm.TEAM_ID = rm.TEAM_ID
JOIN
    cfb.RATING r ON rm.RATING_ID = r.RATING_ID
GROUP BY
    c.CONF_NAME;

