CREATE DATABASE Query;
USE QUERY;

-- salesman table
CREATE TABLE employees (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50),
    Commission DECIMAL(5, 2)
);

rename table employees to salesman;

-- orders table
CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES salesmen(ID)
);


-- nobel_win table
CREATE TABLE nobel_win (
    year INT,
    subject VARCHAR(50),
    winner VARCHAR(100),
    country VARCHAR(50),
    category VARCHAR(50)
);

select * from nobel_win;

-- products table :
CREATE TABLE products (
    PRO_ID INT PRIMARY KEY,
    PRO_NAME VARCHAR(50),
    PRO_PRICE DECIMAL(10, 2),
    PRO_COM INT
);

SELECT * FROM products;

-- CASE EXPRESSION example: 
SELECT salesman_id , purch_amt , 
CASE	
	WHEN purch_amt > 1000 THEN 'Excellent'
    WHEN purch_amt = 1000 THEN 'Good'
    ELSE 'Bad'
END AS OrderStatus
FROM orders;

SELECT customer_id , purch_amt , 
CASE purch_amt 
	WHEN 3045.60 THEN 'Prime Customer'
    WHEN 1983.43 THEN 'Plus Customer'
    ELSE 'Local Customer'
END AS CustomerStatus
FROM orders;

-- GROUP BY CLAUSE : 
SELECT subject , count(*)
FROM nobel_win
GROUP BY subject;


-- Query 

-- 1. Write a SQL statement that displays all the information about all salespeople.
SELECT * from salesman;

-- 2. Write a SQL statement to display a string "This is SQL Exercise, Practice and Solution". 
SELECT 'this is sql exercies, practice and solution';

-- 3. Write a SQL query to display three numbers in three columns
SELECT 10 , 20 , 30;

-- 4. Write a SQL query to display the sum of two numbers 10 and 15 from the RDBMS server. 
SELECT 10 + 15;

-- 5. Write an SQL query to display the result of an arithmetic expression. 
SELECT 10 * 10 + 5 - 9;

-- 6. Write a SQL statement to display specific columns such as names and commissions for all salespeople.  
SELECT Name , commission 
From Salesman;

-- 7. Write a query to display the columns in a specific order, such as order date, salesman ID, order number, and purchase amount for all orders.  
SELECT order_date , salesman_id , order_number , purchase_amt
FROM Orders;

-- 8. From the following table, write a SQL query to identify the unique salespeople ID. Return salesman_id.
SELECT DISTINCT salesman_id 
FROM orders;

-- 9. From the following table, write a SQL query to locate salespeople who live in the city of 'Paris'. Return salesperson's name, city. 
SELECT name , city 
from salesman
where city = 'paris';

-- 10. From the following table, write a SQL query to find customers whose grade is 200. Return customer_id, cust_name, city, grade, salesman_id. 
SELECT *
FROM salesman
where grade = 200;

-- 11. From the following table, write a SQL query to find orders that are delivered by a salesperson with ID. 5001. Return ord_no, ord_date, purch_amt. 
SELECT ord_no , ord_date , purch_amt
FROM orders 
where salesman_id = 5001;

-- 12. From the following table, write a SQL query to find the Nobel Prize winner(s) for the year 1970. Return year, subject and winner. 
 SELECT * 
 from nobel_win
 where year = 1970;
 
 -- 13. From the following table, write a SQL query to find the Nobel Prize winner in ‘Literature’ for 1971. Return winner. 
 select winner 
 from nobel_win 
 where year = 1971 AND subject = 'Literarture';
 
 -- 14. From the following table, write a SQL query to locate the Nobel Prize winner ‘Dennis Gabor'. Return year, subject. 
 SELECT year , subject 
 from nobel_win 
 where winner = 'Dennis Gobar';
 
 -- 15. From the following table, write a SQL query to find the Nobel Prize winners in the field of ‘Physics’ since 1950. Return winner. 
 select winner
 from nobel_win
 where year >=1950 AND subject = 'physics';
 
 -- 16. From the following table, write a SQL query to find the Nobel Prize winners in ‘Chemistry’ between the years 1965 and 1975. Begin and end values are included. Return year, subject, winner, and country. 
 select year , subject , winner , country 
 From nobel_win
 where subject = 'Chemistry' AND year BETWEEN 1965 AND 1975;
 
 select yeear , subject , winner, country 
 from nobel_win 
 where subject = 'Chemistry' AND year >= 1965 AND year <=1975;
 
 -- 17. Write a SQL query to display all details of the Prime Ministerial winners after 1972 of Menachem Begin and Yitzhak Rabin.  
SELECT * 
from nobel_win
where (winner = 'Menachem Begin' OR winner = 'Yitzhak Rabin') AND year > 1972;

