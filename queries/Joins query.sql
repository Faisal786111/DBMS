-- DON'T USE NATRURAL JOIN IF THE COLUMN NAMES ARE NOT SAME IMP!
-- 1. From the following tables write a SQL query to find the salesperson and customer who 
-- reside in the same city. Return Salesman, cust_name and city.

SELECT S.CITY , S.NAME , C.cust_name
FROM Salesman S, customers c
where S.city = C.city;

SELECT S.CITY , S.NAME , C.cust_name
FROM Salesman S NATURAL JOIN CUSTOMERS C 
WHERE S.CITY = C.CITY;


-- 2. From the following tables write a SQL query to find those orders where the order amount
--  exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.

SELECT O.ord_no , O.purch_amt , C.cust_name , C.CITY
FROM CUSTOMERS C NATURAL JOIN ORDERS O  
WHERE O.purch_amt BETWEEN 500 AND 2000;


-- 3. From the following tables write a SQL query to find the salesperson(s) and the customer(s) 
-- he represents. Return Customer Name, city, Salesman, commission.

SELECT C.cust_name , C.CITY , S.NAME , S.commission
FROM CUSTOMERS C , Salesman S
WHERE C.SALESMAN_ID = S.SALESMAN_ID;

SELECT C.cust_name , C.CITY , S.NAME , S.commission
FROM CUSTOMERS C NATURAL JOIN Salesman S;


SELECT C.cust_name , C.CITY , S.NAME , S.commission
FROM CUSTOMERS C JOIN Salesman S
ON C.SALESMAN_ID = S.SALESMAN_ID;

-- 4. From the following tables write a SQL query to find salespeople who received commissions of
--  more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission.  

-- DON'T USE NATRURAL JOIN IF THE COLUMN NAMES ARE NOT SAME IMP!
SELECT C.cust_name , C.CITY , S.NAME , S.commission
FROM CUSTOMERS C NATURAL JOIN Salesman S
WHERE S.commission > 0.12;

SELECT C.cust_name , C.CITY , S.NAME , S.commission
FROM CUSTOMERS C  JOIN Salesman S
ON C.SALESMAN_ID = S.SALESMAN_ID AND S.commission > 0.12;

-- 5. From the following tables write a SQL query to locate those salespeople who do not live in the
--  same city where their customers live and have received a commission of more than 12% from the company.
--   Return Customer Name, customer city, Salesman, salesman city, commission.  

SELECT C.cust_name , C.CITY , S.NAME , S.CITY , S.commission
FROM CUSTOMERS C JOIN Salesman S 
ON C.SALESMAN_ID = S.SALESMAN_ID
AND C.CITY <> S.CITY 
AND S.commission > 0.12;

-- 6. From the following tables write a SQL query to find the details of an order. Return ord_no, ord_date, 
-- purch_amt, Customer Name, grade, Salesman, commission.

SELECT O.ord_no , O.ord_date , O.purch_amt , C.cust_name , C.grade , S.NAME , S.commission
FROM ORDERS O 
JOIN CUSTOMERS C 
ON O.CUSTOMER_ID =C.CUSTOMER_ID
JOIN Salesman S 
ON O.SALESMAN_ID = S.SALESMAN_ID; 


SELECT O.ord_no , O.ord_date , O.purch_amt , C.cust_name , C.grade , S.NAME , S.commission
FROM ORDERS O NATURAL JOIN CUSTOMERS C
NATURAL JOIN Salesman S;

-- 7. Write a SQL statement to join the tables salesman, customer and orders so that the same column of each 
-- table appears once and only the relational rows are returned. 

-- NATURAL JOIN : RETURN REPEATED COLUMNS INTO ONE COLUMN
SELECT *
FROM ORDERS O NATURAL JOIN CUSTOMERS C
NATURAL JOIN Salesman S;

