-- 🚀 DAY 7 — SQL JOINs

-- Today we start one of the most important SQL topics for a Data Engineer: JOINs.

-- 📚 STUDY DAY 7

-- A JOIN combines data from two or more tables using a related column.

-- Main JOINs
-- | JOIN         | Purpose                                                               |
-- | ------------ | --------------------------------------------------------------------- |
-- | `INNER JOIN` | Returns matching records from both tables                             |
-- | `LEFT JOIN`  | Returns all records from the left table + matching records from right |
-- | `RIGHT JOIN` | Returns all records from the right table + matching records from left |

-- Example

-- Suppose we have:

-- employees
-- | employee_id | employee_name | department_id |
-- | ----------- | ------------- | ------------- |
-- | 101         | Rahul         | 1             |
-- | 102         | Amit          | 2             |

-- departments
-- | department_id | department_name |
-- | ------------- | --------------- |
-- | 1             | IT              |
-- | 2             | HR              |

-- We can combine them using:

-- employees.department_id = departments.department_id

-- 💻 CODE DAY 7
-- 1. Create the database
-- This database will be used to practice SQL JOINs.
CREATE DATABASE company_day7;

-- 2. Select the database
-- This tells MySQL which database we want to work with.
USE company_day7;

-- 3. Create the departments table
-- This table stores department information.
CREATE TABLE departments (
department_id INT PRIMARY KEY,
department_name VARCHAR(50)
);

-- 4. Insert department records
-- These departments will be connected to employees.
INSERT INTO departments
(department_id, department_name)
VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Sales');

-- 5. Create the employees table
-- department_id connects employees to departments.
CREATE TABLE employees (
employee_id INT PRIMARY KEY,
employee_name VARCHAR(100),
department_id INT,
salary DECIMAL(10,2)
);

-- 6. Insert employee records
-- Each employee is assigned to a department using department_id.
INSERT INTO employees
(employee_id, employee_name, department_id, salary)
VALUES
(101, 'Rahul Sharma', 1, 65000),
(102, 'Amit Kumar', 2, 45000),
(103, 'Priya Singh', 3, 55000),
(104, 'Neha Verma', 1, 72000),
(105, 'Ravi Kumar', 4, 40000),
(106, 'Pooja Sharma', 3, 60000);

-- 7. Combine employees and departments
-- INNER JOIN returns employees whose department matches a department record.
SELECT
	employees.employee_id,
    employees.employee_name,
    departments.department_name,
    employees.salary
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id;

-- 8. Use LEFT JOIN
-- LEFT JOIN keeps all employees and adds department information when available.
SELECT
    employees.employee_name,
    departments.department_name
FROM employees
LEFT JOIN departments
ON employees.department_id = departments.department_id;

-- 9. Find employees working in IT
-- JOIN combines the tables, while WHERE filters the result.
SELECT
    employees.employee_name,
    departments.department_name,
    employees.salary
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id
WHERE departments.department_name = 'IT';

-- 10. Create a salary report with department names
-- JOIN combines employee and department information, then ORDER BY sorts salaries.
SELECT
    employees.employee_name,
    departments.department_name,
    employees.salary
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id
ORDER BY employees.salary DESC;

-- 🧪 10 PRACTICE QUESTIONS ANSWERS — DAY 7
-- 1. Display employee names with their department names.
SELECT
    employees.employee_name,
    departments.department_name
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id;

-- 2. Display employee names, departments, and salaries.
SELECT
    employees.employee_name,
    departments.department_name,
    employees.salary
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id;

-- 3. Find all employees working in IT.
SELECT
    employees.employee_name,
    departments.department_name
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id
WHERE departments.department_name = 'IT';

-- 4. Find all employees working in Finance.
SELECT
    employees.employee_name,
    departments.department_name
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id
WHERE departments.department_name = 'Finance';

-- 5. Display all employees using LEFT JOIN.
SELECT
    employees.employee_id,
    employees.employee_name,
    departments.department_name,
    employees.salary
FROM employees
LEFT JOIN departments
ON employees.department_id = departments.department_id;

