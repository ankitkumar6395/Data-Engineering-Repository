-- 🚀 DAY 4 — SQL Filtering & Sorting
-- 📚 STUDY

-- Today you will learn:

-- ORDER BY → Sort data
-- ASC → Ascending order
-- DESC → Descending order
-- LIMIT → Restrict number of rows
-- DISTINCT → Remove duplicate values
-- AND → Multiple conditions
-- OR → Either condition
-- IN → Match multiple values
-- BETWEEN → Filter within a range

-- 💻 CODE DAY 4

-- 1. Create the database
-- This database will be used to practice filtering and sorting.
CREATE DATABASE company_day4;

-- 2. Select the database
-- This tells MySQL which database we want to work with.
USE company_day4;

-- 3. Create the employees table
-- This table will store employee information for filtering and sorting.
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50)
);

-- 4. Insert employee records
-- These records will be used to practice different filtering conditions.
INSERT INTO employees
(employee_id, employee_name, department, salary, city)
VALUES
(101, 'Rahul Sharma', 'IT', 65000, 'Delhi'),
(102, 'Amit Kumar', 'HR', 45000, 'Noida'),
(103, 'Priya Singh', 'Finance', 55000, 'Delhi'),
(104, 'Neha Verma', 'IT', 72000, 'Gurgaon'),
(105, 'Ravi Kumar', 'Sales', 40000, 'Agra'),
(106, 'Pooja Sharma', 'Finance', 60000, 'Noida'),
(107, 'Suresh Yadav', 'IT', 58000, 'Delhi'),
(108, 'Anjali Gupta', 'HR', 48000, 'Agra');

-- 5. Sort employees by salary
-- ORDER BY ASC displays the lowest salary first.
SELECT *
FROM employees
ORDER BY salary ASC;

-- 6. Sort employees by salary in descending order
-- DESC displays the highest salary first.
SELECT *
FROM employees
ORDER BY salary DESC;

-- 7. Display unique departments
-- DISTINCT removes duplicate department values.
SELECT DISTINCT department
FROM employees;

-- 8. Display the top three highest-paid employees
-- LIMIT restricts the number of records returned.
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- 9. Find employees from IT and Finance
-- IN allows us to filter using multiple values.
SELECT *
FROM employees
WHERE department IN ('IT', 'Finance');

-- 10. Find employees with salary between 50000 and 65000
-- BETWEEN filters values within a specified range.
SELECT *
FROM employees
WHERE salary BETWEEN 50000 AND 65000;

-- 🧪 10 PRACTICE QUESTIONS ANSWERS — DAY 4
-- 1. Display all employees sorted by salary from lowest to highest.
SELECT *
FROM employees
ORDER BY salary ASC;

-- 2. Display all employees sorted by salary from highest to lowest.
SELECT *
FROM employees
ORDER BY salary DESC;

-- 3. Display all unique departments.
SELECT DISTINCT department
FROM employees;

-- 4. Display the top 3 highest-paid employees.
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- 5. Find employees who work in IT or Finance using IN.
SELECT *
FROM employees
WHERE department IN ('IT', 'Finance');

-- 6. Find employees whose salary is between 45000 and 60000.
SELECT *
FROM employees
WHERE salary BETWEEN 45000 AND 60000;

-- 7. Find employees who live in Delhi or Noida.
SELECT *
FROM employees
WHERE city IN ('Delhi', 'Noida');

-- 8. Find IT employees with salary greater than 60000.
SELECT *
FROM employees
WHERE department = 'IT'
AND salary > 60000;

-- 9. Display employee names sorted alphabetically.
SELECT employee_name
FROM employees
ORDER BY employee_name ASC;

-- 10. Display the 2 lowest-paid employees.
SELECT *
FROM employees
ORDER BY salary ASC
LIMIT 2;

-- 🛠️ MINI PROJECT — DAY 4
-- Employee Salary & Department Analysis System

-- Real-world scenario:

-- The HR team wants to analyze employee salaries and departments to identify salary ranges, department distribution, and top/bottom-paid employees.

-- Requirements

-- Build a useful HR report using:

-- DISTINCT → Unique departments
-- ORDER BY → Salary ranking
-- LIMIT → Top/bottom employees
-- IN → Multiple departments/cities
-- BETWEEN → Salary range
-- AND → Combined conditions


-- Business Tasks
-- 1.Find the top 3 highest-paid employees.
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- 2.Find the 2 lowest-paid employees.
SELECT *
FROM employees
ORDER BY salary ASC
LIMIT 2;

-- 3.Find all employees from IT and Finance.
SELECT *
FROM employees
WHERE department IN ('IT', 'Finance');

-- 4.Find employees earning between ₹50,000 and ₹65,000.
SELECT *
FROM employees
WHERE salary BETWEEN 50000 AND 65000;

-- 5.Find employees from Delhi and Noida.
SELECT *
FROM employees
WHERE city IN ('Delhi', 'Noida');

-- 6.Find IT employees earning more than ₹60,000.
SELECT *
FROM employees
WHERE department = 'IT'
AND salary > 60000;

-- 7.Display all unique departments.
SELECT DISTINCT department
FROM employees;

-- 8.Create a final employee salary report sorted from highest to lowest salary.
SELECT employee_id, employee_name, department, salary, city
FROM employees
ORDER BY salary DESC;

-- ✅ Day 4 Project Complete

-- You have now used:

-- DISTINCT → ORDER BY → LIMIT → IN → BETWEEN → AND

-- These are important SQL skills for filtering, sorting, and analyzing data.

