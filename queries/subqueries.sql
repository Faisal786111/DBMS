/*1. From the following tables, write a SQL query to find all the orders issued by the salesman 'Paul Adam'. 
Return ord_no, purch_amt, ord_date, customer_id and salesman_id.*/


SELECT * FROM ORDERS 
WHERE salesman_id =(SELECT salesman_id FROM salesman
where name = 'Paul Adam');