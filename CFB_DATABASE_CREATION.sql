CREATE SCHEMA `cfb` ;
CREATE TABLE cfb.BOWL_GAMES (
    GAME_ID INT PRIMARY KEY,
    GAME_NAME VARCHAR(200)
);
INSERT INTO cfb.BOWL_GAMES (GAME_ID, GAME_NAME) VALUES
(1, 'Sugar Bowl'), (2, 'Rose Bowl'), (3, 'Fiesta Bowl'), (4, 'Citrus Bowl'), (5, 'Arizona Bowl'),
(6, 'Orange Bowl'), (7, 'Transperfect Music City Bowl'), (8, 'Chick-Fil-A Peach Bowl'), (9, 'Cotton Bowl'),
(10, 'Gator Bowl'), (11, 'Alamo Bowl'), (12, 'Pop-Tarts Bowl'), (13, 'Pinstripe Bowl'), (14, 'Wasabi Fenway Bowl'),
(15, 'Texas Bowl'), (16, 'Holiday Bowl'), (17, 'Guaranteed Rate Bowl'), (18, 'Servpro First Responder Bowl'),
(19, 'Quick Lane Bowl'), (20, 'Hawai''i Bowl'), (21, 'Las Vegas Bowl'), (22, 'Famous Idaho Potato Bowl'),
(23, 'La Bowl'), (24, 'Isleta New Mexico Bowl'), (25, 'Cure Bowl'), (26, 'R+L Carriers New Orleans Bowl'),
(27, 'ReliaQuest Bowl'), (28, 'Bahama''s Bowl'); 

CREATE TABLE cfb.CONFERENCES (
    CONF_ID INT PRIMARY KEY,
    CONF_NAME VARCHAR(200)
);

INSERT INTO cfb.CONFERENCES (CONF_ID, CONF_NAME) VALUES
(1, 'Big Ten'),
(2, 'SEC'),
(3, 'ACC'),
(4, 'Pac-12'),
(5, 'Big 12'),
(6, 'AAC'),
(7, 'MAC'),
(8, 'Mountain West'),
(9, 'Conference USA'),
(10, 'Sun Belt'),
(11, 'Independents');

CREATE TABLE cfb.TEAMS (
    TEAM_ID INT PRIMARY KEY,
    TEAM_NAME VARCHAR(200)
);

INSERT INTO cfb.TEAMS (TEAM_ID, TEAM_NAME) VALUES
(1, 'Michigan'),
(2, 'Ohio State'),
(3, 'Penn State'),
(4, 'Iowa'),
(5, 'Rutgers'),
(6, 'Maryland'),
(7, 'Northwestern'),
(8, 'Wisconsin'),
(9, 'Georgia'),
(10, 'Alabama'),
(11, 'Missouri'),
(12, 'LSU'),
(13, 'Ole Miss'),
(14, 'Tennessee'),
(15, 'Kentucky'),
(16, 'Auburn'),
(17, 'Texas A&M'),
(18, 'Florida State'),
(19, 'Louisville'),
(20, 'North Carolina'),
(21, 'Miami'),
(22, 'Boston College'),
(23, 'Duke'),
(24, 'NC State'),
(25, 'Clemson'),
(26, 'Georgia Tech'),
(27, 'USC'),
(28, 'Oregon State'),
(29, 'Washington'),
(30, 'Oregon'),
(31, 'Utah'),
(32, 'UCLA'),
(33, 'Arizona'),
(34, 'Oklahoma'),
(35, 'Texas'),
(36, 'Kansas'),
(37, 'Kansas State'),
(38, 'Oklahoma State'),
(39, 'West Virginia'),
(40, 'Iowa State'),
(41, 'Texas Tech'),
(42, 'Notre Dame'),
(43, 'Tulane'),
(44, 'Memphis'),
(45, 'UTSA'),
(46, 'SMU'),
(47, 'Miami-OH'),
(48, 'Toledo'),
(49, 'Ohio'),
(50, 'Bowling Green'),
(51, 'Fresno State'),
(52, 'Air Force'),
(53, 'UNLV'),
(54, 'Wyoming'),
(55, 'Boise State'),
(56, 'San Jose State'),
(57, 'Liberty'),
(58, 'New Mexico State'),
(59, 'Western Kentucky'),
(60, 'Georgia State'),
(61, 'Georgia Southern'),
(62, 'Troy'),
(63, 'Texas State'),
(64, 'Coastal Carolina'),
(65, 'Appalachian State'),
(66, 'Arkansas State'),
(67, 'South Alabama');

CREATE TABLE cfb.CONFERENCE_MATCH (
    CONF_ID INT,
    TEAM_ID INT,
    PRIMARY KEY (CONF_ID, TEAM_ID),
    FOREIGN KEY (CONF_ID) REFERENCES cfb.CONFERENCES(CONF_ID),
    FOREIGN KEY (TEAM_ID) REFERENCES cfb.TEAMS(TEAM_ID)
);
INSERT INTO cfb.CONFERENCE_MATCH (CONF_ID, TEAM_ID) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8),
(2, 9), (2, 10), (2, 11), (2, 12), (2, 13), (2, 14), (2, 15), (2, 16), (2, 17),
(3, 18), (3, 19), (3, 20), (3, 21), (3, 22), (3, 23), (3, 24), (3, 25), (3, 26),
(4, 27), (4, 28), (4, 29), (4, 30), (4, 31), (4, 32), (4, 33),
(5, 34), (5, 35), (5, 36), (5, 37), (5, 38), (5, 39), (5, 40), (5, 41),
(11, 42),
(6, 43), (6, 44), (6, 45), (6, 46),
(7, 47), (7, 48), (7, 49), (7, 50),
(8, 51), (8, 52), (8, 53), (8, 54), (8, 55), (8, 56),
(9, 57), (9, 58), (9, 59),
(10, 60), (10, 61), (10, 62), (10, 63), (10, 64), (10, 65), (10, 66), (10, 67);

