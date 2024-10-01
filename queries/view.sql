-- 1. From the following table, create a view for those salespeople who belong to the city of New York. 

CREATE VIEW SALESMAN1
AS SELECT * FROM SALESMAN
WHERE CITY = 'NEW YORK';

SELECT * FROM SALESMAN1;

-- 2. From the following table, create a view for all salespersons. Return salesperson ID, name, and city.

CREATE VIEW SALESPERSONS 
AS SELECT SALESMAN_ID , NAME , CITY FROM SALESMAN;

SELECT * FROM SALESPERSONS;

-- 3. From the following table, create a view to locate the salespeople in the city 'New York'.
CREATE VIEW SALESMAN1
AS SELECT * FROM SALESMAN
WHERE CITY = 'NEW YORK';

-- 4. From the following table, create a view that counts the number of customers in each grade.  
CREATE VIEW S2 
AS SELECT GRADE , COUNT(GRADE) AS NUMBER FROM CUSTOMERS
GROUP BY GRADE;

-- 5. From the following table, create a view to count the number of unique customers, 
-- compute the average and the total purchase amount of customer orders by each date.

CREATE VIEW O1 
AS SELECT ord_date , COUNT(DISTINCT CUSTOMER_ID) AS COUNT, AVG(PURCH_AMT) AS AVG , SUM(PURCH_AMT)
FROM ORDERS
GROUP BY ORD_DATE;

-- 6. From the following tables, create a view to get the salesperson and 
-- customer by name. Return order name, purchase amount, salesperson ID, name, customer name.

CREATE VIEW O2 
AS SELECT O.ORD_NO , O.PURCH_AMT , O.SALESMAN_ID , S.NAME , C.CUST_NAME
FROM ORDERS O, CUSTOMERS C, SALESMAN S 
WHERE O.CUSTOMER_ID = C.CUSTOMER_ID AND O.SALESMAN_ID = S.SALESMAN_ID; 

-- 7. From the following table, create a view to find the salesperson who handles a customer
--  who makes the highest order of the day. Return order date, salesperson ID, name.

CREATE VIEW O3
AS SELECT O.ORD_DATE , O.SALESMAN_ID , S.NAME
FROM ORDERS O, SALESMAN S 
WHERE O.SALESMAN_ID = S.SALESMAN_ID  AND O.PURCH_AMT IN(SELECT MAX(PURCH_AMT) FROM ORDERS WHERE SALESMAN_ID = O.SALESMAN_ID);

-- 8. From the following table, create a view to find the salesperson who deals with the customer
--  with the highest order at least three times per day. Return salesperson ID and name.

CREATE VIEW S4
AS SELECT DISTINCT S.SALESMAN_ID , S.NAME 
FROM SALESMAN S, CUSTOMERS C 
WHERE S.SALESMAN_ID = C.SALESMAN_ID 
AND 3 <= (SELECT COUNT(*) FROM CUSTOMERS
WHERE SALESMAN_ID = S.SALESMAN_ID);

-- 9. From the following table, create a view to find all the customers who have the highest grade.
--  Return all the fields of customer.

CREATE VIEW C4 
AS SELECT * FROM CUSTOMERS
WHERE GRADE IN (SELECT MAX(GRADE) FROM CUSTOMERS);

-- 10. From the following table, create a view to count the number of salespeople in each city.
--  Return city, number of salespersons.

CREATE VIEW S5 
AS SELECT CITY , COUNT(CITY)
FROM SALESMAN 
GROUP BY CITY;

-- 11. From the following table, create a view to compute the average purchase amount and total purchase amount for each salesperson. 
-- Return name, average purchase and total purchase amount. (Assume all names are unique.).

CREATE VIEW OS1 
AS SELECT S.NAME ,AVG(O.PURCH_AMT) AS AVG , SUM(O.PURCH_AMT) AS SUM
FROM ORDERS O JOIN SALESMAN S 
ON O.SALESMAN_ID = S.SALESMAN_ID
GROUP BY O.SALESMAN_ID;

-- 12. From the following table, create a view to identify salespeople who work with multiple clients. 
-- Return all the fields of salesperson.

CREATE VIEW SC1
AS SELECT * 
FROM SALESMAN S
WHERE 1 < (SELECT COUNT(*) FROM CUSTOMERS 
WHERE SALESMAN_ID = S.SALESMAN_ID);

-- 13. From the following table, create a view that shows all matching customers with salespeople,
--  ensuring that at least one customer in the city of the customer is served by the salesperson 
--  in the city of the salesperson.

CREATE VIEW SC2
AS SELECT DISTINCT C.CITY AS "CUSTOMER_CITY" , S.CITY AS "SCITY"
FROM SALESMAN S JOIN CUSTOMERS C 
ON S.SALESMAN_ID = C.SALESMAN_ID;

-- 14. From the following table, create a view to display the number of orders per day. Return order date and number of orders.
CREATE VIEW O5
AS SELECT O.ORD_DATE , COUNT(*)
FROM ORDERS O
GROUP BY O.ORD_DATE;

-- 15. From the following table, create a view to find the salespeople who placed orders on October 10th, 2012. Return all the fields of salesperson.
CREATE VIEW S6
AS SELECT * FROM SALESMAN S 
WHERE S.SALESMAN_ID IN (SELECT SALESMAN_ID FROM ORDERS WHERE ORD_DATE = '2012-10-10');

-- 16. From the following table, create a view to find the salespersons who issued orders on either August 17th, 2012 or October 10th, 2012. 
-- Return salesperson ID, order number and customer ID.

CREATE VIEW O6
AS SELECT salesman_id , ORD_NO , CUSTOMER_ID
FROM  ORDERS
WHERE ORD_DATE IN ('2012-08-17' , '2012-10-10');
