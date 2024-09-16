-- 1. From the following tables, write a SQL query to find the salespeople and 
-- customers who live in the same city. Return customer name, salesperson 
-- name and salesperson city.

SELECT C.cust_name , S.NAME , S.CITY
FROM SALESMAN S , CUSTOMERS C
WHERE S.CITY = C.CITY;

-- 2. From the following tables, write a SQL query to locate all the customers and
--  the salesperson who works for them. Return customer name, and salesperson name.  

SELECT C.cust_name , S.NAME
FROM SALESMAN S , CUSTOMERS C
WHERE S.ID = C.SALESMAN_ID;

-- 3. From the following tables, write a SQL query to find those salespeople who generated 
-- orders for their customers but are not located in the same city. 
-- Return ord_no, cust_name, customer_id (orders table), salesman_id (orders table). 

SELECT O.ORD_NO , C.cust_name , C.customer_id , S.ID
FROM SALESMAN S , CUSTOMERS C , ORDERS O
WHERE O.SALESMAN_ID= S.ID AND O.customer_id = C.customer_id AND S.CITY <> C.CITY;


-- 4. From the following tables, write a SQL query to locate the orders made by customers.
--  Return order number, customer name.  

SELECT O.ORD_NO , C.cust_name
FROM CUSTOMERS C , ORDERS O 
WHERE C.customer_id = O.customer_id;

-- 5. From the following tables, write a SQL query to find those customers where each customer 
-- has a grade and is served by a salesperson who belongs to a city.
--  Return cust_name as "Customer", grade as "Grade".  

SELECT C.cust_name AS "Customer" , C.GRADE AS "Grade" , O.ORD_NO AS "ORDER NO"
FROM ORDERS O , CUSTOMERS C , SALESMAN S
WHERE C.GRADE IS NOT NULL 
AND S.CITY IS NOT NULL 
AND O.SALESMAN_ID = S.ID 
AND O.customer_id = C.customer_id; 

-- 6. From the following table, write a SQL query to find those customers who are served by 
-- a salesperson and the salesperson earns commission in the range of 12% to 14% 
-- (Begin and end values are included.). Return cust_name AS "Customer", city AS "City". 

SELECT C.cust_name AS "CUSTOEMR" , C.CITY AS "CITY" , S.NAME AS "SALESMAN NAME" , S.COMMISSION AS "COMMISSION"
FROM CUSTOMERS C, SALESMAN S 
WHERE S.COMMISSION BETWEEN 0.12 AND 0.14
AND S.ID = C.SALESMAN_ID;

-- 7. From the following tables, write a SQL query to find all orders executed by the salesperson
--  and ordered by the customer whose grade is greater than or equal to 200. Compute 
--  purch_amt*commission as “Commission”. Return customer name, commission as “Commission%” 
--  and Commission.

SELECT O.ORD_NO AS "ORDER NO" , C.cust_name , O.PURCH_AMT * S.COMMISSION AS "COMMISSION" , COMMISSION AS "COMMISSION%" 
FROM ORDERS O, SALESMAN S, CUSTOMERS C 
WHERE O.SALESMAN_ID = S.ID 
AND O.customer_id = C.customer_id
AND C.GRADE >= 200;

-- 8. From the following table, write a SQL query to find those customers who placed orders on 
-- October(10) 5, 2012. Return customer_id, cust_name, city, grade, salesman_id, ord_no, purch_amt,
--  ord_date, customer_id and salesman_id.

SELECT C.customer_id , C.cust_name , C.CITY , C.GRADE , C.SALESMAN_ID , O.ORD_NO , O.PURCH_AMT , O.ORD_DATE , O.customer_id , O.SALESMAN_ID
FROM CUSTOMERS C , ORDERS O
WHERE O.customer_id = C.customer_id
AND O.ORD_DATE = '2012-10-5';