CREATE TABLE cfb.STANDINGS (
    STANDINGS_ID INT PRIMARY KEY,
    WINS INT,
    LOSSES INT,
    RANKING INT
);
INSERT INTO cfb.STANDINGS (STANDINGS_ID, WINS, LOSSES, RANKING) VALUES
(1, 11, 0, 1),
(2, 11, 0, 2),
(3, 11, 0, 3),
(4, 11, 0, 4),
(5, 11, 0, 5),
(6, 10, 1, 6),
(7, 10, 1, 7),
(8, 10, 1, 8),
(9, 10, 1, 9),
(10, 9, 2, 10),
(11, 9, 2, 11),
(12, 9, 2, 12),
(13, 9, 2, 13),
(14, 8, 3, 14),
(15, 8, 3, 15),
(16, 8, 3, 16),
(17, 8, 3, 17),
(18, 10, 1, 18),
(19, 8, 3, 19),
(20, 9, 2, 20),
(21, 8, 3, 21),
(22, 11, 0, 22),
(23, 10, 1, 23),
(24, 7, 4, 24),
(25, 7, 4, 25),
(26, 9, 3, NULL),
(27, 9, 3, NULL),
(28, 9, 3, NULL),
(29, 9, 2, NULL),
(30, 9, 2, NULL),
(31, 9, 2, NULL),
(32, 9, 2, NULL),
(33, 8, 4, NULL),
(34, 8, 4, NULL),
(35, 8, 3, NULL),
(36, 8, 3, NULL),
(37, 8, 3, NULL),
(38, 7, 5, NULL),
(39, 7, 5, NULL),
(40, 7, 5, NULL),
(41, 7, 5, NULL),
(42, 7, 4, NULL),
(43, 7, 4, NULL),
(44, 7, 4, NULL),
(45, 7, 4, NULL),
(46, 7, 4, NULL),
(47, 7, 4, NULL),
(48, 7, 4, NULL),
(49, 7, 4, NULL),
(50, 6, 6, NULL),
(51, 6, 6, NULL),
(52, 6, 5, NULL),
(53, 6, 5, NULL),
(54, 6, 5, NULL),
(55, 6, 5, NULL),
(56, 6, 5, NULL),
(57, 6, 5, NULL),
(58, 6, 5, NULL),
(59, 6, 5, NULL),
(60, 6, 5, NULL),
(61, 6, 5, NULL),
(62, 6, 5, NULL),
(63, 6, 5, NULL),
(64, 6, 5, NULL),
(65, 6, 5, NULL),
(66, 6, 5, NULL),
(67, 6, 5, NULL);

CREATE TABLE cfb.RATING (
    RATING_ID INT PRIMARY KEY,
    OVR_RATING DECIMAL(5, 2)
);
INSERT INTO cfb.RATING (RATING_ID, OVR_RATING) VALUES
(1, 96.36),
(2, 96.16),
(3, 91.63),
(4, 78.82),
(5, 72.74),
(6, 76.5),
(7, 71.01),
(8, 75.95),
(9, 95.7),
(10, 95.04),
(11, 80.88),
(12, 88.98),
(13, 83.54),
(14, 83.38),
(15, 75.59),
(16, 77.26),
(17, 84.79),
(18, 87.54),
(19, 81.97),
(20, 79.53),
(21, 76.4),
(22, 65.65),
(23, 75.68),
(24, 76.72),
(25, 82.67),
(26, 69.94),
(27, 80.7),
(28, 84.38),
(29, 87.8),
(30, 93.54),
(31, 81.54),
(32, 79.58),
(33, 81.17),
(34, 89.12),
(35, 90.58),
(36, 79.52),
(37, 89.71),
(38, 80.65),
(39, 77.37),
(40, 79.66),
(41, 79.03),
(42, 88.36),
(43, 72.26),
(44, 70.2),
(45, 73.4),
(46, 78.77),
(47, 67.83),
(48, 71.02),
(49, 66.18),
(50, 62.16),
(51, 68.29),
(52, 70.34),
(53, 70.64),
(54, 66.94),
(55, 78.89),
(56, 70.83),
(57, 72.25),
(58, 63.67),
(59, 63.18),
(60, 60.13),
(61, 62.65),
(62, 74.6),
(63, 58.56),
(64, 67.58),
(65, 71.23),
(66, 60.63),
(67, 69.64);

CREATE TABLE cfb.RATING_MATCH (
    RATING_ID INT,
    TEAM_ID INT,
    PRIMARY KEY (RATING_ID, TEAM_ID),
    FOREIGN KEY (RATING_ID) REFERENCES cfb.RATING(RATING_ID),
    FOREIGN KEY (TEAM_ID) REFERENCES cfb.TEAMS(TEAM_ID)
);
INSERT INTO cfb.RATING_MATCH (RATING_ID, TEAM_ID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30),
(31, 31),
(32, 32),
(33, 33),
(34, 34),
(35, 35),
(36, 36),
(37, 37),
(38, 38),
(39, 39),
(40, 40),
(41, 41),
(42, 42),
(43, 43),
(44, 44),
(45, 45),
(46, 46),
(47, 47),
(48, 48),
(49, 49),
(50, 50),
(51, 51),
(52, 52),
(53, 53),
(54, 54),
(55, 55),
(56, 56),
(57, 57),
(58, 58),
(59, 59),
(60, 60),
(61, 61),
(62, 62),
(63, 63),
(64, 64),
(65, 65),
(66, 66),
(67, 67);

CREATE TABLE cfb.GAME_MATCH (
    GAME_ID INT,
    TEAM_ID INT,
    PRIMARY KEY (GAME_ID, TEAM_ID),
    FOREIGN KEY (GAME_ID) REFERENCES cfb.BOWL_GAMES(GAME_ID),
    FOREIGN KEY (TEAM_ID) REFERENCES cfb.TEAMS(TEAM_ID)
);
INSERT INTO cfb.GAME_MATCH (GAME_ID, TEAM_ID) VALUES
(1, 9), (1, 35),
(2, 30), (2, 1),
(3, 11), (3, 29),
(4, 3), (4, 13),
(5, 48), (5, 51),
(6, 2), (6, 19),
(7, 8), (7, 16),
(8, 18), (8, 43),
(9, 10), (9, 34),
(10, 14), (10, 24),
(11, 33), (11, 38),
(12, 20), (12, 37),
(13, 5), (13, 23),
(14, 22), (14, 44),
(15, 17), (15, 36),
(16, 25), (16, 27),
(17, 6), (17, 39),
(18, 41), (18, 46),
(19, 7), (19, 47),
(20, 45), (20, 52),
(21, 4), (21, 31),
(22, 49), (22, 55),
(23, 53), (23, 32),
(24, 54), (24, 58),
(25, 56), (25, 63),
(26, 57), (26, 62),
(27, 12), (27, 42),
(28, 50), (28, 59);

