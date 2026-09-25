-- 🚀 DAY 6 — SQL GROUP BY & HAVING
-- 📚 STUDY

-- Day 5 introduced GROUP BY. Today we will learn how to use it with HAVING to filter grouped results.

-- Key Concepts
-- Concept	      Purpose
-- GROUP BY	      Groups rows with the same value
-- HAVING	      Filters groups
-- WHERE	      Filters individual rows
-- COUNT()	      Counts records
-- SUM()	      Calculates total
-- AVG()	      Calculates average
-- MAX()	      Finds highest value
-- MIN()	      Finds lowest value
-- Important      Difference
-- WHERE → filters rows before grouping

-- HAVING → filters groups after grouping

-- Example:
SELECT department, AVG(salary)
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;
-- This finds departments whose average salary is greater than 50,000.

-- 💻 CODE DAY-6
-- 1. Create the database
-- This database will be used to practice GROUP BY and HAVING.
CREATE DATABASE company_day6;

-- 2. Select the database
-- This tells MySQL which database we want to work with.
USE company_day6;

-- 3. Create the employees table
-- This table will store employee information for group analysis.
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50)
);

-- 4. Insert employee records
-- These records will be used for department-level calculations.
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

-- 5. Group employees by department
-- This shows how many employees belong to each department.
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;

-- 6. Calculate total salary by department
-- SUM() calculates the salary total for each department.
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- 7. Calculate average salary by department
-- AVG() calculates the average salary for each department.
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;

-- 8. Find departments with more than two employees
-- HAVING filters the grouped results.
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 2;

-- 9. Find departments with total salary greater than 100000
-- HAVING filters departments based on total salary.
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 100000;

-- 10. Analyze IT and Finance departments
-- WHERE filters departments first, then GROUP BY creates groups, and HAVING filters those groups.
SELECT department, AVG(salary) AS average_salary
FROM employees
WHERE department IN ('IT', 'Finance')
GROUP BY department
HAVING AVG(salary) > 55000;

-- 🧪 10 PRACTICE QUESTIONS ANSWERS — DAY 6
-- 1. Count employees in each department.
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;

-- 2. Calculate total salary for each department.
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- 3. Calculate average salary for each department.
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;

-- 4. Find the highest salary in each department.
SELECT department, MAX(salary) AS highest_salary
FROM employees
GROUP BY department;

-- 5. Find departments having more than 2 employees.
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 2;

-- 6. Find departments where total salary is greater than 100000.
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 100000;

-- 7. Find departments where average salary is greater than 50000.
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;

-- 8. Find the number of employees in each city.
SELECT city, COUNT(*) AS total_employees
FROM employees
GROUP BY city;

-- 9. Find cities having more than 1 employee.
SELECT city, COUNT(*) AS total_employees
FROM employees
GROUP BY city
HAVING COUNT(*) > 1;

-- 10. Find IT and Finance departments where the average salary is greater than 55000.
SELECT department, AVG(salary) AS average_salary
FROM employees
WHERE department IN ('IT', 'Finance')
GROUP BY department
HAVING AVG(salary) > 55000;

-- 🛠️ MINI PROJECT — DAY 6
-- Department Performance & Payroll Analysis System — Solution

-- 1. Count employees by department
-- This shows the team size of each department.
SELECT
    department,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department;

-- 2. Calculate department payroll
-- This shows the total salary expense for each department.
SELECT
    department,
    SUM(salary) AS total_payroll
FROM employees
GROUP BY department;

-- 3. Calculate average department salary
-- This shows the average salary paid in each department.
SELECT
    department,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department;

-- 4. Find the highest salary by department
-- This identifies the highest-paid employee's salary in each department.
SELECT
    department,
    MAX(salary) AS highest_salary
FROM employees
GROUP BY department;

-- 5. Find departments with more than 2 employees
-- HAVING filters the grouped departments.
SELECT
    department,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 2;

-- 6. Find departments with payroll above 100000
-- HAVING filters departments based on total salary.
SELECT
    department,
    SUM(salary) AS total_payroll
FROM employees
GROUP BY department
HAVING SUM(salary) > 100000;

-- 7. Find departments with average salary above 55000
-- HAVING filters departments based on average salary.
SELECT
    department,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 55000;

-- 8. Create the final department report
-- This combines employee count, total payroll, average salary, and highest salary.
SELECT
    department,
    COUNT(*) AS employee_count,
    SUM(salary) AS total_salary,
    AVG(salary) AS average_salary,
    MAX(salary) AS highest_salary
FROM employees
GROUP BY department;

-- ✅ Day 6 Project Complete

-- GROUP BY → Aggregate Functions → HAVING → Department-Level Business Report