-- 8. From the following tables write a SQL query to display the customer name, customer city, grade, salesman, 
-- salesman city. The results should be sorted by ascending customer_id.  
SELECT C.cust_name , C.CITY , C.grade , S.NAME , S.CITY
FROM CUSTOMERS C 
INNER JOIN Salesman S 
ON C.SALESMAN_ID = S.SALESMAN_ID
ORDER BY  C.CUSTOMER_ID;

SELECT C.cust_name , C.CITY , C.grade , S.NAME , S.CITY
FROM CUSTOMERS C 
 JOIN Salesman S 
ON C.SALESMAN_ID = S.SALESMAN_ID
ORDER BY  C.CUSTOMER_ID;

-- 9. From the following tables write a SQL query to find those customers with a grade less than 300.
--  Return cust_name, customer city, grade, Salesman, salesmancity. The result should be ordered 
--  by ascending customer_id. 

SELECT C.cust_name , C.CITY , C.grade , S.NAME , S.CITY 
FROM CUSTOMERS C JOIN Salesman S 
ON C.SALESMAN_ID = S.SALESMAN_ID
WHERE C.grade < 300 
ORDER BY C.CUSTOMER_ID;

-- 10. Write a SQL statement to make a report with customer name, city, order number, order date, and 
-- order amount in ascending order according to the order date to determine whether any of the existing 
-- customers have placed an order or not.

SELECT C.cust_name , C.CITY ,O.ord_no , O.ord_date , O.purch_amt
FROM  CUSTOMERS C
LEFT JOIN ORDERS O
ON O.CUSTOMER_ID = C.CUSTOMER_ID
ORDER BY O.ORD_DATE;

-- 11. SQL statement to generate a report with customer name, city, order number, order date, order amount,
--  salesperson name, and commission to determine if any of the existing customers have not placed orders 
--  or if they have placed orders through their salesman or by themselves.

SELECT C.cust_name , C.CITY ,O.ord_no , O.ord_date , O.purch_amt , S.NAME , S.commission
FROM CUSTOMERS C 
LEFT JOIN ORDERS O
ON O.CUSTOMER_ID = C.CUSTOMER_ID 
LEFT JOIN Salesman S
ON O.SALESMAN_ID = S.SALESMAN_ID;

-- 12. Write a SQL statement to generate a list in ascending order of salespersons who work either for one or
--  more customers or have not yet joined any of the customers.

SELECT  C.cust_name , C.CITY , C.grade , S.NAME , S.CITY
FROM Salesman S 
LEFT JOIN CUSTOMERS C
ON S.SALESMAN_ID = C.SALESMAN_ID
ORDER BY S.SALESMAN_ID;

-- 13. From the following tables write a SQL query to list all salespersons along with customer name, 
-- city, grade, order number, date, and amount. Condition for selecting list of salesmen : 
-- 1. Salesmen who works for one or more customer or, 2. Salesmen who not yet join under any 
-- customer, Condition for selecting list of customer : 3. placed one or more orders, or 
-- 4. no order placed to their salesman.

SELECT C.cust_name , C.CITY , S.NAME ,O.ord_no , O.ord_date , O.purch_amt 
FROM CUSTOMERS C 
RIGHT JOIN Salesman S 
ON C.SALESMAN_ID = S.SALESMAN_ID
RIGHT JOIN ORDERS O 
ON O.CUSTOMER_ID = C.CUSTOMER_ID;


-- 14. Write a SQL statement to make a list for the salesmen who either work for one or more 
-- customers or yet to join any of the customer. The customer may have placed, either one or more orders 
-- on or above order amount 2000 and must have a grade, or he may not have placed any order to the 
-- associated supplier.

SELECT  C.cust_name , C.CITY , S.NAME ,O.ord_no , O.ord_date , O.purch_amt ,S.SALESMAN_ID ,S.NAME
FROM Salesman S 
LEFT JOIN CUSTOMERS C 
ON S.SALESMAN_ID = C.SALESMAN_ID
LEFT JOIN ORDERS O 
ON C.CUSTOMER_ID = O.CUSTOMER_ID AND O.purch_amt >=2000 
WHERE C.GRADE IS NOT NULL OR O.CUSTOMER_ID IS NULL;