CREATE TABLE cfb.OFF_STATS (
    TEAM_ID INT PRIMARY KEY,
    GAMES_PLAYED INT,
    OFF_PASS_CMP DECIMAL(5, 2),
    OFF_PASS_ATT DECIMAL(5, 2),
    OFF_PASS_PCT DECIMAL(5, 2),
    OFF_PASS_YDS DECIMAL(5, 2),
    OFF_PASS_TD DECIMAL(5, 2),
    OFF_RUSH_ATT DECIMAL(5, 2),
    OFF_RUSH_YDS DECIMAL(5, 2),
    OFF_RUSH_AVG DECIMAL(5, 2),
    OFF_RUSH_TD DECIMAL(5, 2),
    OFF_PLAYS DECIMAL(5, 2),
    OFF_YDS DECIMAL(5, 2),
    OFF_AVG_YDS_PLAY DECIMAL(5, 2),
    OFF_PASS_FIRST_DOWNS DECIMAL(5, 2),
    OFF_RUSH_FIRST_DOWNS DECIMAL(5, 2),
    OFF_PENALTY_FIRST_DOWNS DECIMAL(5, 2),
    OFF_TOTAL_FIRST_DOWNS DECIMAL(5, 2),
    OFF_PENALTIES DECIMAL(5, 2),
    OFF_PENALTY_YARDS DECIMAL(5, 2),
    OFF_FUMBLES DECIMAL(5, 2),
    OFF_INTERCEPTIONS DECIMAL(5, 2),
    OFF_TURNOVERS DECIMAL(5, 2),
    FOREIGN KEY (TEAM_ID) REFERENCES cfb.TEAMS(TEAM_ID)
);
INSERT INTO cfb.OFF_STATS (TEAM_ID, GAMES_PLAYED, OFF_PASS_CMP, OFF_PASS_ATT, OFF_PASS_PCT, OFF_PASS_YDS, OFF_PASS_TD, OFF_RUSH_ATT, OFF_RUSH_YDS, OFF_RUSH_AVG, OFF_RUSH_TD, OFF_PLAYS, OFF_YDS, OFF_AVG_YDS_PLAY, OFF_PASS_FIRST_DOWNS, OFF_RUSH_FIRST_DOWNS, OFF_PENALTY_FIRST_DOWNS, OFF_TOTAL_FIRST_DOWNS, OFF_PENALTIES, OFF_PENALTY_YARDS, OFF_FUMBLES, OFF_INTERCEPTIONS, OFF_TURNOVERS)
VALUES
(1, 11, 17.6, 24, 73.5, 228.6, 1.8, 38.2, 171, 4.5, 2.8, 62.2, 399.6, 6.4, 11.3, 8.6, 1.5, 21.5, 2.9, 25.7, 0.2, 0.5, 0.6),
(2, 11, 20.6, 31.5, 65.6, 283.7, 2.2, 33.6, 145.5, 4.3, 1.7, 65.1, 429.3, 6.6, 13, 7.2, 1.7, 21.9, 5.9, 47, 0.5, 0.5, 0.9),
(3, 11, 18.8, 31.4, 60, 195.4, 2.2, 40.7, 177.9, 4.4, 2.2, 72.1, 373.3, 5.2, 9.9, 10.6, 2, 22.5, 5, 43.9, 0.5, 0.1, 0.5),
(4,11,12,23.9,50.2,126.1,0.8,35.1,119.3,3.4,0.9,59,245.4,4.2,5.5,6,2,13.5,3.4,30.5,0.6,0.7,1.4),
(5,11,11.1,22.3,49.8,139.9,0.8,38.8,163.2,4.2,1.7,61.1,303.1,5,6.6,9.5,1.2,17.3,4.7,40.8,0.5,0.6,1.1),
(6,11,24.8,38.2,65,277.9,2,29.2,106.4,3.6,1.5,67.4,384.3,5.7,12.4,7.1,1.8,21.3,5.5,54.5,0.6,1,1.6),
(7,11,24.8,38.2,65,277.9,2,29.2,106.4,3.6,1.5,67.4,384.3,5.7,12.4,7.1,1.8,21.3,5.5,54.5,0.6,1,1.6),
(8,11,21.8,37,59,212.7,0.8,34.2,154.4,4.5,1.7,71.2,367.1,5.2,10,8.6,1.2,19.8,5.7,48.2,1,0.4,1.4),
(9,11,24.9,34.5,72.3,323.2,2.2,34.9,178.6,5.1,2.6,69.4,501.8,7.2,14.6,9.6,1.5,25.8,4.2,39.5,0.5,0.5,1),
(10,11,14.8,23.2,63.9,229,1.7,39.4,176.3,4.5,2.5,62.5,405.3,6.5,9.1,9.7,1.4,20.2,5.8,48.4,0.4,0.5,0.9),
(11,11,20.5,30.7,66.6,288.2,1.8,36.4,161.4,4.4,1.9,67.1,449.5,6.7,11.8,9.1,1.5,22.5,7.2,54.9,0.2,0.6,0.8),
(12,11,21.7,31.1,69.9,343.3,3.4,34.3,218.9,6.4,2.7,65.4,562.2,8.6,13.8,10.4,2.1,26.3,6.2,50.6,0.3,0.4,0.6),
(13,11,19.6,29.7,66.1,293,2,39.9,175.9,4.4,2.5,69.6,468.9,6.7,11.8,9.7,1.5,23,7.5,64.7,0.1,0.5,0.6),
(14,11,19.9,31.2,63.8,232.9,1.5,36.6,205.7,5.6,1.6,67.8,438.6,6.5,9.9,10.2,0.6,20.7,8,67.7,0.5,0.5,1),
(15,11,16.6,29.5,56.3,203.5,1.8,26.5,135.2,5.1,1.4,56,338.7,6,9.5,5.8,2.2,17.5,6.8,56,0.5,0.8,1.4),
(16,11,14.7,23.5,62.8,162.9,1.5,39.6,194.3,4.9,1.7,63.1,357.2,5.7,6.5,10.5,1.5,18.5,5.6,46,0.4,0.8,1.2),
(17,11,20.7,32.4,64,259.5,2,35.5,145.5,4.1,1.7,67.8,405,6,11.3,8.8,2.4,22.5,6.5,48.3,0.4,0.7,1.1),
(18,11,20.9,32.6,64.1,289.5,2.3,32.9,162.3,4.9,2.5,65.5,451.7,6.9,12.4,7.2,1.8,21.4,6.7,64.2,0.3,0.2,0),
(19,11,18.8,28.5,65.9,256.3,1.8,37.4,185.5,5,2.3,65.9,441.8,6.7,10.7,9,1.8,21.5,6,49.9,0.3,0.9,1.2),
(20,11,22.9,35.9,63.8,311.6,2.1,39.6,203.2,5.1,2.5,75.5,514.8,6.8,12.1,11.4,1.9,25.4,6.9,63.9,0.4,0.6,1),
(21,11,21.8,33.5,65,262.1,1.8,33.5,170.8,5.1,1.6,67,432.9,6.5,11.5,8.5,1.5,21.5,6.5,61.6,0.6,1.2,1),
(22,11,16.2,28.9,56,192.6,1.3,43.6,198.1,4.5,1.8,72.5,390.7,5.4,7.8,12.5,1.9,22.3,6.9,58.8,0.5,1,1.5),
(23,11,14.6,26.5,55.3,175.3,1.1,34.5,178,5.2,2.2,61,353.3,5.8,9.1,7.8,2.1,19,5.4,42.4,0.5,0.5,1.1),
(24,11,17.1,29,58.9,183.9,1.5,36.5,148.1,4.1,1.5,65.5,332,5.1,8.5,7.8,1.6,17.9,5.8,47.4,0.3,1,1.3),
(25,11,23.4,36.9,63.3,236.8,1.8,39.9,176.7,4.4,1.8,76.8,413.5,5.4,12,9.8,1.9,23.7,4.7,43.5,1.2,0.6,1.8),
(26,11,19.4,31.4,61.7,238.7,2.4,35.9,196.4,5.5,1.8,67.3,435.1,6.5,10.4,10.3,1.8,22.5,5.4,48.4,0.4,1.5,1.8),
(27,12,24.3,35.7,68,329.8,2.6,28.6,139.9,4.9,2.8,64.3,469.7,7.3,14,7.1,1.8,22.9,7.9,71.4,0.9,0.4,1),
(28,11,16.9,28.8,58.7,248.5,2.2,36.8,192.5,5.2,2.4,65.6,440.9,6.7,11.1,10.8,1,22.9,6,55.3,0.5,0.5,1),
(29,11,24.8,37.3,66.6,358.4,2.8,26.6,124.5,4.7,2.1,63.9,482.8,7.6,15.1,6.5,2.4,24,8,78.3,0.6,0.7,1.4),
(30,11,28.2,36.2,77.9,350,3.5,32.7,195.7,6,2.6,68.9,545.7,7.9,14.8,10.6,1.7,27.2,7.5,67.5,0.2,0.4,0.5),
(31,11,15.8,27.6,57.2,183.8,1.4,41.6,178.8,4.3,1.5,69.3,362.6,5.2,7.7,9.8,1.5,19,5.5,45.1,0.1,0.8,0.9),
(32,11,17.1,30.5,56.1,221.8,1.8,41.4,202.1,4.9,1.7,71.8,423.9,5.9,10.1,10.2,1.5,21.7,6.8,56.8,0.5,1.1,1.6),
(33,11,25.3,35,72.2,284.3,2.6,31.5,154.1,4.9,1.2,66.5,438.4,6.6,12.7,9,1.9,23.6,6.5,53.1,0.3,0.8,1.1),
(34,11,23.6,33.6,70.3,314.7,2.6,40.5,178.2,4.4,2.4,74.2,492.9,6.6,13.5,9.9,2,25.4,6.8,58,0.6,0.5,1.1),
(35,11,21.4,32.1,66.8,272.1,1.7,38.3,188.3,4.9,1.9,70.3,460.4,6.5,12.3,9,1,22.3,6.3,49.8,0.6,0.7,1.3),
(36,11,15.3,24.2,63.2,220.2,1.5,38.7,202.2,5.2,2.4,62.9,422.4,6.7,10,9.5,1.8,21.3,4.6,43.5,0.5,0.7,1.3),
(37,11,20,31.5,63.4,242.6,2.5,39.9,198.8,5,2.5,71.5,441.5,6.2,11.2,10.6,1.5,23.3,4.6,41.6,0.2,0.8,1),
(38,11,23.3,39.5,58.9,260.4,1.2,32.8,166.1,5.1,2,72.4,426.5,5.9,12.8,7.2,1.2,21.2,5.2,42.8,0.4,1,1.4),
(39,11,13.6,25.7,53,197.9,1.4,45.3,232.9,5.1,2.6,71,430.8,6.1,7.7,12.8,2.3,22.8,4.8,43.4,0.5,0.6,1.2),
(40,11,19.2,29.9,64.1,228.1,1.5,30.8,118.3,3.8,1.2,60.7,346.4,5.7,9.9,5.6,1.1,16.6,4.9,43.4,0.1,0.7,0.8),
(41,11,21.4,35.5,60.3,221.1,1.8,36.4,165.8,4.6,1.3,71.9,386.9,5.4,10.3,9.9,1.7,21.8,5.6,52.8,0.3,1.4,1.8),
(42,11,18.5,28.8,64.4,257.5,2.4,32.8,163.4,5,1.9,61.6,420.9,6.8,11.3,8,1,20.3,5.5,50.8,0.5,0.6,1.2),
(43,11,16.3,25.9,62.7,221.1,2,39,167.3,4.3,1.2,64.9,388.3,6,9.5,9,0.9,19.4,4.9,44.8,0.8,0.5,1.3),
(44,11,24.7,37.2,66.4,301.4,2.4,33.1,150.8,4.6,2.5,70.3,452.3,6.4,13.4,7.8,1.6,22.8,4.4,44.7,0.4,0.8,1.3),
(45,11,22.3,34.6,64.6,249.8,1.9,39.6,174.8,4.4,2,74.2,424.6,5.7,11.3,10.3,1.3,22.9,5.7,50.5,0.6,1,1.6),
(46,11,19.4,32.3,60,284.9,2.5,40.5,185.6,4.6,2.2,72.8,470.5,6.5,11.8,10.1,2.6,24.5,4.5,39.9,0.3,0.5,0.8),
(47,11,12.6,22.1,57.2,181.2,1.4,35.8,162.5,4.5,1.7,57.9,343.6,5.9,7.5,6.9,1.7,16.2,4.9,39.4,0.6,0.5,1.1),
(48,11,16.7,25.6,65.1,219.3,2.1,39.7,211.6,5.3,2.4,65.3,430.9,6.6,10.2,9.3,1.8,21.3,6.6,59.9,0.8,0.7,1.5),
(49,11,19,30.6,62.1,210.6,1.3,36.6,137.1,3.7,1.2,67.2,347.7,5.2,9.8,8.8,2.4,21.1,5.6,51.1,0.3,0.8,1),
(50,12,16.1,26.7,60.3,185.7,1.3,34,142.2,4.2,1.7,60.7,327.8,5.4,7.4,8.1,1.2,16.7,7.1,63.4,0.4,1.2,1.6),
(51,11,25.9,40.1,64.6,281.7,2.4,29.3,100.1,3.4,1.2,69.4,381.8,5.5,13.3,6.4,1.7,21.4,4.5,40.8,0.1,0.9,1),
(52,11,4.3,8.3,52,88.3,0.5,54.7,275.8,5,2.8,63,364.1,5.8,3.5,14.3,2,19.8,3.3,26.8,0.9,0.5,1.4),
(53,11,17.4,27.5,63,237.3,1.2,41.3,188.3,4.6,3,68.8,425.5,6.2,10.3,8.9,1.4,20.5,6.9,60.9,0.5,0.7,1.2),
(54,11,14.2,23.5,60.2,167.5,1.6,34.9,149.6,4.3,1.4,58.5,317.1,5.4,7.8,8.2,1.7,17.7,4.1,35.9,0.5,0.5,1),
(55,11,16,28,57.1,229.6,1.5,39.3,207.7,5.3,2.4,67.3,437.3,6.5,9.8,10.9,1.3,22,3.8,33.3,0.7,0.9,1.6),
(56,11,17.7,29,61.1,217.2,1.6,33.1,181.9,5.5,2.5,62.1,399.1,6.4,9.5,9.4,1.7,20.6,5.5,44.1,0.4,0.4,0.7),
(57,11,12.5,21.9,57.3,219,2.5,48.6,282.2,5.8,2.6,70.5,501.2,7.1,8.3,14.5,2.1,24.9,6.3,64.5,0.7,0.5,1.2),
(58,12,15,24.9,60.2,213.1,1.9,34.5,206.3,6,1.6,59.4,419.3,7.1,8.9,9.8,1.4,20.1,6.4,62.8,0.3,0.5,0.8),
(59,11,24.5,40.2,60.9,283.8,2.5,26.4,111.2,4.2,1.1,66.5,395,5.9,12.1,5.8,1.5,19.4,4.5,37.9,0.5,1.1,1.5),
(60,11,18.5,28.1,66,200.7,1.4,38.5,178.4,4.6,1.9,66.6,379.1,5.7,8.2,9.4,1.8,19.4,5.8,51.7,0.6,0.5,1.1),
(61,11,28.9,45.1,64.1,300.2,2.1,30.2,128,4.2,1.3,75.3,428.2,5.7,14.4,7.5,2.3,24.1,5.5,48.5,0.7,1.3,2),
(62,11,20,32.6,61.3,269.6,2.3,35.7,153.3,4.3,1.1,68.4,422.9,6.2,11.2,7.5,2.1,20.8,5.7,50,0.9,0.4,1.3),
(63,11,23,33.8,68,272.9,1.9,40.5,197.1,4.9,2.5,74.4,470,6.3,11.7,11.5,1.7,25,7,65.9,1.2,0.7,1.9),
(64,11,21.1,31.6,66.7,268,1.8,36.4,163.5,4.5,1.5,68,431.5,6.3,11.1,8,2.6,21.7,5.5,54.5,0.5,0.8,1.3),
(65,11,21,33.2,63.3,277.1,2.7,38.1,171.5,4.5,1.5,71.3,448.6,6.3,13.2,8.2,2.3,23.6,4.5,42.9,0.7,0.7,1.5),
(66,11,15.7,27.5,57.3,219.8,1.3,36.6,162.1,4.4,1.7,64.1,381.9,6,9.7,8.5,1.7,19.9,6.1,59.5,0.3,0.6,0.9),
(67, 11, 21.1, 31.5, 66.9, 252.7, 1.6, 36.2, 167.2, 4.6, 2.2, 67.7, 419.9, 6.2, 11.2, 9.4, 1.2, 21.7, 6.7, 57.6, 0.7, 0.8, 1.5);

