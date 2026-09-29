-- 🚀 DAY 10 — SQL String Functions

-- Today we will learn SQL String Functions, which are useful for cleaning, transforming, and standardizing text data.

-- 📚 STUDY DAY 10
-- Key Functions
-- | Function      | Purpose                        |
-- | ------------- | ------------------------------ |
-- | `UPPER()`     | Converts text to uppercase     |
-- | `LOWER()`     | Converts text to lowercase     |
-- | `LENGTH()`    | Returns text length            |
-- | `TRIM()`      | Removes extra spaces           |
-- | `CONCAT()`    | Combines text                  |
-- | `SUBSTRING()` | Extracts part of text          |
-- | `REPLACE()`   | Replaces text                  |
-- | `LEFT()`      | Gets characters from the left  |
-- | `RIGHT()`     | Gets characters from the right |

-- Why Data Engineers use them
-- Real-world data often contains:
-- Different name formats
-- Extra spaces
-- Inconsistent capitalization
-- Unwanted characters
-- Text that needs to be combined or extracted

-- 💻 CODE DAY-10

-- 1. Create the database
-- This database will be used to practice SQL string functions.
CREATE DATABASE company_day10;

-- 2. Select the database
-- This tells MySQL which database we want to work with.
USE company_day10;

-- 3. Create the employees table
-- This table will store employee information for text-processing practice.
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    city VARCHAR(50),
    email VARCHAR(100)
);

-- 4. Insert employee records
-- These records contain text values for string-function practice.
INSERT INTO employees
(employee_id, employee_name, department, city, email)
VALUES
(101, 'Rahul Sharma', 'IT', 'Delhi', 'rahul@gmail.com'),
(102, 'Amit Kumar', 'HR', 'Noida', 'amit@gmail.com'),
(103, 'Priya Singh', 'Finance', 'Delhi', 'priya@gmail.com'),
(104, 'Neha Verma', 'IT', 'Gurgaon', 'neha@gmail.com'),
(105, 'Ravi Kumar', 'Sales', 'Agra', 'ravi@gmail.com');

-- 5. Convert employee names to uppercase
-- UPPER() converts all letters to uppercase.
SELECT
    employee_name,
    UPPER(employee_name) AS uppercase_name
FROM employees;

-- 6. Convert employee names to lowercase
-- LOWER() converts all letters to lowercase.
SELECT
    employee_name,
    LOWER(employee_name) AS lowercase_name
FROM employees;

-- 7. Find the length of employee names
-- LENGTH() returns the number of characters in the text.
SELECT
    employee_name,
    LENGTH(employee_name) AS name_length
FROM employees;

-- 8. Create an employee information label
-- CONCAT() combines multiple text values into one value.
SELECT
    employee_name,
    CONCAT(employee_name, ' - ', department) AS employee_info
FROM employees;

-- 9. Extract part of an employee name
-- SUBSTRING() extracts characters from a text value.
SELECT
    employee_name,
    SUBSTRING(employee_name, 1, 5) AS name_part
FROM employees;

-- 10. Replace text in employee names
-- REPLACE() replaces one text value with another.
SELECT
    employee_name,
    REPLACE(employee_name, 'Kumar', 'Singh') AS modified_name
FROM employees;


-- 🧪 10 PRACTICE QUESTIONS ANSWERS — DAY 10
-- 1. Display all employee names in uppercase.
SELECT
    UPPER(employee_name) AS employee_name
FROM employees;

-- 2. Display all department names in lowercase.
SELECT
    LOWER(department) AS department
FROM employees;

-- 3. Find the length of each employee name.
SELECT
    employee_name,
    LENGTH(employee_name) AS name_length
FROM employees;

-- 4. Combine employee name and department into one column.
SELECT
    CONCAT(employee_name, ' - ', department) AS employee_info
FROM employees;

-- 5. Combine employee name and city into one column.
SELECT
    CONCAT(employee_name, ' - ', city) AS employee_location
FROM employees;

