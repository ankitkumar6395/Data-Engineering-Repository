-- 🚀 DAY 11 — SQL DISTINCT & ALIASES

-- 90-Day Data Engineering Journey
-- Progress: 10 / 90 Chapters Completed

-- 📚 STUDY DAY 11
-- 1. DISTINCT

-- DISTINCT is used to return unique values from a column.

-- Example
SELECT DISTINCT department
FROM employees;

-- If the table contains:

-- department
-- IT
-- HR
-- IT
-- Finance
-- HR

-- Result:

-- department
-- IT
-- HR
-- Finance
-- 2. DISTINCT with Multiple Columns

-- DISTINCT checks the combination of selected columns.
SELECT DISTINCT department, city
FROM employees;

-- 3. Column Alias
-- An alias gives a temporary, readable name to a column in the result.
SELECT column_name AS alias_name
FROM table_name;

-- Example:
SELECT employee_name AS Employee
FROM employees;

-- 4. Alias with Calculations
SELECT salary,
       salary * 12 AS annual_salary
FROM employees;

-- 5. Alias with Functions
SELECT UPPER(employee_name) AS Employee_Name
FROM employees;
-- 🎯 Key Concept

-- DISTINCT → Remove duplicate results
-- AS → Give meaningful names to output columns

-- 💻 CODE — MySQL Workbench DAY 11

-- Create a database for Day 11 DISTINCT and Alias practice.
CREATE DATABASE company_day11;

-- Select the Day 11 database.
USE company_day11;

-- Create an employee table for practicing unique values and aliases.
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    city VARCHAR(50),
    salary DECIMAL(10,2)
);

-- Insert employee data containing repeated departments and cities.
INSERT INTO employees
VALUES
(101, 'Rahul Sharma', 'IT', 'Delhi', 65000),
(102, 'Amit Kumar', 'HR', 'Noida', 45000),
(103, 'Priya Singh', 'Finance', 'Delhi', 55000),
(104, 'Neha Verma', 'IT', 'Gurgaon', 72000),
(105, 'Ravi Kumar', 'Sales', 'Agra', 40000),
(106, 'Pooja Sharma', 'Finance', 'Delhi', 60000);

-- Display unique department names.
SELECT DISTINCT department
FROM employees;
-- Display unique cities.
SELECT DISTINCT city
FROM employees;

-- Display employee names with a readable column alias.
SELECT employee_name AS Employee
FROM employees;

-- Calculate annual salary and give the result a meaningful alias.
SELECT employee_name,
       salary * 12 AS Annual_Salary
FROM employees;

-- 🧪 10 PRACTICE QUESTIONS — ANSWERS DAY 11

-- 1. Display all unique departments.
SELECT DISTINCT department
FROM employees;

-- 2. Display all unique cities.
SELECT DISTINCT city
FROM employees;

-- 3. Display unique combinations of department and city.
SELECT DISTINCT department, city
FROM employees;

-- 4. Display employee names using the alias Employee_Name.
SELECT employee_name AS Employee_Name
FROM employees;

-- 5. Display salary using the alias Monthly_Salary.
SELECT salary AS Monthly_Salary
FROM employees;

-- 6. Calculate annual salary using salary * 12 and alias it as Annual_Salary.
SELECT salary * 12 AS Annual_Salary
FROM employees;

-- 7. Display department using the alias Department_Name.
SELECT department AS Department_Name
FROM employees;

-- 8. Display employee name and salary with meaningful aliases.
SELECT employee_name AS Employee_Name,
       salary AS Monthly_Salary
FROM employees;

-- 9. Display unique departments in alphabetical order.
SELECT DISTINCT department
FROM employees
ORDER BY department ASC;

-- 10. Create a report containing Employee Name, Department, Monthly Salary, and Annual Salary.
SELECT employee_name AS Employee_Name,
       department AS Department,
       salary AS Monthly_Salary,
       salary * 12 AS Annual_Salary
FROM employees;

-- ✅ Practice Complete

-- Day 11 concepts practiced:
-- DISTINCT → unique data
-- AS → meaningful column names
-- ORDER BY → sorted results
-- salary * 12 → calculated business value

-- 🛠️ MINI PROJECT — DAY 11
-- Employee Reporting & Duplicate Analysis System — Solution

-- Display only unique department names for HR analysis.
SELECT DISTINCT department
FROM employees;

-- 2. Display unique cities
-- Display only unique employee locations.
SELECT DISTINCT city
FROM employees;

-- 3. Display unique department-city combinations
-- Identify unique combinations of departments and employee locations.
SELECT DISTINCT department,
       city

-- 4. Create readable aliases for employee information
-- Create meaningful column names for a clean HR report.
SELECT employee_name AS Employee_Name,
       department AS Department,
       city AS City
FROM employees;

-- 5. Calculate annual salary
-- Calculate annual salary from the employee's monthly salary.
SELECT employee_name AS Employee_Name,
       salary AS Monthly_Salary,
       salary * 12 AS Annual_Salary
FROM employees;

-- 6. Create a clean HR salary report
-- Create a readable HR salary report with employee, department, and salary information.
SELECT employee_name AS Employee_Name,
       department AS Department,
       salary AS Monthly_Salary,
       salary * 12 AS Annual_Salary
FROM employees;

-- 7. Sort the final report by annual salary
-- Sort employees from the highest annual salary to the lowest.
SELECT employee_name AS Employee_Name,
       department AS Department,
       salary AS Monthly_Salary,
       salary * 12 AS Annual_Salary
FROM employees
ORDER BY Annual_Salary DESC;

-- 8. Final employee reporting system
-- Generate the final HR report with employee name, department, city, monthly salary, and annual salary.
SELECT employee_name AS Employee_Name,
       department AS Department,
       city AS City,
       salary AS Monthly_Salary,
       salary * 12 AS Annual_Salary
FROM employees
ORDER BY Annual_Salary DESC;

-- ✅ Day 11 Mini Project Complete

-- Business flow:

-- Duplicate Data → DISTINCT → Meaningful Aliases → Salary Calculation → Sorted HR Report
-- Day 11 Skills: DISTINCT • AS • Calculated Columns • ORDER BY • Business Reporting

-- 🎯 INTERVIEW QUESTIONS + ANSWERS

-- 1. What is DISTINCT?
-- Answer: DISTINCT removes duplicate rows from the query result.

-- 2. What is an alias?
-- Answer: An alias is a temporary name given to a column or table.

-- 3. Which keyword is commonly used for aliases?
-- Answer: AS.

-- 4. Does DISTINCT modify the original table?
-- Answer: No. It only changes the query result.

-- 5. Can DISTINCT be used with multiple columns?
-- Answer: Yes. It returns unique combinations of those columns.

-- 6. Can an alias be used for a calculated column?
-- Answer: Yes.

-- 7. Why are aliases useful?
-- Answer: They make query results easier to understand and use in reports.

-- 8. Does an alias permanently rename a database column?
-- Answer: No. It only changes the displayed column name for that query.

-- 📌 DAY 11 TARGET
-- DISTINCT + Aliases → Clean & Readable SQL Reports

