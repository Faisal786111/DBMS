-- TEST TABLE : 
CREATE TABLE TEST_TABLE (
    col1 VARCHAR(255)
);

INSERT INTO TEST_TABLE (col1)
VALUES 
('A001/DJ-402\\44_/100/2015'),
('A001_\\DJ-402\\44_/100/2015'),
('A001_DJ-402-2014-2015'),
('A002_DJ-401-2014-2015'),
('A001/DJ_401'),
('A001/DJ_402\\44'),
('A001/DJ_402\\44\\2015'),
('A001/DJ-402%45\\2015/200'),
('A001/DJ_402\\45\\2015%100'),
('A001/DJ_402%45\\2015/300'),
('A001/DJ-402\\44');

SELECT * FROM TEST_TABLE;

/* 1. From the following table, write a SQL query to find the details of those salespeople who 
 come from the 'Paris' City or 'Rome' City. Return salesman_id, name, city, commission. */
USE QUERY; 
SELECT * FROM SALESMAN
WHERE CITY IN ('PARIS' , 'ROME');

/*2. From the following table, write a SQL query to find the details of the salespeople who 
come from either 'Paris' or 'Rome'. Return salesman_id, name, city, commission.  */

SELECT * FROM SALESMAN 
WHERE CITY = 'PARIS' OR CITY = 'ROME';

/*3. From the following table, write a SQL query to find the details of those salespeople who live 
in cities other than Paris and Rome. Return salesman_id, name, city, commission.   */
SELECT * FROM SALESMAN
WHERE CITY NOT IN('PARIS' , 'ROME');

/*4. From the following table, write a SQL query to retrieve the details of all customers whose ID belongs to any of the 
values 3007, 3008 or 3009. Return customer_id, cust_name, city, grade, and salesman_id.  */
SELECT * FROM CUSTOMERS
WHERE CUSTOMER_ID IN (3007 , 3008 , 3009);


/*5. From the following table, write a SQL query to find salespeople who receive commissions between 0.12 and 0.14 
(begin and end values are included). Return salesman_id, name, city, and commission.  */
SELECT * FROM SALESMAN
WHERE COMMISSION BETWEEN 0.12 AND 0.14;


/*6. From the following table, write a SQL query to select orders between 500 and 4000 (begin and end values are included). Exclude orders 
amount 948.50 and 1983.43. Return ord_no, purch_amt, ord_date, customer_id, and salesman_id. */
SELECT * FROM ORDERS
WHERE PURCH_AMT BETWEEN 500 AND 4000 AND PURCH_AMT NOT IN(948.50 , 1983.43);

/*7. From the following table, write a SQL query to retrieve the details of the salespeople whose names 
begin with any letter between 'A' and 'L' (not inclusive). Return salesman_id, name, city, commission. */
SELECT * FROM SALESMAN
WHERE NAME > 'A' AND NAME < 'L';

/*8. From the following table, write a SQL query to find the details of all salespeople except those whose names 
begin with any letter between 'A' and 'M'. Return salesman_id, name, city, commission.  */
SELECT * FROM SALESMAN
WHERE NAME NOT BETWEEN 'A' AND 'M';

/*9. From the following table, write a SQL query to retrieve the details of the customers whose names begins with 
the letter 'B'. Return customer_id, cust_name, city, grade, salesman_id.. */
SELECT * FROM CUSTOMERS
WHERE CUST_NAME LIKE 'B%';

/*10. From the following table, write a SQL query to find the details of the customers whose names end with the 
letter 'n'. Return customer_id, cust_name, city, grade, salesman_id.*/
SELECT * FROM CUSTOMERS
WHERE CUST_NAME LIKE '%N';

/*11. From the following table, write a SQL query to find the details of those salespeople whose names begin 
with ‘N’ and the fourth character is 'l'. Rests may be any character. Return salesman_id, name, city, commission. */
SELECT * FROM SALESMAN
WHERE NAME LIKE 'N__L%';

/*12. From the following table, write a SQL query to 
find those rows where col1 contains the escape character underscore ( _ ). Return col1.*/
SELECT * FROM TEST_TABLE
WHERE COL1 LIKE '%/_%' ESCAPE '/';

/*13. From the following table, write a SQL query to identify those rows where col1 
does not contain the escape character underscore ( _ ). Return col1.*/
SELECT * FROM TEST_TABLE 
WHERE COL1 NOT LIKE '%/_%' ESCAPE '/';

/*14. From the following table, write a SQL query to find rows in which col1 contains the 
forward slash character ( / ). Return col1.*/
SELECT * FROM TEST_TABLE 
WHERE COL1 LIKE '%/%';

/*15. From the following table, write a SQL query to identify those rows where col1 does 
not contain the forward slash character ( / ). Return col1.*/
SELECT * FROM TEST_TABLE
WHERE COL1 NOT LIKE '%/%';

/*16. From the following table, write a SQL query to find those rows 
where col1 contains the string ( _/ ). Return col1.*/
SELECT * FROM TEST_TABLE
WHERE COL1 LIKE '%/_//%' ESCAPE '/';

/*17. From the following table, write a SQL query to find those 
rows where col1 does not contain the string ( _/ ). Return col1.*/
SELECT * FROM TEST_TABLE
WHERE COL1 NOT LIKE '%/_//%' ESCAPE '/';

/*18. From the following table, write a SQL query to find those rows
 where col1 contains the character percent ( % ). Return col1.*/
 SELECT * FROM TEST_TABLE
 WHERE COL1 LIKE '%/%%' ESCAPE '/';

/*19. From the following table, write a SQL query to find those rows 
where col1 does not contain the character percent ( % ). Return col1.*/
SELECT * FROM TEST_TABLE
WHERE COL1 NOT LIKE '%/%%' ESCAPE '/';

/*20. From the following table, write a SQL query to find all those customers 
who does not have any grade. Return customer_id, cust_name, city, grade, salesman_id.*/
SELECT * FROM CUSTOMERS
WHERE GRADE IS NULL;

/*21. From the following table, write a SQL query to locate all customers with a grade value. 
Return customer_id, cust_name,city, grade, salesman_id.*/
SELECT * FROM CUSTOMERS
WHERE GRADE IS NOT NULL;

/*22. From the following table, write a SQL query to locate the employees whose last name begins 
with the letter 'D'. Return emp_idno, emp_fname, emp_lname and emp_dept.*/
SELECT * FROM EMPLOYEES
WHERE EMP_LNAME LIKE 'D%';