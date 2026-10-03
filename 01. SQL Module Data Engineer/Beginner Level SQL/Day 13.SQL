-- 🚀 DAY 13 — SQL LIKE, WILDCARDS & PATTERN MATCHING
-- 90-Day Data Engineering Roadmap
-- Beginner Level · SQL / MySQL                        12 / 90 Chapters Completed

-- Today's Goal: Learn how to search for specific text patterns in a database using LIKE, %, _, and NOT LIKE.
-- 📚 STUDY DAY 13
-- 1. LIKE Operator
-- The LIKE operator is used to search for a specific pattern in a text column.
SELECT column_name
FROM table_name
WHERE column_name LIKE pattern;

-- Example: Find employees whose names start with A.
SELECT *
FROM employees
WHERE employee_name LIKE 'A%';

-- 2. Percentage Wildcard %
-- The % wildcard represents zero, one, or multiple characters.
-- Pattern	      Meaning	                            Example
-- 'A%'	          Starts with A	                         Amit
-- '%a'	          Ends with a	                         Neha
-- '%it%'	      Contains it	                         Smith
-- 'Rah%a'	      Starts with Rah and ends with a	     —

-- Example: Find names ending with a.
SELECT *
FROM employees
WHERE employee_name LIKE '%a';

-- 3. Underscore Wildcard _
-- The _ wildcard represents exactly one character.
-- Example: Find names that start with A and have exactly 4 characters.
SELECT *
FROM employees
WHERE employee_name LIKE 'A___';

-- This pattern matches exactly four characters in total, including the starting A.
-- 4. Combining Wildcards
-- You can combine % and _ to search for more specific patterns.
-- Example: Find names that start with R and have at least 3 characters.
SELECT *
FROM employees
WHERE employee_name LIKE 'R_%';

-- 5. NOT LIKE
-- NOT LIKE returns records that do not match the specified pattern.
-- Example: Find employees whose names do not start with A.
SELECT *
FROM employees
WHERE employee_name NOT LIKE 'A%';

-- 6. LIKE with AND and OR
-- You can combine pattern matching with other conditions.
-- Example: Find IT employees whose names start with R.
SELECT *
FROM employees
WHERE department = 'IT'
AND employee_name LIKE 'R%';

-- 7. Real-World Use Cases
-- Find employees by name prefix.
-- Search for email addresses by domain.
-- Identify department names matching a pattern.
-- Search customer records by partial names.
-- Filter product names based on text.

-- 🎯 Key Concept
-- LIKE — search for a text pattern
-- % — zero or more characters
-- _ — exactly one character
-- NOT LIKE — exclude matching patterns

-- 💻 CODE — MySQL Workbench DAY 13
-- 1. Create database
-- Create a database for Day 13 pattern matching practice.
CREATE DATABASE company_day13;

-- Select the Day 13 database.
USE company_day13;

-- 2. Create employees table
-- Create an employee table for LIKE and wildcard exercises.
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    city VARCHAR(50),
    email VARCHAR(100),
    salary DECIMAL(10,2)
);

-- 3. Insert sample data
-- Insert employee records with different names, departments, cities, and email patterns.
INSERT INTO employees
VALUES
(101, 'Rahul Sharma', 'IT', 'Delhi', 'rahul@gmail.com', 65000),
(102, 'Amit Kumar', 'HR', 'Noida', 'amit@yahoo.com', 45000),
(103, 'Priya Singh', 'Finance', 'Delhi', 'priya@gmail.com', 55000),
(104, 'Neha Verma', 'IT', 'Gurgaon', 'neha@gmail.com', 72000),
(105, 'Ravi Kumar', 'Sales', 'Agra', 'ravi@yahoo.com', 40000),
(106, 'Pooja Sharma', 'Finance', 'Delhi', 'pooja@gmail.com', 60000),
(107, 'Suresh Patel', 'IT', 'Noida', 'suresh@gmail.com', 58000),
(108, 'Anjali Gupta', 'HR', 'Agra', 'anjali@yahoo.com', 48000),
(109, 'Vikas Singh', 'Sales', 'Delhi', 'vikas@gmail.com', 52000),
(110, 'Kiran Verma', 'IT', 'Gurgaon', 'kiran@yahoo.com', 75000);

-- 4. Search names starting with A
-- Find employees whose names start with A.
SELECT *
FROM employees
WHERE employee_name LIKE 'A%';

-- 5. Search names ending with a
-- Find employees whose names end with the letter a.
SELECT *
FROM employees
WHERE employee_name LIKE '%a';

-- 6. Search names containing Kumar
-- Find employees whose names contain Kumar.
SELECT *
FROM employees
WHERE employee_name LIKE '%Kumar%';

-- 7. Search email addresses from Gmail
-- Find employees whose email addresses end with gmail.com.
SELECT *
FROM employees
WHERE email LIKE '%@gmail.com';

-- 8. Search departments not matching IT
-- Find employees who do not belong to departments beginning with IT.
SELECT *
FROM employees
WHERE department NOT LIKE 'IT%';