CREATE TABLE cfb.DEF_STATS (
    TEAM_ID INT,
    GAMES_PLAYED INT,
    DEF_PASS_CMP DECIMAL(10, 2),
    DEF_PASS_ATT DECIMAL(10, 2),
    DEF_PASS_PCT DECIMAL(10, 2),
    DEF_PASS_YDS DECIMAL(10, 2),
    DEF_PASS_TD DECIMAL(10, 2),
    DEF_RUSH_ATT DECIMAL(10, 2),
    DEF_RUSH_YDS DECIMAL(10, 2),
    DEF_RUSH_AVG DECIMAL(10, 2),
    DEF_RUSH_TD DECIMAL(10, 2),
    DEF_PLAYS DECIMAL(10, 2),
    DEF_YDS DECIMAL(10, 2),
    DEF_AVG_YDS_PLAY DECIMAL(10, 2),
    DEF_PASS_FIRST_DOWNS DECIMAL(10, 2),
    DEF_RUSH_FIRST_DOWNS DECIMAL(10, 2),
    DEF_PENALTY_FIRST_DOWNS DECIMAL(10, 2),
    DEF_TOTAL_FIRST_DOWNS DECIMAL(10, 2),
    DEF_PENALTIES DECIMAL(10, 2),
    DEF_PENALTY_YARDS DECIMAL(10, 2),
    DEF_FUMBLES DECIMAL(10, 2),
    DEF_INTERCEPTIONS DECIMAL(10, 2),
    DEF_TURNOVERS DECIMAL(10, 2),
    FOREIGN KEY (TEAM_ID) REFERENCES cfb.TEAMS(TEAM_ID)
);

