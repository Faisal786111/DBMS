/*1. From the following tables, write a SQL query to find all the orders issued by the salesman 'Paul Adam'. 
Return ord_no, purch_amt, ord_date, customer_id and salesman_id.*/

SELECT * FROM ORDERS 
WHERE salesman_id =(SELECT salesman_id FROM salesman
where name = 'Paul Adam');

-- 2. From the following tables write a SQL query to find all orders generated by London-based salespeople.
-- Return ord_no, purch_amt, ord_date, customer_id, salesman_id.

SELECT * FROM ORDERS 
WHERE salesman_id = (
    SELECT salesman_id FROM salesman
    WHERE CITY = "LONDON"
);

/*3. From the following tables write a SQL query to find all orders generated by the salespeople who 
may work for customers whose id is 5002. Return ord_no, purch_amt, ord_date, customer_id, salesman_id.*/

SELECT * FROM ORDERS 
WHERE salesman_id IN (
    SELECT salesman_id FROM ORDERS
    WHERE salesman_id = 5002
);

-- 4. From the following tables write a SQL query to find the order values greater than the average 
-- order value of 10th October 2012. Return ord_no, purch_amt, ord_date, customer_id, salesman_id.

SELECT * FROM ORDERS 
WHERE purch_amt > (
    SELECT AVG(purch_amt) FROM ORDERS 
    WHERE ord_date = "2012-10-10"
);

/*5. From the following tables, write a SQL query to find all the orders generated in New York city.
 Return ord_no, purch_amt, ord_date, customer_id and salesman_id.*/

SELECT * FROM ORDERS 
WHERE salesman_id IN (
    SELECT salesman_id FROM salesman
    WHERE CITY = "NEW YORK"
);

-- 6. From the following tables write a SQL query to determine the commission of the salespeople in Paris.
--  Return commission.

SELECT commission 
FROM salesman 
WHERE CITY = "PARIS";

-- 7. Write a query to display all the customers whose ID is 2001 below the salesperson ID of Mc Lyon.
SELECT * FROM customers
WHERE customer_id IN (
    SELECT salesman_id - 2001
    FROM salesman
    WHERE NAME = "MC LYON"
);

-- 8. From the following tables write a SQL query to count the number of customers with grades above the 
-- average in New York City. Return grade and count.  

SELECT grade ,  COUNT(grade) 
FROM customers 
GROUP BY grade
HAVING grade > (
    SELECT AVG(grade) FROM customers
    WHERE CITY = "NEW YORK"
);

-- 9. From the following tables, write a SQL query to find those salespeople who earned the maximum commission. 
-- Return ord_no, purch_amt, ord_date, and salesman_id.

SELECT * FROM ORDERS
WHERE salesman_id IN (
    SELECT salesman_id FROM salesman
    WHERE commission IN (
        SELECT MAX(commission) FROM salesman
    )
);

-- 10. From the following tables write SQL query to find the customers who placed orders on 17th August 2012.
-- Return ord_no, purch_amt, ord_date, customer_id, salesman_id and cust_name.

SELECT * FROM customers
WHERE customer_id IN (
    SELECT customer_id FROM ORDERS
    WHERE ord_date = "2012-08-17"
);

-- 11. From the following tables write a SQL query to find salespeople who had more than one customer. 
-- Return salesman_id and name.

SELECT S.salesman_id , S.NAME 
FROM salesman S 
WHERE 1 < (
    SELECT COUNT(*)
    FROM customers
    WHERE salesman_id = S.salesman_id
);

-- 12. From the following tables write a SQL query to find those orders, which are higher than 
-- the average amount of the orders. Return ord_no, purch_amt, ord_date, customer_id and salesman_id.

SELECT * 
FROM ORDERS
WHERE purch_amt > (
    SELECT AVG(purch_amt) FROM ORDERS
);

-- 13. From the following tables write a SQL query to find those orders that are equal or higher than 
-- the average amount of the orders. Return ord_no, purch_amt, ord_date, customer_id and salesman_id.

SELECT * 
FROM ORDERS
WHERE purch_amt >= (
    SELECT AVG(purch_amt) FROM ORDERS
);

-- 14. Write a query to find the sums of the amounts from the orders table, grouped by date, and 
-- eliminate all dates where the sum was not at least 1000.00 above the maximum order amount for that date.

SELECT ord_date , SUM(purch_amt)
FROM ORDERS A 
GROUP BY ord_date
HAVING SUM(purch_amt) > (
    SELECT 1000.00 + MAX(purch_amt) 
    FROM ORDERS B 
    WHERE A.ord_date = B.ord_date
);

-- 15. Write a query to extract all data from the customer table if and only if one or more of the 
-- customers in the customer table are located in London.

SELECT * 
FROM customers 
WHERE EXISTS (
    SELECT * FROM customers
    WHERE CITY = "LONDON"
);

-- 16. From the following tables write a SQL query to find salespeople who deal with multiple customers. 
-- Return salesman_id, name, city and commission.

SELECT * FROM salesman
WHERE salesman_id IN (
    SELECT DISTINCT B.salesman_id FROM customers B
    WHERE EXISTS
    (
        SELECT C.salesman_id FROM customers C 
        WHERE C.salesman_id = B.salesman_id AND C.cust_name <> B.cust_name
    )
);

-- 17. From the following tables write a SQL query to find salespeople who deal with a single customer. 
-- Return salesman_id, name, city and commission.

SELECT * FROM salesman
WHERE salesman_id IN (
    SELECT DISTINCT B.salesman_id FROM customers B
    WHERE NOT EXISTS
    (
        SELECT C.salesman_id FROM customers C 
        WHERE C.salesman_id = B.salesman_id AND C.cust_name <> B.cust_name
    )
); 

-- 18. From the following tables, write a SQL query to find the salespeople who deal the customers 
-- with more than one order. Return salesman_id, name, city and commission.
SELECT * FROM salesman B 
WHERE EXISTS(
    SELECT C.salesman_id FROM customers C 
    WHERE C.salesman_id = B.salesman_id
    AND 1 < (
        SELECT COUNT(*) 
        FROM ORDERS O 
        WHERE O.salesman_id = B.salesman_id
    )
);

-- 19. From the following tables write a SQL query to find all salespeople who are located in any 
-- city where there is at least one customer. Return salesman_id, name, city and commission.

SELECT * FROM salesman
WHERE CITY = ANY (
    SELECT CITY FROM customers
);