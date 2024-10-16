-- 1. From the following tables, write a SQL query to find the information on each salesperson of ABC Company. Return name, city, country and state of each salesperson.

SELECT CONCAT(S.FIRST_NAME , S.LAST_NAME) AS 'FULLNAME' , A.CITY , A.country
FROM salespersons S LEFT JOIN address A
ON S.salesperson_ID = A.salesperson_ID;

-- 2. From the following table, write a SQL query to find the third highest sale. Return sale amount.

SELECT SALE_AMT 
FROM SALEMAST S1
WHERE N-1 = (
    SELECT COUNT(DISTINCT SALE_AMT)
    FROM S2
    WHERE S2.SALE_AMT > S1.SALE_AMT
);

-- 3RD HIGHEST SALARY
SELECT SALE_AMT 
FROM SALEMAST S1
WHERE 3-1 = (
    SELECT COUNT(DISTINCT SALE_AMT)
    FROM SALEMAST S2
    WHERE S2.SALE_AMT > S1.SALE_AMT
);

-- 3. From the following table, write a SQL query to find the Nth highest sale. Return sale amount.

SELECT SALE_AMT 
FROM SALEMAST S1
WHERE N-1 = (
    SELECT COUNT(DISTINCT SALE_AMT)
    FROM SALEMAST S2 
    WHERE S2.SALE_AMT > S1.SALE_AMT
);

--4TH HIGHEST SALARY
SELECT SALE_AMT 
FROM SALEMAST S1
WHERE 4-1 = (
    SELECT COUNT(DISTINCT SALE_AMT)
    FROM SALEMAST S2 
    WHERE S2.SALE_AMT > S1.SALE_AMT
);

-- 4. From the following table, write a SQL query to find the marks, which appear at least thrice one after another without interruption. Return the number.

SELECT L1.marks AS "CONSECUTIVE_NUM"
FROM LOGS L1 
JOIN LOGS L2 ON L1.STUDENT_ID = L2.STUDENT_ID-1 AND L1.marks = L2.marks
JOIN LOGS L3 ON L2.STUDENT_ID = L3.STUDENT_ID-1 AND L2.marks = L3.marks;

-- 5. From the following table, write a SQL query to find all the duplicate emails (no upper case letters) of the employees. Return email id.

SELECT DISTINCT email_ID
FROM employees E1
WHERE 1 < (
    SELECT COUNT(E2.email_ID) 
    FROM employees E2
    WHERE E1.email_ID = E2.email_ID
);

-- 6. From the following tables, write a SQL query to find those customers who never ordered anything. Return customer name.

SELECT customer_name 
FROM customers C 
WHERE C.customer_id NOT IN (
    SELECT customer_id
    FROM orders O 
    WHERE O.customer_id = C.customer_id
);


-- 7. From the following table, write a SQL query to remove all the duplicate emails of employees keeping the unique email with the lowest employee id. Return employee id and unique emails.

DELETE E2 FROM employees E1 , employees E2 
WHERE E1.email_ID = E2.email_ID AND E2.employee_ID > E1.employee_ID;

-- 8. From the following table, write a SQL query to find all dates' city ID with higher pollution compared to its previous dates (yesterday). Return city ID, date and pollution.

