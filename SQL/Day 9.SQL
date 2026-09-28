-- 🚀 DAY 9 — SQL CASE, NULL & COALESCE

-- Today we learn how to handle conditional logic and missing data in SQL.

-- 📚 STUDY  DAY 9
-- 1. CASE

-- CASE works like IF/ELSE in SQL.
-- Example:
SELECT employee_name, salary,
CASE
    WHEN salary >= 60000 THEN 'High'
    WHEN salary >= 50000 THEN 'Medium'
    ELSE 'Low'
END AS salary_category
FROM employees;

-- 2. IS NULL
-- Used to find missing values.
SELECT * 
FROM employees 
WHERE department IS NULL;

-- 3. IS NOT NULL
-- Used to find values that are present.
SELECT * 
FROM employees 
WHERE department IS NOT NULL;

-- 4. COALESCE()
-- Returns the first non-NULL value.
SELECT employee_name, COALESCE(city, 'Unknown') AS city
FROM employees;

-- If city is NULL, it returns Unknown.

-- 💻 CODE DAY 9
-- 1. Create the database
-- This database will be used to practice CASE and NULL handling.
CREATE DATABASE company_day9;

-- 2. Select the database
-- This tells MySQL which database we want to work with.
USE company_day9;

-- 3. Create the employees table
-- Some columns will allow NULL values so we can practice missing-data handling.
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50)
);

-- 4. Insert employee records
-- Some employees have missing department or city information.
INSERT INTO employees
(employee_id, employee_name, department, salary, city)
VALUES
(101, 'Rahul Sharma', 'IT', 65000, 'Delhi'),
(102, 'Amit Kumar', 'HR', 45000, 'Noida'),
(103, 'Priya Singh', 'Finance', 55000, 'Delhi'),
(104, 'Neha Verma', 'IT', 72000, 'Gurgaon'),
(105, 'Ravi Kumar', NULL, 40000, 'Agra'),
(106, 'Pooja Sharma', 'Finance', 60000, NULL),
(107, 'Suresh Yadav', 'IT', 58000, 'Delhi'),
(108, 'Anjali Gupta', 'HR', 48000, NULL);

-- 5. Create salary categories
-- CASE classifies employees based on their salary.
SELECT
    employee_name,
    salary,
    CASE
        WHEN salary >= 60000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees;

-- 6. Create department categories
-- CASE can classify employees based on department.
SELECT
    employee_name,
    department,
    CASE
        WHEN department = 'IT' THEN 'Technical'
        WHEN department = 'Finance' THEN 'Business'
        ELSE 'Other'
    END AS department_type
FROM employees;

-- 7. Find employees with missing departments
-- IS NULL is used to find missing values.
SELECT *
FROM employees
WHERE department IS NULL;

-- 8. Find employees whose city is available
-- IS NOT NULL returns records where city contains a value.
SELECT *
FROM employees
WHERE city IS NOT NULL;

-- 9. Replace missing city values
-- COALESCE displays Unknown when city is NULL.
SELECT
    employee_name,
    COALESCE(city, 'Unknown') AS city
FROM employees;

-- 10. Create an employee salary report
-- The report combines salary classification and missing-city handling.
SELECT
    employee_name,
    department,
    salary,
    COALESCE(city, 'Unknown') AS city,
    CASE
        WHEN salary >= 60000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees
ORDER BY salary DESC;

-- 🧪 10 PRACTICE QUESTIONS ANSWERS — DAY 9
-- 1. Display each employee's name and salary category:
-- 60000 or above → High
-- 50000–59999 → Medium
-- Below 50000 → Low
SELECT
    employee_name,
    salary,
    CASE
        WHEN salary >= 60000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees;

-- 2. Find employees whose department is NULL.
SELECT *
FROM employees
WHERE department IS NULL;

-- 3. Find employees whose city is NULL.
SELECT *
FROM employees
WHERE city IS NULL;

-- 4. Display employee names and replace NULL city with Unknown.
SELECT
    employee_name,
    COALESCE(city, 'Unknown') AS city
