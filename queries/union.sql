-- 1. From the following tables, write a SQL query to find all salespeople and customers located in 
-- the city of London.

SELECT customer_id AS ID , CUST_NAME AS NAME FROM customers
WHERE CITY = "LONDON"
UNION
SELECT SALESMAN_ID AS ID , NAME FROM SALESMAN 
WHERE CITY = "LONDON";

-- 2. From the following tables, write a SQL query to find distinct salespeople and their cities. 
-- Return salesperson ID and city.

SELECT SALESMAN_ID , CITY 
FROM customers
UNION
SELECT SALESMAN_ID , CITY 
FROM SALESMAN;

-- 3. From the following tables, write a SQL query to find all those salespeople and customers who are 
-- involved in the inventory management system. Return salesperson ID, customer ID.

SELECT SALESMAN_ID , customer_id
FROM ORDERS 
UNION 
SELECT SALESMAN_ID , customer_id
FROM customers;

-- 4. From the following table, write a SQL query to find the salespersons who generated the largest and
-- smallest orders on each date. Return salesperson ID, name, order no., highest on/lowest on, order date.

SELECT S.SALESMAN_ID ,S.NAME , A.ORD_NO , "HIGHEST NO" AS ORD_TYPE , A.ORD_DATE
FROM SALESMAN S , ORDERS A 
WHERE S.SALESMAN_ID = A.SALESMAN_ID 
AND A.PURCH_AMT IN (
    SELECT MAX(B.PURCH_AMT) 
    FROM ORDERS B
    WHERE B.SALESMAN_ID = A.SALESMAN_ID
)
UNION
SELECT S.SALESMAN_ID ,S.NAME , A.ORD_NO , "LOWEST NO" AS ORD_TYPE , A.ORD_DATE
FROM SALESMAN S , ORDERS A 
WHERE S.SALESMAN_ID = A.SALESMAN_ID 
AND A.PURCH_AMT IN (
    SELECT MIN(B.PURCH_AMT) 
    FROM ORDERS B
    WHERE B.SALESMAN_ID = A.SALESMAN_ID
);

-- 5. From the following tables, write a SQL query to find the salespeople who generated the largest and 
-- smallest orders on each date. Sort the result-set on third field. 
-- Return salesperson ID, name, order no., highest on/lowest on, order date.

SELECT S.SALESMAN_ID ,S.NAME , A.ORD_NO , "HIGHEST NO" AS ORD_TYPE , A.ORD_DATE
FROM SALESMAN S , ORDERS A 
WHERE S.SALESMAN_ID = A.SALESMAN_ID 
AND A.PURCH_AMT IN (
    SELECT MAX(B.PURCH_AMT) 
    FROM ORDERS B
    WHERE B.SALESMAN_ID = A.SALESMAN_ID
)
UNION
SELECT S.SALESMAN_ID ,S.NAME , A.ORD_NO , "LOWEST NO" AS ORD_TYPE , A.ORD_DATE
FROM SALESMAN S , ORDERS A 
WHERE S.SALESMAN_ID = A.SALESMAN_ID 
AND A.PURCH_AMT IN (
    SELECT MIN(B.PURCH_AMT) 
    FROM ORDERS B
    WHERE B.SALESMAN_ID = A.SALESMAN_ID
)
ORDER BY 3;

-- 6. From the following tables, write a SQL query to find those salespeople who live in 
-- the same city where the customer lives as well as those who do not have customers in their 
-- cities by indicating 'NO MATCH'. Sort the result set on 2nd column (i.e. name) in descending order. 
-- Return salesperson ID, name, customer name, commission.

SELECT S.SALESMAN_ID , S.NAME AS "NAME" , C.CUST_NAME AS "CUST_NAME" , S.commission 
FROM SALESMAN S , customers C 
WHERE S.CITY = C.CITY
UNION
SELECT S.SALESMAN_ID , S.NAME AS "NAME" , "NOT MATCH" AS "CUST_NAME" , S.commission 
FROM SALESMAN S 
WHERE NOT S.CITY = ANY (
    SELECT CITY FROM customers
)
ORDER BY 2 DESC;

-- 7. From the following tables, write a SQL query that appends strings to the selected 
-- fields, indicating whether the city of any salesperson is matched with the city of any customer.
-- Return salesperson ID, name, city, MATCHED/NO MATCH.

SELECT S.SALESMAN_ID , S.NAME , S.CITY , "MATCHED" AS MATCH_TYPE
FROM SALESMAN S
WHERE S.CITY IN ( SELECT CITY FROM customers)
UNION
SELECT S.SALESMAN_ID , S.NAME , S.CITY , "NOT MATCHED" AS MATCH_TYPE
FROM SALESMAN S 
WHERE NOT S.CITY = ANY ( SELECT CITY FROM customers);

-- 8. From the following table, write a SQL query to create a union of two queries that shows the 
-- customer id, cities, and ratings of all customers. Those with a rating of 300 or greater will have 
-- the words 'High Rating', while the others will have the words 'Low Rating'.

SELECT C.customer_id , C.CUST_NAME , C.GRADE ,  "HIGH RATING" AS RATING_TYPE
FROM customers C
WHERE C.GRADE >= 300
UNION
SELECT C.customer_id , C.CUST_NAME , C.GRADE ,  "LOW RATING" AS RATING_TYPE
FROM customers C
WHERE C.GRADE < 300
ORDER BY 1;

-- 9. From the following table, write a SQL query to find those salespersons and customers who have 
-- placed more than one order. Return ID, name.
SELECT C.customer_id AS ID , C.CUST_NAME AS NAME 
FROM CUSTOMERS C 
WHERE 1 < (
    SELECT COUNT(O.ORD_NO)
    FROM ORDERS O 
    WHERE O.customer_id = C.customer_id
)
UNION
SELECT S.SALESMAN_ID AS ID , S.NAME AS NAME 
FROM SALESMAN S 
WHERE 1 < (
    SELECT COUNT(O.ORD_NO)
    FROM ORDERS O 
    WHERE O.SALESMAN_ID = S.SALESMAN_ID
);