INSERT INTO cfb.DEF_STATS (
    TEAM_ID, GAMES_PLAYED, DEF_PASS_CMP, DEF_PASS_ATT, DEF_PASS_PCT, DEF_PASS_YDS, DEF_PASS_TD, 
    DEF_RUSH_ATT, DEF_RUSH_YDS, DEF_RUSH_AVG, DEF_RUSH_TD, DEF_PLAYS, DEF_YDS, DEF_AVG_YDS_PLAY, 
    DEF_PASS_FIRST_DOWNS, DEF_RUSH_FIRST_DOWNS, DEF_PENALTY_FIRST_DOWNS, DEF_TOTAL_FIRST_DOWNS, 
    DEF_PENALTIES, DEF_PENALTY_YARDS, DEF_FUMBLES, DEF_INTERCEPTIONS, DEF_TURNOVERS
) VALUES 
(1, 11, 13.6, 25.4, 53.8, 144.8, 0.5, 30.5, 90, 3, 0.5, 55.8, 234.8, 4.2, 6.4, 5.4, 0.6, 12.4, 5.5, 46.3, 0.5, 1.3, 1.7),
(2, 11, 15.5, 30.6, 50.4, 144.4, 0.6, 32.7, 108.5, 3.3, 0.3, 63.4, 252.9, 4, 7.3, 6.1, 1.7, 15.1, 4.7, 41.4, 0.4, 0.6, 1),
(3,11,14.6,25.4,57.7,159.5,0.6,32.7,79.2,2.4,0.8,58.1,238.7,4.1,6.9,4.8,1.5,13.3,5.5,44.9,1.1,1,2.1),
(4,11,19.6,35.8,54.8,173,0.8,34.5,108.4,3.1,0.2,70.4,281.4,4,8.6,6.7,1.2,16.5,6.7,57.5,0.3,0.8,1.1),
(5,11,16.3,28.3,57.6,159.1,1.1,34.9,137.8,3.9,1,63.2,296.9,4.7,6.9,9.2,1.5,17.5,3.8,34.5,0.7,0.6,1.4),
(6,11,18.4,30.7,59.8,211.2,1.4,36.4,124.1,3.4,1,67.1,335.3,5,9.8,8.7,2.2,20.7,6,53.4,0.5,1.3,1.7),
(7,11,18,28.1,64.1,177.9,1,38.3,164.3,4.3,1.7,66.4,342.2,5.2,8.3,9.4,1.1,18.7,4.5,41,0.5,0.8,1.4),
(8,11,18.8,31.3,60.2,195.8,1.4,36.5,140,3.8,0.9,67.7,335.8,5,9.4,7.5,1.2,18,5.9,49.5,0.3,1,1.3),
(9,11,18.2,32.3,56.3,178.2,1,28.3,109.9,3.9,0.9,60.5,288.1,4.8,8.2,6.4,1,15.5,5.5,40.9,0.1,1.1,1.2),
(10,11,18.3,30.9,59.1,192.5,1.2,33.2,117.9,3.6,0.8,64.1,310.5,4.8,8.1,6.5,1.5,16,5.5,40,0.4,0.9,1.3),
(11,11,20.5,32.7,62.8,233.5,1.9,31.5,124.8,4,0.6,64.3,358.3,5.6,9.9,7.2,1.9,19,7.5,61,0.4,0.8,1.2),
(12,11,19.6,31.4,62.6,241,1.6,35.2,169.9,4.8,1.9,66.5,410.9,6.2,10.6,9.1,1.2,20.9,7.4,59.5,0.3,0.8,1.1),
(13,11,18.8,30.5,61.8,221.2,1.3,40,157,3.9,1.6,70.5,378.2,5.4,10.1,8.7,1.9,20.7,5.7,46.8,0.4,1.1,1.5),
(14,11,21.8,32.5,67.2,235.5,1.2,36.1,117,3.2,1.1,68.5,352.5,5.1,10.3,6.5,2.4,19.2,5.2,36.3,0.5,0.9,1.4),
(15,11,21.5,32.4,66.6,238.2,1.6,33.5,109.6,3.3,1.2,65.8,347.8,5.3,11.1,7.1,1.6,19.8,6.9,62.4,0.5,0.8,1.3),
(16,11,16.9,28.1,60.2,196.5,1.4,35.2,156.5,4.4,1.2,63.3,352.9,5.6,8,8.1,0.9,17,6.9,56.9,0.5,1,1.5),
(17,11,15.1,26.5,57,184.1,1.2,33.1,102.4,3.1,0.5,59.5,286.5,4.8,8.2,5.4,1.4,14.9,8.8,76.3,0.4,0.6,1),
(18,11,14.4,30.5,47.2,183.5,0.7,34.9,139.6,4,1,65.4,323.1,4.9,7.3,7.5,2.5,17.3,7.7,61.1,0.6,0.7,1.4),
(19,11,17.1,30.9,55.3,219,1.2,30.1,98,3.3,1,61,317,5.2,8.6,5.6,1.6,15.9,6.8,58.7,0.6,1,1.6),
(20,11,21.3,34.3,62.1,234,1.5,39.2,162.5,4.1,1.7,73.5,396.5,5.4,11.6,8.8,2.1,22.5,6.7,54.2,0.8,1.1,1.9),
(21,11,18.5,32.4,57,233.9,1.4,31,92.9,3,1.2,63.4,326.8,5.2,9.6,5.6,2.1,17.4,6.2,51,0.5,0.9,1.5),
(22,11,13.4,22.7,58.8,189.3,1.5,35.5,189.4,5.3,2.3,58.3,378.6,6.5,8.3,8,1.7,18,6.3,49.9,0.6,0.7,1.4),
(23,11,19.4,31.3,61.9,203.1,0.8,37.7,155.7,4.1,1.3,69,358.8,5.2,10.3,9.3,0.9,20.5,6.2,54,0.5,0.7,1.2),
(24,11,18.4,32,57.4,215.5,1.5,28.9,102.5,3.5,0.9,60.9,318,5.2,9.3,5.5,1.5,16.2,6,53.5,0.5,1.4,1.9),
(25,11,16.4,31,52.8,166.7,1,31.7,121.9,3.8,1.3,62.7,288.6,4.6,7.1,5.9,1.6,14.6,5.7,49.6,0.8,1.2,2),
(26,11,17.7,28.6,61.9,215.9,1.4,42,222.4,5.3,2.3,70.6,438.3,6.2,9,11.5,1.7,22.2,6.5,58.5,0.8,1.1,1.9),
(27,12,20.5,32.7,62.8,255.2,2.6,38.4,183.7,4.8,1.8,71.1,438.8,6.2,10.8,9.3,2.6,22.8,6.5,55.5,0.6,0.6,1.2),
(28,11,19.6,33.4,58.9,224.3,1.6,30.6,103.3,3.4,0.9,64,327.5,5.1,9.5,7.3,2.2,18.9,5.4,36.5,0.6,1.1,1.7),
(29,11,23.5,39.8,58.9,260.5,1.5,32.8,141,4.3,1.5,72.6,401.5,5.5,11.2,8.8,3.1,23.1,6.6,61.3,0.2,1.2,1.4),
(30,11,21.2,35.6,59.4,213.8,1.1,28.4,96.2,3.4,0.7,64,310,4.8,9.7,5.9,2.1,17.7,5.5,45.5,0.5,0.8,1.3),
(31,11,18.5,32.5,57.1,224.3,1.2,27,88.5,3.3,1.2,59.5,312.8,5.3,9.4,4.5,1.4,15.3,7.4,55,0.5,0.7,1.3),
(32,11,22,36.3,60.7,234.1,1.3,29.7,64.6,2.2,0.3,66,298.7,4.5,10.6,4.9,1.8,17.4,5.7,50.1,0.8,1.1,1.9),
(33,11,20.2,33.2,60.8,243,1.1,31.5,101.1,3.2,1.5,64.6,344.1,5.3,10.8,6,2.3,19.1,7.5,65.5,0.5,0.4,0.9),
(34,11,19.4,34.4,56.3,232.9,1.1,36.9,145.1,3.9,1,71.3,378,5.3,10.2,7.7,1.9,19.8,5.9,45.5,0.5,1.6,2.2),
(35,11,21.5,35.5,60.8,253.9,1.5,29.1,82.7,2.8,0.5,64.5,336.6,5.2,11.3,5.2,1.4,17.8,4.5,35.2,0.5,1.1,1.6),
(36,11,19.4,28.7,67.4,219.5,1,36.9,161.3,4.4,2.2,65.6,380.8,5.8,10.6,8,1.6,20.3,4.9,45,0.4,1,1),
(37,11,20.5,36.1,56.7,230.2,1.2,31.5,129.5,4.1,0.9,67.6,359.6,5.3,10.3,6.3,1.5,18,5.7,51,0.7,1.1,1.8),
(38,11,17.9,29.9,59.9,256.1,2.1,37.3,175.8,4.7,1.4,67.2,431.9,6.4,9.5,8.8,1,19.4,5.8,45.9,0.6,1,1.6),
(39,11,19.6,33.6,58.4,242.2,2.2,32.8,146.6,4.5,1.3,66.5,388.8,5.9,10.7,8.4,1,20.1,6.3,57,0.4,0.8,1.2),
(40,11,18.4,33.3,55.2,211.3,1.5,33.6,124.5,3.7,0.7,66.9,335.8,5,9.6,7.3,1.8,18.7,4.4,37.4,0.3,1.4,1.6),
(41,11,20.5,34.4,59.8,226.5,1.3,36.8,155.5,4.2,1.4,71.2,382,5.4,10.4,8.3,1.9,20.5,5.1,43.4,0.3,0.8,1.1),
(42,11,14.3,27.5,52,148.5,0.6,35.5,127.5,3.6,1.1,62.9,276,4.4,7.3,6.7,2.2,16.2,4.5,37.5,0.6,1.3,1.9),
(43,11,22.9,34.5,66.3,246.2,1.3,28.2,77.7,2.8,0.8,62.7,323.9,5.2,11.5,5.4,1.5,18.3,4.3,35.6,0.5,1.1,1.5),
(44,11,19.3,31.4,61.4,246.2,1.8,36.6,171.2,4.7,1.8,68,417.4,6.1,10.3,8.5,1.7,20.5,5.1,44.5,0.8,0.9,1.7),
(45,11,20.9,36,58.1,241.3,1.5,36.3,129.5,3.6,1.2,72.3,370.8,5.1,10.9,7.6,1.5,20,4.5,41.1,0.5,0.8,1.4),
(46,11,18.7,31.7,59,194.5,1.5,35.2,112,3.2,0.7,66.9,306.5,4.6,9,6.2,1.8,17,6.9,67.4,0.4,0.8,1.2),
(47,11,18.1,30.6,59.1,200,0.9,35.1,118.5,3.4,0.9,65.7,318.5,4.8,8.6,7.2,1.8,17.6,7.2,62.5,0.4,0.6,1),
(48,11,16,30.9,51.8,185.3,1,36.8,146.5,4,1.3,67.7,331.8,4.9,8.6,8.3,2,18.9,6.2,54.4,0.5,1,1.5),
(49,11,16.8,27.3,61.7,170.5,1,29.5,101.4,3.4,0.6,56.8,271.8,4.8,7.3,5.3,1.7,14.3,6.3,59,0.5,1,1.5),
(50,12,16.2,27,59.9,192.7,1.6,35.4,137.2,3.9,1.2,62.4,329.8,5.3,8.5,8.9,1.5,18.9,5.4,41.8,0.9,1.3,2.3),
(51,11,17.7,31.9,55.6,219.5,1.6,37.4,162.9,4.4,1.2,69.3,382.4,5.5,10.4,9.4,1.6,21.4,6.5,57.8,0.5,1.5,2),
(52,11,16.6,27.3,61,176.7,1.3,30.1,88.5,2.9,0.8,57.4,265.3,4.6,7.5,5.6,1.1,14.2,5.9,55.4,0.4,0.6,1),
(53,11,17.7,30,59.1,238.9,1.5,36.3,144.5,4,1.5,66.3,383.4,5.8,9.7,7.6,2.2,19.5,4.8,42.4,0.8,1.2,2),
(54,11,20.2,33.5,60.2,218.6,1.6,37.2,156.1,4.2,1,70.7,374.7,5.3,11.2,8.7,1,20.9,4.5,39.2,0.9,0.8,1.7),
(55,11,20.2,32.5,62.2,266.1,1.5,31.1,120,3.9,1.6,63.5,386.1,6.1,11,6.7,1.3,19,5.5,43.5,0.6,0.7,1.4),
(56,11,16.4,27,60.6,177.4,1.4,37.6,172.1,4.6,1.8,64.6,349.5,5.4,9,9.6,0.5,19.2,6,51.7,0.7,1.1,1.8),
(57,11,21,36.5,57.5,239.9,1.9,29,111.3,3.8,0.7,65.5,351.2,5.4,9.9,7.5,2.2,19.5,6.1,55.2,0.4,1.7,2.1),
(58,12,19.8,31.8,62,231.9,1.2,32.4,129.8,4,1.3,64.3,361.8,5.6,10,7.8,2,19.8,6.1,49.7,0.4,0.3,0),
(59,11,19.2,32.6,58.8,237.6,1.5,41.5,202,4.9,1.9,74.2,439.6,5.9,10.4,10.9,1.3,22.5,6.3,54.6,0.9,1.1,2),
(60,11,22.7,33.8,67.2,294.3,2.5,34,148.5,4.4,1.4,67.8,442.7,6.5,12.3,7.7,1.9,21.9,5.9,52.6,0.5,0.8,1.4),
(61,11,19.5,31.3,62.5,239.4,1.4,34.1,148.2,4.3,2.1,65.4,387.5,5.9,10.5,7.9,1.2,19.5,6.6,63.5,0.7,1.1,1.8),
(62,11,19.5,31.4,62.3,204,1.1,31.8,97.4,3.1,0.7,63.2,301.4,4.8,9.4,6.3,1.5,17.1,4.8,41.2,0.8,0.8,1.6),
(63,11,20.2,31.5,64.2,243.5,1.5,38.5,165.3,4.3,2.2,70,408.7,5.8,10.4,9,2.9,22.3,5.5,46.6,0.7,0.5,1.2),
(64,11,16.5,29.6,55.5,201.3,1.4,36.6,169.5,4.6,1,66.3,370.8,5.6,8.5,9.5,1.7,19.6,8.1,73.1,0.6,1.2,1.8),
(65,11,19.1,31.6,60.3,208.3,1.2,36.5,178.3,4.9,1.9,68.1,386.5,5.7,9.4,9.5,1.5,20.3,7.3,68.9,0.5,1.1,1.5),
(66,11,23.7,34.5,68.9,266,1.8,37.3,175.2,4.7,1.7,71.7,441.2,6.2,10.4,9,2.3,21.6,6.6,59.9,0.5,0.5,1.1),
(67, 11, 17.7, 30, 59.1, 238.9, 1.5, 36.3, 144.5, 4, 1.5, 66.3, 383.4, 5.8, 9.7, 7.6, 2.2, 19.5, 4.8, 42.4, 0.8, 1.2, 2);

