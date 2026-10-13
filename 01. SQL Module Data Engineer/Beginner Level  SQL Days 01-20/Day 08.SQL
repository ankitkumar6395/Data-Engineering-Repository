-- 🚀 DAY 8 — SQL Subqueries

-- Today you will learn Subqueries, an important SQL concept used when one query needs the result of another query.

-- 📚 STUDY DAY 8
-- What is a Subquery?

-- A subquery is a query written inside another SQL query.
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- Inner query → calculates average salary
-- Outer query → finds employees earning more than that average

-- Common Uses
-- Find employees earning above average
-- Find highest/lowest values
-- Compare data with another result
-- Filter using another query
-- Important Structure

-- Outer Query
-- → uses the result of
-- Inner Query

-- 💻 CODE DAY 8
-- 1. Create the database
-- This database will be used to practice SQL subqueries.
CREATE DATABASE company_day8;

-- 2. Select the database
-- This tells MySQL which database we want to work with.
USE company_day8;

-- 3. Create the employees table
-- This table will store employee information for subquery practice.
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

-- 4. Insert employee records
-- These records will be used for subquery examples.
INSERT INTO employees
(employee_id, employee_name, department, salary)
VALUES
(101, 'Rahul Sharma', 'IT', 65000),
(102, 'Amit Kumar', 'HR', 45000),
(103, 'Priya Singh', 'Finance', 55000),
(104, 'Neha Verma', 'IT', 72000),
(105, 'Ravi Kumar', 'Sales', 40000),
(106, 'Pooja Sharma', 'Finance', 60000),
(107, 'Suresh Yadav', 'IT', 58000),
(108, 'Anjali Gupta', 'HR', 48000);

-- 5. Find employees earning above average salary
-- The inner query calculates the average salary.
-- The outer query finds employees above that average.
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- 6. Find the employee with the highest salary
-- The inner query finds the maximum salary.
-- The outer query finds the employee having that salary.
SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

-- 7. Find the employee with the lowest salary
-- The inner query finds the minimum salary.
SELECT *
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
);

-- 8. Find employees earning more than Rahul Sharma
-- The inner query gets Rahul's salary.
-- The outer query finds employees with a higher salary.
SELECT *
FROM employees
WHERE salary > (
    SELECT salary
    FROM employees
    WHERE employee_name = 'Rahul Sharma'
);

-- 9. Find employees working in Rahul's department
-- The inner query finds Rahul's department.
-- The outer query finds employees in that department.
SELECT *
FROM employees
WHERE department = (
    SELECT department
    FROM employees
    WHERE employee_name = 'Rahul Sharma'
);

-- 10. Find IT employees earning more than the average IT salary
-- The inner query calculates the average salary of IT employees.
-- The outer query finds IT employees above that average.
SELECT *
FROM employees
WHERE department = 'IT'
AND salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = 'IT'
);

-- 🧪 10 PRACTICE QUESTIONS ANSWERS — DAY 8
-- 1. Find employees earning more than the average salary.
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- 2. Find the employee with the highest salary using a subquery.
SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

-- 3. Find the employee with the lowest salary using a subquery.
SELECT *
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
);

-- 4. Find employees earning more than Rahul Sharma.
SELECT *
FROM employees
WHERE salary > (
    SELECT salary
    FROM employees
    WHERE employee_name = 'Rahul Sharma'
);

-- 5. Find employees earning less than Rahul Sharma.
SELECT *
FROM employees
WHERE salary < (
    SELECT salary
    FROM employees
    WHERE employee_name = 'Rahul Sharma'
);

-- 6. Find employees working in the same department as Priya Singh.
SELECT *
FROM employees
WHERE department = (
    SELECT department
    FROM employees
    WHERE employee_name = 'Priya Singh'
);

-- 7. Find employees whose salary is equal to the highest salary.
SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

-- 8. Find IT employees earning more than the average IT salary.
SELECT *
FROM employees
WHERE department = 'IT'
AND salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = 'IT'
);

-- 9. Find Finance employees earning more than the average company salary.
SELECT *
FROM employees
WHERE department = 'Finance'
AND salary > (
    SELECT AVG(salary)
    FROM employees
);

-- 10. Find employees whose salary is greater than the average salary of HR employees.
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = 'HR'
);

-- 🛠️ MINI PROJECT — DAY 8
-- Employee Salary Benchmarking System — Solution

-- 1. Find employees earning above the company average
-- The subquery calculates the company average salary.
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- 2. Find employees earning below the company average
-- The subquery calculates the company average salary.
SELECT *
FROM employees
WHERE salary < (
    SELECT AVG(salary)
    FROM employees
);

-- 3. Find the highest-paid employee
-- The subquery finds the maximum salary.
SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

-- 4. Find the lowest-paid employee
-- The subquery finds the minimum salary.
SELECT *
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
);

-- 5. Find employees earning more than Rahul Sharma
-- The subquery gets Rahul Sharma's salary.
SELECT *
FROM employees
WHERE salary > (
    SELECT salary
    FROM employees
    WHERE employee_name = 'Rahul Sharma'
);

-- 6. Find employees in Priya Singh's department
-- The subquery gets Priya Singh's department.
SELECT *
FROM employees
WHERE department = (
    SELECT department
    FROM employees
    WHERE employee_name = 'Priya Singh'
);

-- 7. Find IT employees earning above the IT average
-- The subquery calculates the average salary of IT employees.
SELECT *
FROM employees
WHERE department = 'IT'
AND salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = 'IT'
);

-- 8. Create the final salary benchmark report
-- This report shows employees whose salary is above the company average.
SELECT
    employee_id,
    employee_name,
    department,
    salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
)
ORDER BY salary DESC;

-- 🎯 INTERVIEW QUESTIONS + ANSWERS

-- 1. What is a subquery?
-- Answer: A subquery is a SQL query written inside another SQL query.

-- 2. What is an inner query?
-- Answer: The inner query is the query that executes inside the outer query and provides a result.

-- 3. What is an outer query?
-- Answer: The outer query uses the result produced by the inner query.

-- 4. Can a subquery use aggregate functions?
-- Answer: Yes. Functions such as AVG(), MAX(), MIN(), and SUM() can be used inside subqueries.

-- 5. Why are subqueries useful?
-- Answer: They allow us to use the result of one query to filter or compare data in another query.

-- 6. Give an example of a business use case.
-- Answer: HR can use a subquery to identify employees whose salary is higher than the company's average salary.

-- ✅ Day 8 Project Complete

-- Subquery → Inner Query → Result → Outer Query → Business Analysis