-- 6. Extract the first 4 characters of each employee name.
SELECT
    employee_name,
    LEFT(employee_name, 4) AS first_4_characters
FROM employees;

-- 7. Extract the last 3 characters of each employee name.
SELECT
    employee_name,
    RIGHT(employee_name, 3) AS last_3_characters
FROM employees;

-- 8. Replace Kumar with Singh in employee names.
SELECT
    employee_name,
    REPLACE(employee_name, 'Kumar', 'Singh') AS modified_name
FROM employees;

-- 9. Display employee names along with their email addresses in one column.
SELECT
    CONCAT(employee_name, ' - ', email) AS employee_contact
FROM employees;

-- 10. Create a final employee text report showing:
-- Employee name in uppercase
-- Department in lowercase
-- City
-- Employee name length
-- Employee name + department

SELECT
    UPPER(employee_name) AS employee_name,
    LOWER(department) AS department,
    city,
    LENGTH(employee_name) AS name_length,
    CONCAT(employee_name, ' - ', department) AS employee_info
FROM employees;

-- 🛠️ MINI PROJECT — DAY 10
-- Employee Data Standardization System — Solution

-- 1. Display employee names in uppercase
-- Convert employee names to uppercase for standardized reporting.
SELECT employee_id,
       employee_name,
       LOWER(department) AS department
FROM employees;

-- 2. Standardize department names to lowercase
-- Convert department names to lowercase for consistent formatting.
SELECT employee_id,
       employee_name,
       LOWER(department) AS department
FROM employees;

-- 3. Calculate employee-name length
-- Calculate the number of characters in each employee name.
SELECT employee_id,
       employee_name,
       LENGTH(employee_name) AS name_length
FROM employees;

-- 4. Create an employee information label using CONCAT()
-- Combine employee name and department into one readable information label.
SELECT employee_id,
       CONCAT(employee_name, ' - ', department) AS employee_info
FROM employees;

-- 5. Extract part of employee names
-- Extract the first 4 characters from each employee name.
SELECT employee_id,
       employee_name,
       LEFT(employee_name, 4) AS name_part
FROM employees;

-- 6. Replace specific text
-- Replace the word Kumar with Singh in employee names where it appears.
SELECT employee_id,
       employee_name,
       REPLACE(employee_name, 'Kumar', 'Singh') AS updated_name
FROM employees;

-- 7. Final standardized employee report
-- Create a clean employee report using multiple string functions.
SELECT employee_id,
       UPPER(employee_name) AS employee_name,
       LOWER(department) AS department,
       city,
       LENGTH(employee_name) AS name_length,
       LEFT(employee_name, 4) AS name_part,
       CONCAT(employee_name, ' - ', department) AS employee_info,
       REPLACE(employee_name, 'Kumar', 'Singh') AS standardized_name
FROM employees;

-- ✅ Day 10 Mini Project Complete

-- Data flow:

-- Raw Text Data → String Functions → Standardization → Clean Employee Report

-- Functions used: UPPER() • LOWER() • LENGTH() • CONCAT() • LEFT() • REPLACE()


-- 🎯 INTERVIEW QUESTIONS + ANSWERS

-- 1. What are SQL string functions?
-- Answer: String functions are functions used to manipulate and transform text data.

-- 2. What does UPPER() do?
-- Answer: It converts text to uppercase.

-- 3. What does LOWER() do?
-- Answer: It converts text to lowercase.

-- 4. What does CONCAT() do?
-- Answer: It combines two or more text values into one string.

-- 5. What does LENGTH() do?
-- Answer: It returns the length of a string in bytes in MySQL.

-- 6. What is SUBSTRING() used for?
-- Answer: It extracts a specific portion of a string.

-- 7. What is REPLACE() used for?
-- Answer: It replaces a specified portion of text with another value.

-- 8. Why are string functions important for Data Engineers?
-- Answer: They help clean, standardize, transform, and prepare text data before it is used in downstream systems and analytics.