CREATE TABLE cfb.STANDINGS_MATCH (
    STANDINGS_ID INT PRIMARY KEY,
    TEAM_ID INT,
    FOREIGN KEY (STANDINGS_ID) REFERENCES cfb.STANDINGS(STANDINGS_ID), -- Replace SomeOtherTable with the actual table name
    FOREIGN KEY (TEAM_ID) REFERENCES cfb.TEAMS(TEAM_ID) -- Assuming TEAMS is the table name where TEAM_ID exists
);
INSERT INTO cfb.STANDINGS_MATCH (STANDINGS_ID, TEAM_ID)
VALUES
(1, 9), (2, 2), (3, 1), (4, 29), (5, 18), (6, 30), (7, 35), (8, 10), (9, 19), (10, 11),
(11, 3), (12, 13), (13, 34), (14, 12), (15, 28), (16, 33), (17, 42), (18, 43), (19, 37), (20, 4),
(21, 38), (22, 57), (23, 48), (24, 14), (25, 31), (26, 44), (27, 49), (28, 58), (29, 46), (30, 47),
(31, 53), (32, 62), (33, 45), (34, 52), (35, 20), (36, 24), (37, 51), (38, 21), (39, 27), (40, 50),
(41, 55), (42, 17), (43, 25), (44, 32), (45, 36), (46, 39), (47, 54), (48, 64), (49, 65), (50, 22),
(51, 41), (52, 5), (53, 6), (54, 7), (55, 8), (56, 15), (57, 16), (58, 23), (59, 26), (60, 40), 
(61, 56), (62, 59), (63, 60), (64, 61), (65, 63), (66, 66), (67, 67);
CREATE TABLE cfb.PROJECTED_WINNERS (
    GAME_ID INT,
    TEAM_ID INT,
    PRIMARY KEY (GAME_ID, TEAM_ID),
    FOREIGN KEY (GAME_ID) REFERENCES cfb.BOWL_GAMES(GAME_ID),
    FOREIGN KEY (TEAM_ID) REFERENCES cfb.TEAMS(TEAM_ID)
);
INSERT INTO cfb.PROJECTED_WINNERS (GAME_ID, TEAM_ID)
VALUES
    (1, 9), (2, 1), (3, 29), (4, 3), (5, 48), (6, 2), (7, 16), (8, 18), (9, 10), (10, 14),
    (11, 33), (12, 37), (13, 23), (14, 44), (15, 17), (16, 25), (17, 39), (18, 41), (19, 7), (20, 45),
    (21, 31), (22, 55), (23, 32), (24, 54), (25, 56), (26, 62), (27, 12), (28, 59);

