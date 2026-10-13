-- 🚀 DAY 12 — SQL LIMIT, OFFSET & Pagination
-- 90-Day Data Engineering Roadmap

-- Progress: 11 / 90 Chapters
-- Today's Goal: Learn how to retrieve a specific number of records, skip rows, and display large datasets page by page using MySQL.

-- 📚 STUDY DAY 12
-- 1. LIMIT
-- LIMIT is used to restrict the number of rows returned by a query.
SELECT column_name
FROM table_name
LIMIT number;

-- Example: Display only the first 3 employees.
SELECT *
FROM employees
LIMIT 3;

-- 2. LIMIT with ORDER BY
-- ORDER BY sorts the records, while LIMIT restricts how many rows are returned.
-- Example: Display the 3 highest-paid employees.
SELECT employee_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- 3. OFFSET
-- OFFSET skips a specified number of rows before returning results. It is commonly used with LIMIT.
SELECT column_name
FROM table_name
LIMIT number OFFSET number;

-- Example: Skip the first 3 employees and display the next 3.
SELECT *
FROM employees
LIMIT 3 OFFSET 3;

-- 4. Pagination
-- Pagination divides a large dataset into smaller pages. It is useful in employee dashboards, websites, and reporting systems.

			   -- Example: 10 employee records, 3 records per page
--  Page 1                      Page 2                          Page 3        
-- Employee 1                  Employee 4                      Employee 7
-- Employee 2                  Employee 5                      Employee 8
-- Employee 3                  Employee 5                      Employee 9
-- Pagination formula:
-- \[
-- \text{OFFSET} = (\text{Page Number} - 1) \times \text{Page Size}
-- \]
-- For example, page 2 with 3 records per page:
-- \[
-- (2 - 1) \times 3 = 3
-- \]

SELECT *
FROM employees
ORDER BY employee_id
LIMIT 3 OFFSET 3;

-- 5. LIMIT vs OFFSET
-- LIMIT	OFFSET
-- Controls the number of rows returned	Controls how many rows are skipped
-- LIMIT 5 returns up to 5 rows	OFFSET 5 skips 5 rows
-- Useful for top-N results	Useful for pagination
-- Key concept: Use ORDER BY with pagination to keep the row order consistent. For large datasets, cursor-based pagination can be more efficient than large offsets.

-- 💻 CODE — MySQL Workbench DAY 12

-- 1. Create database
-- Create a database for Day 12 LIMIT and OFFSET practice.
CREATE DATABASE company_day12;

-- Select the Day 12 database.
USE company_day12;

-- 2. Create employees table
-- Create an employee table for practicing row limits and pagination.
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    city VARCHAR(50),
    salary DECIMAL(10,2)
);


-- 3. Insert sample data
-- Insert 10 employee records to test pagination.
INSERT INTO employees
VALUES
(101, 'Rahul Sharma', 'IT', 'Delhi', 65000),
(102, 'Amit Kumar', 'HR', 'Noida', 45000),
(103, 'Priya Singh', 'Finance', 'Delhi', 55000),
(104, 'Neha Verma', 'IT', 'Gurgaon', 72000),
(105, 'Ravi Kumar', 'Sales', 'Agra', 40000),
(106, 'Pooja Sharma', 'Finance', 'Delhi', 60000),
(107, 'Suresh Patel', 'IT', 'Noida', 58000),
(108, 'Anjali Gupta', 'HR', 'Agra', 48000),
(109, 'Vikas Singh', 'Sales', 'Delhi', 52000),
(110, 'Kiran Verma', 'IT', 'Gurgaon', 75000);

-- 4. Display first 5 employees
-- Retrieve only the first 5 employee records.
SELECT *
FROM employees
LIMIT 5;

-- 5. Display top 3 highest-paid employees
-- Sort salaries from highest to lowest and return the top 3.
SELECT employee_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- 6. Skip the first 5 employees
-- Skip the first 5 records and return the next 3.
SELECT *
FROM employees
ORDER BY employee_id
LIMIT 3 OFFSET 5;

-- 7. Display page 2
-- Display page 2 using 3 records per page.
SELECT *
FROM employees
ORDER BY employee_id
LIMIT 3 OFFSET 3;

-- 🧪 DAY 12 — 10 PRACTICE QUESTIONS (ANSWERS)
-- 1. Display only the first 4 employees.
SELECT *
FROM employees
ORDER BY employee_id
LIMIT 4;

-- 2. Display the 5 highest-paid employees.
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 5;

-- 3. Display the 3 lowest-paid employees.
SELECT *
FROM employees
ORDER BY salary ASC
LIMIT 3;

