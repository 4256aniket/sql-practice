/*markdown
### Show all databases
*/

SHOW DATABASES;

/*markdown
### Create Database ORG
*/

CREATE DATABASE ORG;

SHOW DATABASES;

/*markdown
### Select Database ORG
*/

USE ORG;

/*markdown
### Create Table Worker
*/

CREATE TABLE Worker(
    WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT(15),
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

/*markdown
### Inseting values into Worker Table
*/

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
    (001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
    (002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
    (003, 'Vishal', 'Singhal', 30000, '14-02-20 09.00.00', 'HR'),
    (004, 'Amitabh', 'Singh', 50000, '14-02-20 09.00.00', 'Admin'),
    (005, 'Vivek', 'Bhati', 50000, '14-06-11 09.00.00', 'Admin'),
    (006, 'Vipul', 'Diwan', 20000, '14-06-11 09.00.00', 'Account'),
    (007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
    (008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

/*markdown
### Displaying Worker Table or select whole table
*/

SELECT * FROM Worker;

/*markdown
### Creating Bonus Table
It is referencing Worker Table using foreign key WORKER_REF_ID which is primary key of referenced table (Worker)
*/

CREATE TABLE Bonus(
    WORKER_REF_ID INT,
    BONUS_AMOUNT INT(10),
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
        REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

/*markdown
### Inserting values into Bonus table
*/

INSERT INTO Bonus
    (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
    (001, 5000, '16-02-20'),
    (002, 3000, '16-06-11'),
    (003, 4000, '16-02-20'),
    (001, 4500, '16-02-20'),
    (002, 3500, '16-06-11');

SELECT * FROM Bonus;

/*markdown
### Creating Title table
It references Worker table through foreign key WORKER_REF_ID, which is primary key of referenced table (Worker)
*/

CREATE TABLE Title(
    WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
        REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

/*markdown
### Inserting values into Title tables
*/

INSERT INTO Title
(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
(001, 'Manager', '2016-02-20 00:00:00'),
(002, 'Executive', '2016-06-11 00:00:00'),
(008, 'Executive', '2016-06-11 00:00:00'),
(005, 'Manager', '2016-02-20 00:00:00'),
(004, 'Asst. Manager', '2016-02-20 00:00:00'),
(007, 'Executive', '2016-02-20 00:00:00'),
(006, 'Lead', '2016-02-20 00:00:00'),
(003, 'Lead', '2016-02-20 00:00:00');

SELECT * FROM Title;

/*markdown
### We can select one or more columns from a table
Here we are selecting SALARY attribute (column) only
*/

SELECT SALARY FROM Worker;

/*markdown
Here we are selecting two columns only
*/

SELECT FIRST_NAME, SALARY FROM Worker;

/*markdown
### Q. Can we use SELECT keyword without using FROM clause? ###
YES, usign DUAL Tables
Dual Tables are dummy tables created by MySQL, helps users to do certain obvious actions without reffering to user defined tables
eg: SELECT 44 + 11; 
    SELECT now();      gives current time of server
    SELECT ucase(); etc

*/

SELECT 44 + 11;

SELECT now();

SELECT lcase("ANIKET");

SELECT ucase("aniket")