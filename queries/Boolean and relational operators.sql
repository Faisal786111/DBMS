use query;

-- customer table : 
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT
);

INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', NULL, 5005);

SELECT * FROM customers;

-- EMPLOYEE TABLE : 
CREATE TABLE employees (
    emp_idno INT PRIMARY KEY,
    emp_fname VARCHAR(50),
    emp_lname VARCHAR(50),
    emp_dept INT
);

INSERT INTO employees (emp_idno, emp_fname, emp_lname, emp_dept) VALUES
(127323, 'Michale', 'Robbin', 57),
(526689, 'Carlos', 'Snares', 63),
(843795, 'Enric', 'Dosio', 57),
(328717, 'Jhon', 'Snares', 63),
(444527, 'Joseph', 'Dosni', 47),
(659831, 'Zanifer', 'Emily', 47),
(847674, 'Kuleswar', 'Sitaraman', 57),
(748681, 'Henrey', 'Gabriel', 47),
(555935, 'Alex', 'Manuel', 57),
(539569, 'George', 'Mardy', 27),
(733843, 'Mario', 'Saule', 63),
(631548, 'Alan', 'Snappy', 27),
(839139, 'Maria', 'Foster', 57);
SELECT * FROM EMPLOYEES;


-- 1. write a SQL query to locate the details of customers with grade values above 100. Return customer_id, cust_name, city, grade, and salesman_id. 
SELECT * FROM CUSTOMERS
WHERE GRADE > 100;

-- 2.  write a SQL query to find all the customers in ‘New York’ city who have a grade value above 100. Return customer_id, cust_name, city, grade, and salesman_id.
SELECT * FROM CUSTOMERS
WHERE GRADE > 100 AND CITY = 'NEW YORK';

-- 3. write a SQL query to find customers who are from the city of New York or have a grade of over 100. Return customer_id, cust_name, city, grade, and salesman_id.  
SELECT * FROM CUSTOMERS
WHERE GRADE > 100 OR CITY = 'NEW YORK';

-- 4. From the following table, write a SQL query to find customers who are either from the city 'New York' or who do not have a grade greater than 100. Return customer_id, cust_name, city, grade, and salesman_id. 
SELECT * FROM CUSTOMERS
WHERE CITY = 'NEW YORK' OR NOT GRADE > 100;

-- 5. From the following table, write a SQL query to identify customers who are not from the city of 'New York' and do not have a grade value greater than 100. Return customer_id, cust_name, city, grade, and salesman_id..
SELECT * FROM CUSTOMERS 
WHERE NOT (CITY = 'NEW YORK' OR  GRADE > 100);

-- 6. From the following table, write a SQL query to find details of all orders excluding those with ord_date equal to '2012-09-10' and salesman_id higher than 5005 or purch_amt greater than 1000.Return ord_no, purch_amt, ord_date, customer_id and salesman_id.  
SELECT * FROM ORDERS
WHERE NOT ((ORD_DATE = '2012-09-10' AND SALESMAN_ID = 5005) OR PURCH_AMT > 1000);

-- 7. From the following table, write a SQL query to find the details of those salespeople whose commissions range from 0.10 to0.12. Return salesman_id, name, city, and commission. 
SELECT * FROM SALESMAN
WHERE COMMISSION BETWEEN 0.10 AND 0.12;

-- 8. From the following table, write a SQL query to find details of all orders with a purchase amount less than 200 or exclude orders with an order date greater than or equal to '2012-02-10' and a customer ID less than 3009. Return ord_no, purch_amt, ord_date, customer_id and salesman_id.
SELECT * FROM ORDERS 
WHERE PURCH_AMT < 200 OR NOT (ORD_DATE >= '2012-02-10' AND CUSTOMER_ID < 3009);

-- 9. From the following table, write a SQL query to find all orders that meet the following conditions. Exclude combinations of order date equal to '2012-08-17' or customer ID greater than 3005 and purchase amount less than 1000.
SELECT * FROM ORDERS  
WHERE NOT (ORD_DATE = '2012-08-17' OR (CUSTOMER_ID > 3005 AND PURCH_AMT < 1000));

-- 10.  Write a SQL query that displays order number, purchase amount, and the achieved and unachieved percentage (%) for those orders that exceed 50% of the target value of 6000.  
-- PERCENTAGE = (PART / WHOLE) * 100
SELECT ORD_NO , PURCH_AMT ,
	(PURCH_AMT / 6000) * 100 AS 'ACHIEVED %',
    (100 - (PURCH_AMT / 6000) * 100) AS 'UNACHIEVED %'
FROM ORDERS 
WHERE (PURCH_AMT / 6000) * 100 > 50;

-- 11. From the following table, write a SQL query to find the details of all employees whose last name is ‘Dosni’ or ‘Mardy’. Return emp_idno, emp_fname, emp_lname, and emp_dept.
SELECT * FROM EMPLOYEES
WHERE EMP_LNAME IN ('DOSNI' , 'MARDY');

-- 12. From the following table, write a SQL query to find the employees who work at depart 47 or 63. Return emp_idno, emp_fname, emp_lname, and emp_dept.  
SELECT * FROM EMPLOYEES
WHERE EMP_DEPT IN (47 , 63);

