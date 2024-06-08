# DatabaseSystemsFinal

Creation of a SQL database containing every major conference College Football team along with their stats, record, and predicted bowl game matchup. Made as a final project for the Database Systems class at UT San Antonio.

## Table of Contents

- [Project Structure](#project-structure)
- [Installation](#installation)
- [Usage](#usage)
- [Files Description](#files-description)
- [Contributing](#contributing)

## Project Structure

DatabaseSystemsFinal/
│
├── CFB_DATABASE_CREATION.SQL
├── CFB_QUERIES.sql
├── data_dictionary.xlsx
├── data_dictionary.docx
└── README.md


## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/DanielSigala/DatabaseSystemsFinal.git
    ```

2. Navigate to the project directory:

    ```bash
    cd DatabaseSystemsFinal
    ```

3. Set up the database:

    - Import the `CFB_DATABASE_CREATION.SQL` file into your SQL database.

    ```sql
    source CFB_DATABASE_CREATION.SQL;
    ```

## Usage

1. After setting up the database, you can run various queries to interact with the data.

2. Use the `CFB_QUERIES.sql` file to execute pre-written queries to fetch different statistics, records, and predicted bowl game matchups.

3. Refer to the data dictionary files (`data_dictionary.xlsx` and `data_dictionary.docx`) for detailed information about the database schema, tables, and columns.

## Files Description

- **CFB_DATABASE_CREATION.SQL**: SQL script to create and populate the database with college football teams' stats, records, and predicted bowl game matchups.

- **CFB_QUERIES.sql**: SQL script containing a set of queries to retrieve various data from the created database.

- **data_dictionary.xlsx**: Excel file providing a detailed data dictionary for the database, including descriptions of tables, columns, data types, and relationships.

- **data_dictionary.docx**: Word document version of the data dictionary for the database.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any changes or improvements.