SELECT * 
FROM nobel_win
where winner IN ('Menachem Begin' , 'Yitzhak Rabin')  AND year > 1972;

-- 18. From the following table, write a SQL query to retrieve the details of the winners whose first names match with the string ‘Louis’. Return year, subject, winner, country, and category.  
SELECT *
FROM nobel_win
WHERE 	winner LIKE 'louis%';

-- 19. From the following table, write a SQL query that combines the winners in Physics, 1970 and in Economics, 1971. Return year, subject, winner, country, and category. 
SELECT * FROM nobel_win
WHERE subject = 'Physics' AND year = 1970
UNION 
SELECT * FROM nobel_win
WHERE subject = 'Economics' AND year = 1971;

-- 20. From the following table, write a SQL query to find the Nobel Prize winners in 1970 excluding the subjects of Physiology and Economics. Return year, subject, winner, country, and category. 
SELECT * FROM nobel_win
WHERE year = 1970 AND subject NOT IN('Physiology' , 'Economics');

-- 21. From the following table, write a SQL query to combine the winners in 'Physiology' before 1971 and winners in 'Peace' on or after 1974. Return year, subject, winner, country, and category. 
SELECT * FROM nobel_win 
WHERE subject = 'Physiology' AND year < 1971
UNION
SELECT * FROM nobel_win
WHERE subject = 'Peace' AND year > 1974;

-- 22. From the following table, write a SQL query to find the details of the Nobel Prize winner 'Johannes Georg Bednorz'. Return year, subject, winner, country, and category.
SELECT * FROM nobel_win
WHERE winner = 'Johannes Georg Bednorz';

-- 23. From the following table, write a SQL query to find Nobel Prize winners for the subject that does not begin with the letter 'P'. Return year, subject, winner, country, and category. Order the result by year, descending and winner in ascending.  
SELECT * FROM nobel_win 
WHERE subject NOT LIKE 'P%'
ORDER BY year DESC , winner ASC;

-- 24. From the following table, write a SQL query to find the details of 1970 Nobel Prize winners. Order the results by subject, ascending except for 'Chemistry' and ‘Economics’ which will come at the end of the result set. Return year, subject, winner, country, and category.  
SELECT * FROM nobel_win
WHERE year = 1970
ORDER BY 
	CASE 
		WHEN subject IN ('Chemistry' , 'Economics') THEN 1
        ELSE 0
	END ASC,
    subject ASC;

-- 25. From the following table, write a SQL query to select a range of products whose price is in the range Rs.200 to Rs.600. Begin and end values are included. Return pro_id, pro_name, pro_price, and pro_com.  
SELECT * FROM products
WHERE PRO_PRICE BETWEEN 200 AND 600;

-- 26. From the following table, write a SQL query to calculate the average price for a manufacturer code of 16. Return avg.  
SELECT AVG(PRO_PRICE) AS Avg FROM products
WHERE PRO_COM = 16;

-- 27. From the following table, write a SQL query to display the pro_name as 'Item Name' and pro_priceas 'Price in Rs.' 
SELECT PRO_NAME AS 'Item Name' , PRO_PRICE AS 'Price in Rs'
FROM products;

-- 28. From the following table, write a SQL query to find the items whose prices are higher than or equal to $250. Order the result by product price in descending, then product name in ascending. Return pro_name and pro_price. 
SELECT PRO_NAME , PRO_PRICE
FROM PRODUCTS
WHERE PRO_PRICE >= 250
ORDER BY PRO_PRICE DESC , PRO_NAME ASC;

-- 29. From the following table, write a SQL query to calculate average price of the items for each company. Return average price and company code. 
select * from products;
SELECT AVG(PRO_PRICE) AS 'AVG PRICE'  , PRO_COM 
FROM products
GROUP BY PRO_COM;

-- 30. From the following table, write a SQL query to find the cheapest item(s). Return pro_name and, pro_price.  
SELECT PRO_NAME , PRO_PRICE
FROM products 
WHERE PRO_PRICE IN (SELECT MIN(PRO_PRICE) FROM products);

-- 31. From the following table, write a SQL query to find the unique last name of all employees. Return emp_lname.   
SELECT DISTINCT LNAME FROM EMP_DETAILS;

-- 32. From the following table, write a SQL query to find the details of employees whose last name is 'Snares'. Return emp_idno, emp_fname, emp_lname, and emp_dept.  
SELECT * FROM EMP_DETAILS 
WHERE LNAME = 'Snares';

-- 33. From the following table, write a SQL query to retrieve the details of the employees who work in the department 57. Return emp_idno, emp_fname, emp_lname and emp_dept.. 
SELECT * FROM EMP_DETAILS 
WHERE DEPT = 57;