-- 🧪 DAY 13 — 10 PRACTICE QUESTIONS (ANSWERS)
-- 1. Display employees whose names start with R.
SELECT *
FROM employees
WHERE employee_name LIKE 'R%';

-- 2. Display employees whose names end with a.
SELECT *
FROM employees
WHERE employee_name LIKE '%a';

-- 3. Find employees whose names contain Kumar.
SELECT *
FROM employees
WHERE employee_name LIKE '%Kumar%';

-- 4. Display employees whose email addresses end with gmail.com.
SELECT *
FROM employees
WHERE email LIKE '%@gmail.com';

-- 5. Find employees whose names start with A and have exactly 4 characters.
SELECT *
FROM employees
WHERE employee_name LIKE 'A___';

-- 6. Display employees whose names contain Sharma.
SELECT *
FROM employees
WHERE employee_name LIKE '%Sharma%';

-- 7. Find employees whose names do not start with P.
SELECT *
FROM employees
WHERE employee_name NOT LIKE 'P%';

-- 8. Display IT employees whose names start with S.
SELECT *
FROM employees
WHERE department = 'IT'
AND employee_name LIKE 'S%';

-- 9. Find employees whose email addresses contain yahoo.
SELECT *
FROM employees
WHERE email LIKE '%yahoo%';

-- 10. Create a report showing employee name, department, and email for employees whose names contain Verma.
SELECT employee_name AS Employee_Name,
       department AS Department,
       email AS Email
FROM employees
WHERE employee_name LIKE '%Verma%';

-- 🛠️ MINI PROJECT — DAY 13
-- Employee Search & Pattern Matching System — Solution
-- 1. Find employees by the first letter of their names
-- Search for employees whose names begin with R.
SELECT employee_id,
       employee_name,
       department
FROM employees
WHERE employee_name LIKE 'R%';

-- 2. Search employee names using partial text
-- Find employees whose names contain Sharma.
SELECT employee_id,
       employee_name,
       department
FROM employees
WHERE employee_name LIKE '%Sharma%';

-- 3. Identify employees by their email provider
-- Find employees using Gmail email addresses.
SELECT employee_id,
       employee_name,
       email
FROM employees
WHERE email LIKE '%@gmail.com';

-- 4. Find employees whose names end with a specific letter
-- Find employees whose names end with the letter a.
SELECT employee_id,
       employee_name
FROM employees
WHERE employee_name LIKE '%a';

-- 5. Exclude employees whose names match a particular pattern
-- Exclude employees whose names start with P.
SELECT employee_id,
       employee_name,
       department
FROM employees
WHERE employee_name NOT LIKE 'P%';

-- 6. Search for employees in IT whose names start with a selected letter
-- Find IT employees whose names start with S.
SELECT employee_id,
       employee_name,
       department,
       salary
FROM employees
WHERE department = 'IT'
AND employee_name LIKE 'S%';

-- 7. Create a report for employees whose names contain Sharma
-- Generate an employee report for names containing Sharma.
SELECT employee_id,
       employee_name AS Employee_Name,
       department AS Department,
       city AS City,
       email AS Email
FROM employees
WHERE employee_name LIKE '%Sharma%';

-- 8. Generate a final employee search report
-- Create a searchable HR report using LIKE, NOT LIKE, and readable aliases.
SELECT employee_id,
       employee_name AS Employee_Name,
       department AS Department,
       city AS City,
       email AS Email,
       salary AS Monthly_Salary
FROM employees
WHERE employee_name LIKE '%a%'
AND department NOT LIKE 'HR%'
ORDER BY employee_name ASC;

-- ✅ Day 13 Practice & Mini Project
-- Concepts covered: LIKE · % · _ · NOT LIKE · AND · ORDER BY · Column Aliases
-- Business flow:
-- Employee Data → LIKE → Wildcards → Pattern Matching → HR Search Report

-- 🎯 INTERVIEW QUESTIONS + ANSWERS DAY 13
-- 1. What is the LIKE operator in SQL?
-- LIKE searches for a specific text pattern in a column.

-- 2. What does % mean in SQL?
-- It represents zero, one, or multiple characters.

-- 3. What does _ mean in SQL?
-- It represents exactly one character.

-- 4. What is the difference between LIKE and NOT LIKE?
-- LIKE finds matching patterns, while NOT LIKE excludes matching patterns.

-- 5. How do you find names starting with A?
SELECT *
FROM employees
WHERE employee_name LIKE 'A%';

-- 6. How do you find names ending with a?
SELECT *
FROM employees
WHERE employee_name LIKE '%a';

-- 7. How do you find email addresses containing Gmail?
SELECT *
FROM employees
WHERE email LIKE '%gmail%';

-- 8. Can LIKE be combined with AND?
-- Yes. It can be combined with AND, OR, and other SQL conditions.

-- 📈 DAY 13 PROGRESS TARGET
-- SQL Learning Progress
-- 12 / 90
-- Complete today's practice and mini project to reach 13 / 90 chapters.
