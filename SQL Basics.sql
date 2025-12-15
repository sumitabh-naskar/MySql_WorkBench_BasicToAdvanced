-- Q1.
CREATE DATABASE company_db;
USE company_db;

CREATE TABLE employees(
employee_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
department VARCHAR(50),
salary INT,
hire_date DATE
);

-- Q2.
INSERT INTO employees(employee_id,first_name,last_name,department,salary,hire_date)
VALUES
(101,'Amit','Sharma','HR',50000,'2020-01-15'),
(102,'Riya','Kapoor','Sales',75000,'2019-03-22'),
(103,'Raj','Mehta','IT',90000,'2018-07-11'),
(104,'Neha','Verma','IT',85000,'2021-09-01'),
(105,'Arjun','Singh','Finance',60000,'2022-02-10');

-- Q3.
SELECT * FROM employees 
ORDER BY salary ASC;

-- Q4.
SELECT * FROM employees ORDER BY
department ASC, salary DESC;

-- Q5. 
SELECT * FROM employees
WHERE department = 'IT' ORDER BY hire_date DESC;

-- Q6.
CREATE TABLE sales(
sale_id INT PRIMARY KEY,
customer_name VARCHAR(50),
amount INT,
sale_date DATE);

INSERT INTO sales (sale_id,customer_name,amount,sale_date)VALUES
 (1,'Aditi',1500,'2024-08-01'),
 (2,'Rohan',2200,'2024-08-03'),
 (3,'Aditi',3500,'2024-09-05'),
 (4,'Meena',2700,'2024-09-15'),
 (5,'Rohan',4500,'2024-09-25');
 
-- Q7. 
SELECT * FROM sales 
ORDER BY amount DESC;

-- Q8.
SELECT * FROM sales
WHERE customer_name = 'Aditi';

-- Q9. 
-- PRIMARY KEY:
-- It is used to uniquely identify a data in a table and it cannot be NULL.

-- FOREIGN KEY:
-- It is an instance of Primary Key means it is used in another table to reference 
-- the Primary Key of other table which builds a relationship between two tables.

-- Q10.
-- SQL Constraints are a set of rules applied to columns or tables in a database to ensure the accuracy,
-- reliability, and consistency of data (collectively known as data integrity).