-- 4. Skip the first 3 employees and display the next 4.
SELECT *
FROM employees
ORDER BY employee_id
LIMIT 4 OFFSET 3;

-- 5. Display page 1 with 2 employees per page.
SELECT *
FROM employees
ORDER BY employee_id
LIMIT 2 OFFSET 0;

-- 6. Display page 2 with 2 employees per page.
SELECT *
FROM employees
ORDER BY employee_id
LIMIT 2 OFFSET 2;

-- 7. Display page 3 with 2 employees per page.
SELECT *
FROM employees
ORDER BY employee_id
LIMIT 2 OFFSET 4;

-- 8. Display the 4 highest-paid IT employees.
SELECT *
FROM employees
WHERE department = 'IT'
ORDER BY salary DESC
LIMIT 4;

-- 9. Display the next 3 employees after skipping the first 5, sorted by employee ID.
SELECT *
FROM employees
ORDER BY employee_id
LIMIT 3 OFFSET 5;

-- 10. Create a report showing the 5 highest-paid employees, with employee name, department, and salary.
SELECT employee_name,
       department,
       salary
FROM employees
ORDER BY salary DESC
LIMIT 5;



-- 🛠️ MINI PROJECT — DAY 12
-- Employee Dashboard Pagination System — Solution


-- 1. Display the first 10 employee records.
-- Retrieve the first 10 employees in employee ID order.
SELECT *
FROM employees
ORDER BY employee_id
LIMIT 10;

-- 2. Display the 5 highest-paid employees.
-- Identify the top 5 employees by salary.
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 5;

-- 3. Display the 5 lowest-paid employees.
-- Identify the 5 employees with the lowest salaries.
SELECT *
FROM employees
ORDER BY salary ASC
LIMIT 5;

-- 4. Display employees page by page, with 5 records per page.
-- Retrieve the first page containing 5 employees.
SELECT *
FROM employees
ORDER BY employee_id
LIMIT 5 OFFSET 0;

-- 5. Retrieve page 2 and page 3 using LIMIT and OFFSET.
-- Page 2
SELECT *
FROM employees
ORDER BY employee_id
LIMIT 5 OFFSET 5;

-- Page 3
SELECT *
FROM employees
ORDER BY employee_id
LIMIT 5 OFFSET 10;

-- 6. Display the top 5 highest-paid employees in the IT department.
-- Filter IT employees and sort them by salary from highest to lowest.
SELECT *
FROM employees
WHERE department = 'IT'
ORDER BY salary DESC
LIMIT 5;

-- 7. Create a paginated HR report sorted by employee ID.
-- Display a clean HR report with 5 employees per page.
SELECT employee_id,
       employee_name,
       department,
       city,
       salary
FROM employees
ORDER BY employee_id
LIMIT 5 OFFSET 0;

-- 8. Generate a salary report with the 10 highest-paid employees.
-- Generate a salary report showing the top 10 employees by salary.
SELECT employee_id,
       employee_name,
       department,
       salary
FROM employees
ORDER BY salary DESC
LIMIT 10;

-- ✅ Day 12 Practice & Mini Project
-- Concepts covered: LIMIT · OFFSET · ORDER BY · Pagination · Top-N Reports
-- Business flow:
-- Large Dataset → Sorting → LIMIT → OFFSET → Paginated HR Dashboard
-- Progress: 11 / 90 chapters completed. Once you have tested and completed these queries in MySQL Workbench, Day 12 will be marked complete and the LinkedIn progress update can be prepared.


-- 🎯 INTERVIEW QUESTIONS + ANSWERS DAY 12
-- 1. What is LIMIT in SQL?
-- LIMIT restricts the number of rows returned by a query.

-- 2. What is OFFSET?
-- OFFSET skips a specified number of rows before returning records.

-- 3. How do you display the top 5 highest-paid employees?
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 5;

-- 4. What is pagination?
-- Pagination divides a large dataset into smaller sets of records, displayed one page at a time.

-- 5. How do you retrieve page 2 with 10 records per page?
SELECT *
FROM employees
ORDER BY employee_id
LIMIT 10 OFFSET 10;

-- 6. Can LIMIT be used without ORDER BY?
-- Yes, but the returned records may not be in a predictable order.

-- 7. What is the pagination formula?
-- OFFSET = (Page Number - 1) × Page Size

-- 8. Why is pagination useful in data systems?
-- It helps retrieve and display manageable portions of large datasets instead of loading all rows at once.

-- 📈 DAY 12 PROGRESS TARGET
-- SQL Learning Progress
-- 11 / 90
-- Complete today's practice and mini project to reach 12 / 90 chapters.
-- LinkedIn update and progress infographic prompt will follow once Day 12 is completed.
