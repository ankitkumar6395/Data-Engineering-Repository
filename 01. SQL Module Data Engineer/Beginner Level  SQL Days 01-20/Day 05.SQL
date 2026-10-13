-- 🚀 DAY 5 — SQL Aggregate Functions
-- 📚 STUDY

-- Today you will learn how to summarize and analyze data using aggregate functions.

-- Main Functions
-- Function	     Purpose
-- COUNT()  	 Count records
-- SUM()	     Calculate total
-- AVG()	     Calculate average
-- MAX()	     Find highest value
-- MIN()	     Find lowest value

-- These functions are very important in Data Engineering and data analysis because they turn many rows into useful summary results.

-- 💻 CODE DAY-5
-- 1. Create the database
-- This database will be used to practice aggregate functions.
CREATE DATABASE company_day5;

-- 2. Select the database
-- This tells MySQL which database we want to work with.
USE company_day5;

-- 3. Create the employees table
-- This table will store employee information for calculations.
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50)
);

-- 4. Insert employee records
-- These records will be used for aggregate calculations.
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

-- 5. Count employees
-- COUNT() tells us how many employee records exist.
SELECT COUNT(*) AS total_employees
FROM employees;

-- 6. Calculate total salary
-- SUM() adds all employee salaries together.
SELECT SUM(salary) AS total_salary
FROM employees;

-- 7. Calculate average salary
-- AVG() calculates the average salary of all employees.
SELECT AVG(salary) AS average_salary
FROM employees;

-- 8. Find the highest salary
-- MAX() returns the largest salary value.
SELECT MAX(salary) AS highest_salary
FROM employees;

-- 9. Find the lowest salary
-- MIN() returns the smallest salary value.
SELECT MIN(salary) AS lowest_salary
FROM employees;

-- 10. Generate a salary summary
-- Multiple aggregate functions can be used in one query.
SELECT
    COUNT(*) AS total_employees,
    SUM(salary) AS total_salary,
    AVG(salary) AS average_salary,
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM employees;

-- 🧪 10 PRACTICE QUESTIONS ANSWERS — DAY 5
-- 1. Count the total number of employees.
SELECT COUNT(*) AS total_employees
FROM employees;

-- 2. Calculate the total salary of all employees.
SELECT SUM(salary) AS total_salary
FROM employees;

-- 3. Calculate the average employee salary.
SELECT AVG(salary) AS average_salary
FROM employees;

-- 4. Find the highest salary.
SELECT MAX(salary) AS highest_salary
FROM employees;

-- 5. Find the lowest salary.
SELECT MIN(salary) AS lowest_salary
FROM employees;

-- 6. Count the number of employees working in IT.
SELECT COUNT(*) AS it_employees
FROM employees
WHERE department = 'IT';

-- 7. Calculate the total salary of IT employees.
SELECT SUM(salary) AS it_total_salary
FROM employees
WHERE department = 'IT';

-- 8. Calculate the average salary of Finance employees.
SELECT AVG(salary) AS finance_average_salary
FROM employees
WHERE department = 'Finance';

-- 9. Find the highest salary among HR employees.
SELECT MAX(salary) AS hr_highest_salary
FROM employees
WHERE department = 'HR';

-- 10. Create one salary summary showing:
-- Total employees
-- Total salary
-- Average salary
-- Highest salary
-- Lowest salary
SELECT
    COUNT(*) AS total_employees,
    SUM(salary) AS total_salary,
    AVG(salary) AS average_salary,
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM employees;

-- 🛠️ MINI PROJECT — DAY 5
-- Employee Payroll Summary System

-- Real-world scenario:

-- The HR department wants a payroll summary to understand the company's overall salary cost and department-level salary information.

-- Business Tasks
-- 1.Find total number of employees.
SELECT COUNT(*) AS total_employees
FROM employees;

-- 2.Calculate total company salary expense.
SELECT SUM(salary) AS total_salary_expense
FROM employees;

-- 3.Calculate average company salary.
SELECT AVG(salary) AS average_salary
FROM employees;

-- 4.Find the highest and lowest salary.
SELECT
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM employees;

-- 5.Find total employees in each department.
SELECT
    department,
    COUNT(*) AS total_employees
FROM employees
GROUP BY department;

-- 6.Calculate total salary for each department.
SELECT
    department,
    SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- 7.Calculate average salary for each department.
SELECT
    department,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department;

-- 8.Identify the highest salary in each department.
SELECT
    department,
    MAX(salary) AS highest_salary
FROM employees
GROUP BY department;

-- Today's project introduces an important new concept:
-- Aggregate Functions → Business Summary → Department-Level Analysis.

-- 🎯 New Concept

-- The important new concept introduced here is:

-- GROUP BY → Group records by department → Apply aggregate functions

-- For example:
SELECT
    department,
    MAX(salary) AS highest_salary
FROM employees
GROUP BY department;

-- This gives the average salary separately for each department, rather than one average for the entire company.

-- ✅ Day 5 Project Complete
