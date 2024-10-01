-- Views : It is a virtual table that doesn't contain any memory
-- It is result set of stored query;


-- Types : 
-- 1.Simple view : It is created from one base table.
-- It deosn't contain any functions 
-- Syntax : 
CREATE VIEW view_name 
AS SELECT * FROM TABLE_NAME;

-- exmaple : 
CREATE VIEW employee1
AS SELECT * FROM EMPLOYEE;

-- 2.Complex view : It is created from one more table;
-- it contains function like join , group by , order by etc;
--Syntax : 
CREATE VIEW view_name1
AS SELECT * FROM table_name1 
UNION
SELECT * FROM TABLE_NAME2;

-- example : 
CREATE VIEW employee2
as select * from employee
UNION
select * from dept;

-- 3.read only view(doesn't supported by mysql) : it only allow read operations on base table
-- it doesn't allow write operations;
-- Syntax : 
CREATE VIEW view_name 
AS SELECT * FROM TABLE_NAME;

GRANT SELECT TO USER_NAME ON VIEW_NAME;

--Example : 
CREATE VIEW employee1 
AS SELECT * FROM EMPLOYEE WITH READ ONLY;

GRANT SELECT TO FAISAL ON VIEW_NAME;


-- 4.force view (DOESN'T SUPPORTED BY MYSQL) : it is used in such situation when you want to create view on a table but the table is not exist;

-- Syntax : 
CREATE FORCE VIEW view_name 
as select * from table_name;

-- Example : 
CREATE FORCE VIEW d1 
as select * from doctor;

--(DOESN'T SUPPORTED BY MYSQL)
-- 5.materiliazed view :It is not a virtual table.
--  It is a physical copy of original(base) table. 
-- It actually store result of query. i.e. It occupy physical memory.
--  It takes less time to execute queries. 
--  used in data warehousing. 
--  Materialized view reduce the processing time to regenerate the whole data. 
-- It helps remote users to replicate data locally and improve query performance. 
-- Syntax : 
CREATE MATERIALIZED VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;

-- Example : 
CREATE MATERIALIZED VIEW employee_salary_view AS
SELECT department_id, SUM(salary) AS total_salary
FROM employee
GROUP BY department_id;