FROM employees;

-- 5. Display employee names and classify IT employees as Technical.
SELECT
    employee_name,
    department,
    CASE
        WHEN department = 'IT' THEN 'Technical'
        ELSE 'Other'
    END AS department_type
FROM employees;

-- 6. Create a salary category using CASE.
SELECT
    employee_name,
    salary,
    CASE
        WHEN salary >= 60000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees;

-- 7. Display employees whose department is NOT NULL.
SELECT *
FROM employees
WHERE department IS NOT NULL;

-- 8. Replace NULL department values with Not Assigned.
SELECT
    employee_name,
    COALESCE(department, 'Not Assigned') AS department
FROM employees;

-- 9. Find employees earning 60000 or more and label them Senior Salary.
SELECT
    employee_name,
    salary,
    CASE
        WHEN salary >= 60000 THEN 'Senior Salary'
    END AS salary_level
FROM employees
WHERE salary >= 60000;

-- 10. Create a final report showing:
-- Employee name
-- Department
-- Salary
-- City
-- Salary category
-- Replace NULL values with meaningful text
SELECT
    employee_name,
    COALESCE(department, 'Not Assigned') AS department,
    salary,
    COALESCE(city, 'Unknown') AS city,
    CASE
        WHEN salary >= 60000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees
ORDER BY salary DESC;

-- 🛠️ MINI PROJECT — DAY 9
-- Employee Data Quality & Salary Classification System — Solution

-- 1. Find employees with missing departments
-- IS NULL identifies employees whose department information is missing.
SELECT *
FROM employees
WHERE department IS NULL;

-- 2. Find employees with missing cities
-- IS NULL identifies employees whose city information is missing.
SELECT *
FROM employees
WHERE city IS NULL;

-- 3. Replace missing departments
-- COALESCE displays Not Assigned when department is NULL.
SELECT
    employee_name,
    COALESCE(department, 'Not Assigned') AS department
FROM employees;

-- 4. Replace missing cities
-- COALESCE displays Unknown when city is NULL.
SELECT
    employee_name,
    COALESCE(city, 'Unknown') AS city
FROM employees;

-- 5. Classify employee salaries
-- CASE creates High, Medium, and Low salary categories.
SELECT
    employee_name,
    salary,
    CASE
        WHEN salary >= 60000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees;

-- 6. Create the final data-quality report
-- COALESCE handles missing values and CASE creates salary categories.
SELECT
    employee_id,
    employee_name,
    COALESCE(department, 'Not Assigned') AS department,
    salary,
    COALESCE(city, 'Unknown') AS city,
    CASE
        WHEN salary >= 60000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees;

-- 7. Create the final sorted report
-- The report is sorted from the highest salary to the lowest salary.
SELECT
    employee_id,
    employee_name,
    COALESCE(department, 'Not Assigned') AS department,
    salary,
    COALESCE(city, 'Unknown') AS city,
    CASE
        WHEN salary >= 60000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM employees
ORDER BY salary DESC;

-- ✅ Day 9 Project Complete

-- CASE → Conditional Logic → NULL Handling → COALESCE → Data Quality


-- 🎯 INTERVIEW QUESTIONS + ANSWERS

-- 1. What is CASE in SQL?
-- Answer: CASE is used to apply conditional logic and return different values based on conditions.

-- 2. What is NULL?
-- Answer: NULL represents a missing or unknown value.

-- 3. Can we use = NULL to find NULL values?
-- Answer: No. We use IS NULL.

-- 4. What is IS NOT NULL?
-- Answer: It finds records where a column contains a value.

-- 5. What is COALESCE?
-- Answer: COALESCE() returns the first non-NULL value from the provided expressions.

-- 6. Why is NULL handling important for a Data Engineer?
-- Answer: Real-world data often contains missing values. Data Engineers need to identify, handle, and transform missing data correctly.

-- 7. What is the difference between CASE and COALESCE?
-- Answer: CASE applies conditional logic, while COALESCE() is commonly used to replace or handle NULL values.

 -- ✅ Day 9  Complete