-- 6. Display employees sorted by salary from highest to lowest along with their department names.
SELECT
    employees.employee_name,
    departments.department_name,
    employees.salary
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id
ORDER BY employees.salary DESC;

-- 7. Find employees earning more than 50000 and display their department names.
SELECT
    employees.employee_name,
    departments.department_name,
    employees.salary
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id
WHERE employees.salary > 50000;

-- 8. Find the employee with the highest salary and display their department.
SELECT
    employees.employee_name,
    departments.department_name,
    employees.salary
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id
ORDER BY employees.salary DESC
LIMIT 1;

-- 9. Display all employees from HR and their salaries.
SELECT
    employees.employee_name,
    departments.department_name,
    employees.salary
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id
WHERE departments.department_name = 'HR';

-- 10. Count the number of employees in each department using a JOIN.
SELECT
    departments.department_name,
    COUNT(employees.employee_id) AS total_employees
FROM departments
LEFT JOIN employees
ON departments.department_id = employees.department_id
GROUP BY departments.department_name;

-- 🛠️ MINI PROJECT — DAY 7
-- Employee & Department Reporting System — Solution

-- 1. Create the departments table
-- This table stores department information.
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- 2. Create the employees table
-- department_id connects each employee to a department.
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

-- 3. Insert department records
-- These departments will be connected with employee records.
INSERT INTO departments
(department_id, department_name)
VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Sales');

-- 4. Insert employee records
-- Each employee is assigned to a department using department_id.
INSERT INTO employees
(employee_id, employee_name, department_id, salary)
VALUES
(101, 'Rahul Sharma', 1, 65000),
(102, 'Amit Kumar', 2, 45000),
(103, 'Priya Singh', 3, 55000),
(104, 'Neha Verma', 1, 72000),
(105, 'Ravi Kumar', 4, 40000),
(106, 'Pooja Sharma', 3, 60000),
(107, 'Suresh Yadav', 1, 58000),
(108, 'Anjali Gupta', 2, 48000);

-- 5. Create the employee-department report
-- JOIN combines employee information with department information.
SELECT
    employees.employee_id,
    employees.employee_name,
    departments.department_name,
    employees.salary
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id;

-- 6. Find employees in each department
-- This report shows which employees belong to each department.
SELECT
    departments.department_name,
    employees.employee_name
FROM departments
INNER JOIN employees
ON departments.department_id = employees.department_id
ORDER BY departments.department_name;

-- 7. Find employees earning above 50000
-- JOIN provides the department name for each employee.
SELECT
    employees.employee_name,
    departments.department_name,
    employees.salary
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id
WHERE employees.salary > 50000;

-- 8. Create the salary ranking
-- Employees are sorted from highest salary to lowest salary.
SELECT
    employees.employee_name,
    departments.department_name,
    employees.salary
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id
ORDER BY employees.salary DESC;

-- 9. Count employees in each department
-- GROUP BY creates department-level groups and COUNT() counts employees.
SELECT
    departments.department_name,
    COUNT(employees.employee_id) AS employee_count
FROM departments
LEFT JOIN employees
ON departments.department_id = employees.department_id
GROUP BY departments.department_name;

-- ✅ Day 7 Project Complete

-- Multiple Tables → Foreign Key → JOIN → GROUP BY → Business Reporting

-- 🎯 INTERVIEW QUESTIONS + ANSWERS DAY 7

-- 1. What is a JOIN?
-- Answer: A JOIN combines rows from two or more tables using a related column.

-- 2. What is INNER JOIN?
-- Answer: It returns only records that have matching values in both tables.

-- 3. What is LEFT JOIN?
-- Answer: It returns all records from the left table and matching records from the right table.

-- 4. Why are JOINs important for Data Engineers?
-- Answer: Real-world data is often stored across multiple tables. JOINs allow us to combine that data for processing and reporting.

-- 5. What is the ON clause?
-- Answer: ON defines the condition used to match rows between tables.

-- 6. What is a foreign key?
-- Answer: A foreign key is a column that references a key in another table and helps establish a relationship between tables.
