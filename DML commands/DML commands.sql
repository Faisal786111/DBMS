-- DML commands : used to retrieve , insert , delete & update data from table in the database.

-- 1. SELECT command
-- 2. INSERT command
-- 3. UPDATE command
-- 4. DELETE command

-- 1. SELECT command : It is used to retrieve data from the table. data is store in the result table.

-- syntax : 
-- SELECT *, colname1 , colname2 , colnameN FROM table_name;


-- example : 
SELECT * FROM student;


-- 2. INSERT command : it is used to insert one or more than one records in the relational table.
-- There are two ways to insert records in the table;
-- i) You have to insert all the values of the columns with same order as columns in the table
-- syntax : 
-- INSERT INTO table_name
-- values(val1 , val2 , valn);

-- example :
desc student;
INSERT INTO student
values(1 ,'khan' , 'faisal' , 'CS', 9);

-- ii) You have to specify column names with table name in the parenthesis brackets.
-- syntax : 
-- INSERT INTO table_name (col1 , col2 , coln)
-- values(val1 , val2 , valn);

-- example :  
INSERT INTO student (studId , lastName , firstName , credits)
values(2 , 'surwase' , 'harsha' , 8);

-- 4. DELETE command : used to delete records from the table
-- syntax : 
DELETE FROM table_name; -- to delete all records

-- DELETE FROM table_name -- delete specific record
-- where  condition;

-- example : 

DELETE FROM student;

DELETE FROM student
WHERE studId = '1';


