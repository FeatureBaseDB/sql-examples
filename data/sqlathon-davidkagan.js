const fs = require('fs');

const filePath = '/Users/davidkagan/molecula/sqlathon/fbsql.in';
const agecsv = 'https://featurebase-public-data.s3.us-east-2.amazonaws.com/age.csv';
const encoding = { encoding: 'utf8' };

// Create Database
const createDatabase = `
-- Create database
CREATE DATABASE sqlathon;
\\c sqlathon
`;
fs.appendFileSync(filePath, createDatabase, encoding);

// Create Tables
const createTableRand = `
-- Create a table called 'rand'
CREATE TABLE rand (_id id, num int);\n
`;

const createTableAge = `
-- Create table age for a bulk insert with public information
CREATE TABLE age (
    _id STRING,
    name STRING,
    description STRING,
    gender STRING,
    country STRING,
    occupation STRING,
    birth_year INT min -32767 max 32767,
    death_year INT min -32767 max 32767,
    death_manner STRING,
    birth_age INT min -32767 max 32767
);\n
`;

// Create 2 tables, Rand and Age
fs.appendFileSync(filePath, createTableRand, encoding);
fs.appendFileSync(filePath, createTableAge, encoding);

// Insert into Rand
fs.appendFileSync(filePath, '-- insert some random information into rand\n', encoding)
for (let i = 1; i <= 100; i++) {
    const randNum = Math.floor(Math.random() * 100);
    const insertSql = `INSERT INTO rand values(${i}, ${randNum});\n`;
    fs.appendFileSync(filePath, insertSql);
}

// Bulk insert into Age
const bulkInsert = `
-- Bulk insert into table age from a public dataset of ages
BULK INSERT INTO age (_id, name, description, gender, country, occupation,
    birth_year, death_year, death_manner, birth_age )
MAP(0 STRING,
1 STRING,
2 STRING,
3 STRING,
4 STRING,
5 STRING,
6 INT,
7 INT,
8 STRING,
9 INT )
FROM
    '${agecsv}'
WITH
    BATCHSIZE 100000
    FORMAT 'CSV'
    INPUT 'URL'
    HEADER_ROW;\n
`;
fs.appendFileSync(filePath, bulkInsert, encoding);


// Some commands to select certain data
const selectRand = `
-- Select all keys in rand where num is greater than 50
SELECT * FROM rand WHERE num > 50;\n
`;
const selectCountRand = `
-- Selec the number of keys where num is greater than 50
SELECT count(*) FROM rand WHERE num > 50;\n
`;
fs.appendFileSync(filePath, selectRand, encoding);
fs.appendFileSync(filePath, selectCountRand, encoding);

const selectOrderedRand = `
-- Select all keys in rand where num is less than 80, and ordered in descending order
SELECT * FROM rand WHERE num < 80 ORDER BY num DESC;\n
`;
fs.appendFileSync(filePath, selectOrderedRand, encoding);

const selectBulk = `
-- Select the top 1000 entries in age where the gender is Male
SELECT * FROM age WHERE gender = 'Male' LIMIT 1000;\n
`;

const selectCountBulk = `
-- Select the number of entries in age where the gender is Male 
SELECT count(*) FROM age WHERE gender = 'Male';\n
`;

fs.appendFileSync(filePath, selectBulk, encoding);
fs.appendFileSync(filePath, selectCountBulk, encoding);



// Drop tables
fs.appendFileSync(filePath, '-- Dropping tables\n', encoding);
fs.appendFileSync(filePath, 'DROP TABLE rand;\n', encoding);
fs.appendFileSync(filePath, 'DROP TABLE age;\n', encoding);
