-- DEPARTMENT TABLE : 
CREATE TABLE DEPARTMENT (
    DPT_CODE INT PRIMARY KEY,
    DPT_NAME VARCHAR(50),
    DPT_ALLOTMENT INT
);

INSERT INTO DEPARTMENT (DPT_CODE, DPT_NAME, DPT_ALLOTMENT) VALUES (57, 'IT', 65000);
INSERT INTO DEPARTMENT (DPT_CODE, DPT_NAME, DPT_ALLOTMENT) VALUES (63, 'Finance', 15000);
INSERT INTO DEPARTMENT (DPT_CODE, DPT_NAME, DPT_ALLOTMENT) VALUES (47, 'HR', 240000);
INSERT INTO DEPARTMENT (DPT_CODE, DPT_NAME, DPT_ALLOTMENT) VALUES (27, 'RD', 55000);
INSERT INTO DEPARTMENT (DPT_CODE, DPT_NAME, DPT_ALLOTMENT) VALUES (89, 'QC', 75000);



/*1. From the following table, write a SQL query to calculate total purchase amount 
of all orders. Return total purchase amount.*/
USE QUERY;
SELECT SUM(PURCH_AMT) FROM ORDERS;

/*2. From the following table, write a SQL query to calculate the average purchase amount 
of all orders. Return average purchase amount. */
SELECT AVG(PURCH_AMT) FROM ORDERS;

/*3. From the following table, write a SQL query that counts the number of unique salespeople.
 Return number of salespeople.  */
 SELECT COUNT(DISTINCT SALESMAN_ID) FROM ORDERS;
 
 /*4. From the following table, write a SQL query to count the number of customers. 
 Return number of customers.  */
 SELECT COUNT(CUSTOMER_ID) FROM CUSTOMERS;
 
 /*5. From the following table, write a SQL query to determine the number of customers 
 who received at least one grade for their activity.  */
 SELECT COUNT(GRADE) FROM CUSTOMERS;
 
 /*6. From the following table, write a SQL query to find the maximum purchase amount.  */
 SELECT MAX(PURCH_AMT) FROM ORDERS;
 
/*7. From the following table, write a SQL query to find the minimum purchase amount. */ 
SELECT MIN(PURCH_AMT) AS MIN FROM ORDERS;

/*8. From the following table, write a SQL query to find the highest grade of 
the customers in each city. Return city, maximum grade.  */
SELECT CITY , MAX(GRADE) AS MAX FROM CUSTOMERS
GROUP BY CITY;

/*9. From the following table, write a SQL query to find the highest purchase amount 
ordered by each customer. Return customer ID, maximum purchase amount. */
SELECT CUSTOMER_ID , MAX(PURCH_AMT) AS MAX FROM ORDERS
GROUP BY CUSTOMER_ID;

/*10. From the following table, write a SQL query to find the highest purchase amount 
ordered by each customer on a particular date. Return, order date and highest purchase amount.*/
SELECT CUSTOMER_ID , ORD_DATE , MAX(PURCH_AMT) AS MAX FROM ORDERS
GROUP BY CUSTOMER_ID , ORD_DATE;

/*11. From the following table, write a SQL query to determine the highest purchase amount made by each salesperson 
on '2012-08-17'. Return salesperson ID, purchase amount */
SELECT SALESMAN_ID ,MAX(PURCH_AMT) AS MAX FROM ORDERS
WHERE ORD_DATE = '2012-08-17'
GROUP BY SALESMAN_ID;

/*12. From the following table, write a SQL query to find the highest order (purchase) amount by each customer on a
 particular order date. Filter the result by highest order (purchase) amount above 2000.00. Return customer id,
 order date and maximum purchase amount.*/
 SELECT CUSTOMER_ID , ORD_DATE , MAX(PURCH_AMT) AS MAX FROM ORDERS
 GROUP BY CUSTOMER_ID , ORD_DATE
 HAVING MAX(PURCH_AMT) > 2000;
 
 /*13. From the following table, write a SQL query to find the maximum order (purchase) amount in the range 
 2000 - 6000 (Begin and end values are included.) by combination of each customer and order date. 
 Return customer id, order date and maximum purchase amount.*/
 SELECT CUSTOMER_ID , ORD_DATE ,MAX(PURCH_AMT) AS MAX FROM ORDERS
 GROUP BY CUSTOMER_ID , ORD_DATE
 HAVING MAX(PURCH_AMT) BETWEEN 2000 AND 6000;
 
 /*14. From the following table, write a SQL query to find the maximum order (purchase) amount based on
 the combination of each customer and order date. Filter the rows for maximum order (purchase) amount is
 either 2000, 3000, 5760, 6000. Return customer id, order date and maximum purchase amount.*/
