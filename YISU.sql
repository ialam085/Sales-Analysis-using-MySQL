CREATE DATABASE MAY2025;     -- create a new database

SHOW DATABASES;              -- show all the databases

USE MAY2025;                 -- choose current database session

SHOW TABLES;                 -- show all the tables within a database

USE YISU;

SHOW TABLES;

SHOW SCHEMAS;                -- show all the schemas

SELECT * FROM BFSI;

SELECT Order_Date, City, Ship_Mode, Total_Amount FROM DA.SALES
ORDER BY Total_Amount ASC;

SELECT order_date, city, region, ship_mode, total_amount
FROM DA.sales
ORDER BY region ASC, total_amount DESC;


Select product_name, total_amount
from da.sales
order by total_amount desc limit 3;


Select distinct(Region) as `unique region`
from DA.Sales;

Select count(distinct(Region)) as `unique region count`
from DA.Sales;


Select count(distinct(Country)) as `unique country count`
from DA.Sales;


Select distinct(Country) as `unique country`
from DA.Sales;

SELECT Region, SUM(Total_Amount) as `Total Amount`
from DA.Sales
group by Region;


SELECT Region, SUM(Total_Amount) as `Maximum Revenue`
from DA.Sales
group by Region
order by `Maximum Revenue` desc
limit 1;


SELECT COUNTRY, SUM(TOTAL_AMOUNT) AS `TOTAL AMOUNT`
FROM DA.SALES
GROUP BY COUNTRY
ORDER BY SUM(TOTAL_AMOUNT) DESC
LIMIT 3;


SELECT COUNTRY, SUM(TOTAL_AMOUNT) AS `TOTAL AMOUNT`
FROM DA.SALES
GROUP BY COUNTRY
ORDER BY `TOTAL AMOUNT` DESC
LIMIT 2, 1;                -- 3rd highest revenue generated country


SELECT COUNTRY, SUM(TOTAL_AMOUNT) AS TOTAL_AMOUNT
FROM DA.SALES
GROUP BY COUNTRY
ORDER BY TOTAL_AMOUNT DESC
LIMIT 2, 3;


SELECT Ship_Mode, AVG(Total_Amount) FROM sales
GROUP BY Ship_Mode;


SELECT Ship_Mode, AVG(Total_Amount) as avgtot FROM sales
WHERE Ship_Mode != 'Economy Plus'
GROUP BY Ship_Mode
HAVING avgtot > 1400
ORDER BY avgtot DESC
LIMIT 1;


SELECT Customer_Name, Total_Amount,
ROW_NUMBER() OVER (ORDER BY Total_Amount DESC) AS RowNum
FROM SALES;


CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    class VARCHAR(10),
    subject VARCHAR(30),
    marks INT
	);
    

INSERT INTO students (student_id, name, class, subject, marks) VALUES
(1, 'Amit', '10A', 'Math', 85),
(2, 'Priya', '10A', 'Math', 90),
(3, 'Ravi', '10A', 'Math', 75),
(4, 'Sneha', '10A', 'Math', 90),  -- tie with Priya
(5, 'Kunal', '10A', 'Math', 70),
(6, 'Neha', '10A', 'Math', 85),  -- tie with Amit
(7, 'Rohit', '10A', 'Math', 80),
(8, 'Sana', '10A', 'Math', 75),  -- tie with Ravi
(9, 'Vikram', '10A', 'Math', 65),
(10, 'Tina', '10A', 'Math', 60);


SELECT * FROM STUDENTS;


SELECT NAME, MARKS, ROW_NUMBER() OVER(ORDER BY MARKS DESC) AS RowNum
FROM STUDENTS;

SELECT NAME, MARKS, RANK() OVER(ORDER BY MARKS DESC) AS rk
FROM STUDENTS;

SELECT NAME, MARKS, DENSE_RANK() OVER(ORDER BY MARKS DESC) AS Drank
FROM STUDENTS;

SELECT NAME, MARKS, NTILE(5) OVER(ORDER BY MARKS DESC) AS nt
FROM STUDENTS;



-- Common Table Expression (CTE)
-- Show the 3rd rank student

WITH CTE_SPrank AS
(
SELECT NAME, MARKS, DENSE_RANK() OVER(ORDER BY MARKS DESC) AS Drank
FROM STUDENTS
)
SELECT * FROM CTE_SPrank
WHERE Drank IN(3, 6);

-------------------------------------------
-- JOINS --

-- INNER JOIN
-- LEFT JOIN
-- RIGHT JOIN
-- FULL JOIN
-- CROSS JOIN
-- SELF JOIN

CREATE TABLE Stud_info (
    student_id INT PRIMARY KEY,
    gender VARCHAR(10),
    city VARCHAR(50)
);

INSERT INTO Stud_info (student_id, gender, city) VALUES
(1, 'Male', 'Delhi'),
(2, 'Female', 'Mumbai'),
(4, 'Female', 'Bangalore'),
(6, 'Female', 'Hyderabad'),
(9, 'Male', 'Chennai'),
(11, 'Male', 'Delhi'),
(12, 'Female', 'Mumbai');


SELECT * FROM STUDENTS;
SELECT * FROM Stud_info;


-- INNER JOIN -- exactly matched values from both the tables

SELECT S.student_id, S.name, I.student_id, I.city
FROM STUDENTS as S
INNER JOIN Stud_info as I
ON S.student_id = I.student_id;


-- LEFT JOIN -- all records from left table & matched record from right table

SELECT S.student_id, S.name, I.student_id, I.city
FROM STUDENTS as S
LEFT JOIN Stud_info as I
ON S.student_id = I.student_id;


-- RIGHT JOIN -- all records from right table & matched record from left table

SELECT S.student_id, S.name, I.student_id, I.city
FROM STUDENTS as S
RIGHT JOIN Stud_info as I
ON S.student_id = I.student_id;


-- FULL JOIN -- all records from both the tables

SELECT S.student_id, S.name, I.student_id, I.city
FROM STUDENTS as S
FULL JOIN Stud_info as I
ON S.student_id = I.student_id;