-- 💻 CODE — MySQL Workbench

-- 1. Create a new database
-- This database will store all data for our company project.
CREATE DATABASE company_db;

-- 2. Select the database
-- This tells MySQL that we want to work inside company_db.
USE company_db;

-- 3. Create the employees table
-- This table will store employee ID, name, department, and salary.
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary INT
);

-- 4. Insert employee records
-- These records contain employee ID, name, department, and salary.

-- |  ID | Name         | Department | Salary |
-- | --: | ------------ | ---------- | -----: |
-- | 101 | Rahul Sharma | IT         |  65000 |
-- | 102 | Amit Kumar   | HR         |  45000 |
-- | 103 | Priya Singh  | Finance    |  50000 |
-- | 104 | Neha Verma   | IT         |  60000 |
-- | 105 | Ravi Kumar   | Sales      |  40000 |

INSERT INTO employees
(employee_id, employee_name, department, salary)
VALUES
(101, 'Rahul Sharma', 'IT', 65000),
(102, 'Amit Kumar', 'HR', 45000),
(103, 'Priya Singh', 'Finance', 50000),
(104, 'Neha Verma', 'IT', 60000),
(105, 'Ravi Kumar', 'Sales', 40000);

-- 5. Display all employees
-- This query displays all columns and all records from the employees table.
SELECT *
FROM employees;


-- 6. Display employee names and salaries
-- This query displays only the employee_name and salary columns.
SELECT employee_name, salary
FROM employees;

-- 7. Find employees from the IT department
-- This query displays only employees whose department is IT.
SELECT *
FROM employees
WHERE department = 'IT';

-- 8. Find employees whose salary is greater than 50000
-- This query displays employees earning more than 50000.
SELECT *
FROM employees
WHERE salary > 50000;


-- 🧪 10 PRACTICE QUESTIONS

-- 1. Display all employees.
SELECT *
FROM employees;


-- 2. Display only employee_name and department.
SELECT employee_name, department
FROM employees;


-- 3. Find employees who work in IT.
SELECT *
FROM employees
WHERE department = 'IT';

-- 4. Find employees whose salary is greater than 50000.
SELECT *
FROM employees
WHERE salary > 50000;

-- 5. Display employee name and salary for employees earning more than 45000.
SELECT employee_name, salary
FROM employees
WHERE salary > 45000;

-- 6. Find employees who work in HR.
SELECT *
FROM employees
WHERE department = 'HR';

-- 7. Find the employee with employee_id = 103.
SELECT *
FROM employees
WHERE employee_id = 103;

-- 8. Find employees whose salary is less than 50000.
SELECT *
FROM employees
WHERE salary < 50000;

-- 9. Find IT employees whose salary is greater than 60000.
SELECT *
FROM employees
WHERE department = 'IT'
AND salary > 60000;

-- 10. Display only names of employees who work in Finance.
SELECT employee_name
FROM employees
WHERE department = 'Finance';

-- Day 1 SQL Patterns
-- SELECT → What data do you want?
-- FROM   → Which table?
-- WHERE  → What condition?
-- AND    → Additional condition?

-- 🛠️ Day 1 Mini Project — Completed
-- Employee Management Database

-- 1. Create the company database
-- This database will store all employee information.
CREATE DATABASE company_db;

-- 2. Select the company database
-- This tells MySQL which database we want to work with.
USE company_db;


-- 3. Create the employees table
-- This table stores employee ID, name, department, and salary.
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary INT
);

-- 4. Insert employee records
-- Add 10 employees to the employees table.
INSERT INTO employees
(employee_id, employee_name, department, salary)
VALUES
(101, 'Rahul Sharma', 'IT', 65000),
(102, 'Amit Kumar', 'HR', 45000),
(103, 'Priya Singh', 'Finance', 50000),
(104, 'Neha Verma', 'IT', 60000),
(105, 'Ravi Kumar', 'Sales', 40000),
(106, 'Sneha Gupta', 'HR', 55000),
(107, 'Arjun Singh', 'IT', 72000),
(108, 'Pooja Sharma', 'Finance', 48000),
(109, 'Rohit Verma', 'Sales', 52000),
(110, 'Anjali Gupta', 'IT', 58000);

-- 5. Find IT employees
-- Display employees who belong to the IT department.
SELECT *
FROM employees
WHERE department = 'IT';

-- 6. Find employees earning more than 60000
-- Display employees whose salary is above 60000.
SELECT *
FROM employees
WHERE salary > 60000;

-- 7. Find employee with ID 105
-- Display the employee whose ID is 105.
SELECT *
FROM employees
WHERE employee_id = 105;

-- 8. Find Finance employees
-- Display employees who belong to the Finance department.
SELECT *
FROM employees
WHERE department = 'Finance';

-- 9. Find employees earning less than 50000
-- Display employees whose salary is below 50000.
SELECT *
FROM employees
WHERE salary < 50000;

-- 10. Find IT employees earning more than 55000
-- Apply two conditions: department must be IT and salary must be above 55000.
SELECT *
FROM employees
WHERE department = 'IT'
AND salary > 55000;

-- 11. Display employee names and salaries
-- Show only the employee name and salary columns.
SELECT employee_name, salary
FROM employees;

-- 12. Display all employees
-- Show all columns and all employee records.
SELECT *
FROM employees;

-- 13. Find HR employees
-- Display employees who belong to the HR department.
SELECT *
FROM employees
WHERE department = 'HR';

-- 14. Find employees earning exactly 50000
-- Display employees whose salary is exactly 50000.
SELECT *
FROM employees
WHERE salary = 50000;

-- ✅ Project Complete

-- Your Day 1 project now covers:

-- Database → Table → Primary Key → Insert Data → SELECT → WHERE → AND → Business Queries

-- Final project flow
-- Company Database
   --  ↓
-- Employees Table
	-- ↓
-- 10 Employee Records
    -- ↓
-- Business Questions
	-- ↓
-- SQL Queries
	-- ↓
-- Results