SELECT CUSTOMER_ID , ORD_DATE , MAX(PURCH_AMT) AS MAX FROM ORDERS
GROUP BY CUSTOMER_ID , ORD_DATE
HAVING MAX(PURCH_AMT) IN (2000 , 3000 , 5760 , 6000);

/*15. From the following table, write a SQL query to determine the maximum order amount for each customer. 
The customer ID should be in the range 3002 and 3007(Begin and end values are included.). 
Return customer id and maximum purchase amount.*/
SELECT CUSTOMER_ID, MAX(PURCH_AMT) AS MAX_PURCHASE_AMOUNT
FROM ORDERS
GROUP BY CUSTOMER_ID
HAVING CUSTOMER_ID BETWEEN 3002 AND 3007;

/*16. From the following table, write a SQL query to find the maximum order (purchase) amount for each customer. 
The customer ID should be in the range 3002 and 3007(Begin and end values are included.). 
Filter the rows for maximum order (purchase) amount is higher than 1000. Return customer id and maximum purchase amount.*/
SELECT CUSTOMER_ID , MAX(PURCH_AMT) AS MAX 
FROM ORDERS
WHERE CUSTOMER_ID BETWEEN 3002 AND 3007
GROUP BY CUSTOMER_ID 
HAVING MAX(PURCH_AMT) > 1000;

/*17. From the following table, write a SQL query to determine the maximum order (purchase) amount generated by each salesperson.
 Filter the rows for the salesperson ID is in the range 5003 and 5008 (Begin and end values are included.). 
 Return salesperson id and maximum purchase amount.*/
 SELECT SALESMAN_ID , MAX(PURCH_AMT) AS MAX
 FROM ORDERS
 WHERE SALESMAN_ID BETWEEN 5003 AND 5008
 GROUP BY SALESMAN_ID;
 
 /*18. From the following table, write a SQL query to count all the orders generated on '2012-08-17'. Return number of orders.*/
 SELECT COUNT(*) AS COUNT
 FROM ORDERS
 WHERE ORD_DATE =  '2012-08-17';
 
 /*19. From the following table, write a SQL query to count the number of salespeople in a city. Return number of salespeople.*/
 SELECT COUNT(ID) AS COUNT
 FROM SALESMAN
 WHERE CITY IS NOT NULL;
 
/*20. From the following table, write a SQL query to count the number of orders based on the combination of each order date and salesperson.
 Return order date, salesperson id.*/ 
SELECT ORD_DATE , SALESMAN_ID , COUNT(*)
FROM ORDERS
GROUP BY ORD_DATE , SALESMAN_ID;

/*21. From the following table, write a SQL query to calculate the average product price. Return average product price.*/
SELECT AVG(PRO_PRICE) AS AVG
FROM PRODUCTS;

/*22. From the following table, write a SQL query to count the number of products whose price are higher than or equal 
to 350. Return number of products.*/
SELECT COUNT(*) AS COUNT
FROM PRODUCTS
WHERE PRO_PRICE >= 350;

/*23. From the following table, write a SQL query to compute the average price for unique companies. 
Return average price and company id.*/
SELECT AVG(PRO_PRICE) AS "AVG" , PRO_COM AS "COMPANY ID"
FROM PRODUCTS
GROUP BY PRO_COM;

/*24. From the following table, write a SQL query to compute the sum of the allotment amount of 
all departments. Return sum of the allotment amount.*/
SELECT SUM(DPT_ALLOTMENT) AS SUM
FROM DEPARTMENT;

/*25. From the following table, write a SQL query to count the number of employees in each department.
 Return department code and number of employees.*/
 SELECT EMP_DEPT , COUNT(*) AS 'NUMBER OF EMPLOYEES'
 FROM EMPLOYEES 
 GROUP BY EMP_DEPT;