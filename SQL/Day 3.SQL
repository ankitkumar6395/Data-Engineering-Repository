-- 🚀 DAY 3 — SQL Data Modification
-- 📚 STUDY
-- Today you will learn:

-- INSERT → Add new records
-- UPDATE → Modify existing records
-- DELETE → Remove records
-- WHERE → Select specific records for modification
-- TRUNCATE → Remove all records from a table
-- DROP → Remove the complete table

-- Key Difference
-- Command            	Purpose
-- INSERT	            Add data
-- UPDATE	            Change data
-- DELETE	            Remove selected data
-- TRUNCATE	            Remove all rows
-- DROP	                Remove the table

-- 💻 CODE DAY 3

-- 1. Create the database
-- This database will be used to practice data modification.
CREATE DATABASE company_day3;

-- 2. Select the database
-- This tells MySQL which database we want to work with.
USE company_day3;

-- 3. Create the employees table
-- This table will store employee information.
CREATE TABLE employees (
employee_id INT PRIMARY KEY,
employee_name VARCHAR(100),
department VARCHAR(50),
salary DECIMAL(10,2)
);

-- 4. Insert employee records
-- INSERT is used to add new records to a table.
INSERT INTO employees
(employee_id, employee_name,department,salary)
VALUES
(100, 'Rahul Sharma', 'IT', 65000),
(102, 'Amit Kumar', 'HR', 45000),
(103, 'Priya Singh', 'Finance', 50000),
(104, 'Neha Verma', 'IT', 60000),
(105, 'Ravi Kumar', 'Sales', 40000);

-- 5. Display employee records
-- This shows the current data stored in the table.
SELECT *
FROM employees;

-- 6. Update an employee salary
-- UPDATE changes existing data in a table.
UPDATE employees
SET salary = 70000
WHERE employee_id = 101;

-- 7. Update an employee department
-- The WHERE condition identifies the specific employee.
UPDATE employees
SET department = 'Management'
WHERE employee_id = 102;

-- 8. Delete an employee record
-- DELETE removes a specific record from the table.
DELETE FROM employees
WHERE employee_id = 105;

-- 9. Check the modified data
-- Verify that the UPDATE and DELETE operations worked correctly.
SELECT *
FROM employees;

-- 10. Always use WHERE with UPDATE and DELETE
-- Without WHERE, all matching table records can be modified or deleted.
SET SQL_SAFE_UPDATES = 0;
UPDATE employees
SET salary = 50000;

-- 🧪 10 PRACTICE ANSWERS — DAY 3
-- 1. Insert a new employee with ID 106.
INSERT INTO employees
(employee_id, employee_name, department, salary)
VALUES
(106, 'Ankit Kumar', 'IT', 55000);

-- 2. Insert two new employees into the table.
INSERT INTO employees
(employee_id, employee_name, department, salary)
VALUES
(107, 'Suresh Kumar', 'HR', 48000),
(108, 'Pooja Singh', 'Finance', 52000);

-- 3. Update employee 103 salary to 55000.
UPDATE employees
SET salary = 55000
WHERE employee_id = 103;

-- 4. Change employee 104 department to Finance.
UPDATE employees
SET department = 'Finance'
WHERE employee_id = 104;

-- 5. Increase employee 101 salary to 75000.
UPDATE employees
SET salary = 75000
WHERE employee_id = 101;

-- 6. Delete employee 106.
DELETE FROM employees
WHERE employee_id = 106;

-- 7. Update the department of all employees working in IT to Technology.
UPDATE employees
SET department = 'Technology'
WHERE department = 'IT';

-- 8. Delete the employee whose ID is 105.
DELETE FROM employees
WHERE employee_id = 105;

-- 9. Display all employees after performing the modifications.
SELECT *
FROM employees;

-- 10. Explain why using WHERE is important with UPDATE and DELETE.
-- Answer:
-- WHERE identifies the specific records that should be modified or deleted. Without WHERE, UPDATE or DELETE can affect all records in the table.

-- 🛠️ MINI PROJECT — DAY 3
-- Employee Data Management System
-- 🎯 Objective

-- Build a small employee management system that handles:

-- New employee joining
-- Salary revision
-- Department transfer
-- Employee exit
-- Final data verification

-- 1. Create the employee management database
-- This database will store employee information and updates.
CREATE DATABASE employee_management;

-- 2. Select the employee management database
-- This tells MySQL where we will build our system.
USE employee_management;

-- 3. Create the employees table
-- This table stores employee ID, name, department, salary, and joining date.
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE
);

-- 4. Add existing employees
-- These are the employees currently working in the company.
INSERT INTO employees
(employee_id, employee_name, department, salary, joining_date)
VALUES
(201, 'Rahul Sharma', 'IT', 65000, '2025-01-15'),
(202, 'Priya Singh', 'Finance', 55000, '2025-03-10'),
(203, 'Amit Kumar', 'HR', 48000, '2025-05-20'),
(204, 'Neha Verma', 'IT', 60000, '2025-07-12'),
(205, 'Ravi Kumar', 'Sales', 45000, '2025-09-01');

-- 5. Add a new employee
-- A new employee joins the company and must be added to the system.
INSERT INTO employees
(employee_id, employee_name, department, salary, joining_date)
VALUES
(206, 'Suresh Yadav', 'IT', 52000, '2026-01-10');

-- 6. Update an employee salary
-- The company gives Rahul Sharma a salary revision.
UPDATE employees
SET salary = 72000
WHERE employee_id = 201;

-- 7. Transfer an employee
-- Priya Singh is transferred from Finance to Management.
UPDATE employees
SET department = 'Management'
WHERE employee_id = 202;

-- 8. Remove an employee
-- Ravi Kumar leaves the company, so his record is removed.
DELETE FROM employees
WHERE employee_id = 205;

-- 9. Check the updated employees
-- Verify the salary revision and department transfer.
SELECT *
FROM employees
WHERE employee_id IN (201, 202);

-- 10. Display the final employee data
-- Verify the complete employee management workflow.
SELECT *
FROM employees;

-- ✅ Project Outcome

-- You have now practiced a complete workflow:

-- Existing Employees → New Employee → Salary Revision → Department Transfer → Employee Exit → Final Verification

-- Key Data Engineer Concept

-- The important part is not just writing SQL. You are learning how to modify production-style data safely using conditions such as WHERE and verify the result afterward.