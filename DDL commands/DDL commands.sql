-- DDL commmands : 
-- 1. CREATE
-- 2. ALTER
-- 3. TRUNCATE
-- 4. DROP
-- 5. RENAME

-- 1. CREATE COMMAND : it is used to create objects in the database. like tables , databases , views etc
-- syntax : 
-- CREATE TABLE table_name(
-- 	col1 datatype constraint,
-- 	col2 datatype constraint,
--  coln datatype constraint
-- );

CREATE DATABASE university;

USE university;

CREATE TABLE student (
	studId VARCHAR(10),
    lastName VARCHAR(10) NOT NULL,
    firstName VARCHAR(10) NOT NULL,
    major VARCHAR(10),
    credits SMALLINT DEFAULT 0,
    PRIMARY KEY (studId)
);

SHOW CREATE TABLE student;

DESC student;
DESCRIBE student;

CREATE TABLE faculty(
	facId varchar(10),
    fName varchar(10) NOT NULL,
    dept varchar(10) NOT NULL,
    fRank varchar(10)
);

DESC faculty;
describe faculty;

CREATE TABLE class(
	classNo varchar(10),
    facId varchar(10) NOT NULL,
    schedule varchar(10),
    room varchar(10)
);

DESC class;
describe class;

CREATE TABLE enroll(
	classNo varchar(10),
    studId varchar(10),
    grade varchar(5),
    
    PRIMARY KEY (classNo),
    FOREIGN KEY (studId) REFERENCES student(studId)
);

desc enroll;
describe enroll;


-- 2. Alter : alters the structure of the database. like alter column name , remove columns , add columns , constraint etc.
-- syntax : 
-- i)Add column : 
-- ALTER TABLE table_name
-- ADD COLUMN column_name datatype;

-- example : 
ALTER TABLE student 
ADD COLUMN address varchar(10);

desc student;

-- ii) Add constraint : 
-- ALTER TABLE table_name
-- ADD CONSTRAINT constraint_name
-- constraint_type (column_name);

-- example : 
ALTER TABLE student
ADD CONSTRAINT PK_student
PRIMARY KEY (studId);

ALTER TABLE faculty
ADD CONSTRAINT PK_faculty
PRIMARY KEY (facId);

ALTER TABLE student
ADD CONSTRAINT unique_key
unique (address);

ALTER TABLE student
ADD CONSTRAINT check_constraint
check(( 0 < credits AND credits < 10));

desc student;

-- iii) Rename column : 
-- ALTER TABLE table_name
-- RENAME COLUMN old_column_name TO new_column_name;

-- example : 
ALTER TABLE student
RENAME COLUMN address TO Address;

-- iv) Modify column datatype : 
-- ALTER TABLE table_name
-- MODIFY COLUMN col_name datatype;

-- example : 
ALTER TABLE student
MODIFY COLUMN address char(100);

-- v) Drop column : 
-- ALTER TABLE table_name
-- DROP COLUMN col_name;

-- example : 
ALTER TABLE student 
DROP COLUMN address;


-- 3.  Truncate command: used to delete all the existing records in the table without removing it's structure.
-- syntax : 
-- TRUNCATE TABLE table_name;

-- example :
TRUNCATE TABLE student; 
select * from student;
desc student;

-- 4. DROP command : used to delete all the records from the table with it's structure.
-- syntax : 
-- DROP TABLE table_name;

-- example 
DROP TABLE student;
DROP TABLE enroll;

-- 5. Rename table command : used to rename table name;
-- syntax : 
-- RENAME TABLE old_name TO new_name;

-- example : 
RENAME TABLE faculty TO Faculty_table;
desc faculty_table;





	