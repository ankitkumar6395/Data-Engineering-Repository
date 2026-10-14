-- 📘 SQL Chapter 1: Introduction to SQL for Data Engineers
-- 💻 1. SQL Code — MySQL Workbench DAY 1

-- Step 1: Create a Database
CREATE DATABASE company_db;

-- Step 2: Select the Database
USE company_db;

-- Step 3: Create an Employees Table
CREATE TABLE employees (
    employee_id INT,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

-- Step 4: Insert Sample Data
INSERT INTO employees
    (employee_id, employee_name, department, salary)
VALUES
    (101, 'Ankit', 'IT', 50000),
    (102, 'Rahul', 'HR', 42000),
    (103, 'Priya', 'Finance', 55000);
    
-- Step 5: Retrieve the Data
SELECT *
FROM employees;

-- 🧪 2. Practical Questions
-- Try solving these independently in MySQL Workbench. Each solution is directly below its question.

-- 🧩 Question 1: Create a database named student_db.
CREATE DATABASE student_db;

-- 🧩 Question 2: Select the student_db database.
USE student_db;

-- 🧩 Question 3: Create a table named students.
CREATE TABLE students (
    student_id INT,
    student_name VARCHAR(100),
    age INT,
    city VARCHAR(50)
);

-- 🧩 Question 4: Insert five student records.
INSERT INTO students
    (student_id, student_name, age, city)
VALUES
    (1, 'Ankit', 21, 'Muzaffarnagar'),
    (2, 'Rahul', 22, 'Delhi'),
    (3, 'Priya', 20, 'Meerut'),
    (4, 'Neha', 21, 'Dehradun'),
    (5, 'Amit', 23, 'Noida');
    
-- 🧩 Question 5: Display all student records.
SELECT *
FROM students;

-- 🧩 Question 6: Create a database named sales_db.
CREATE DATABASE sales_db;

-- 🧩 Question 7: Create a products table.
USE sales_db;

CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);USE sales_db;


-- 🧩 Question 8: Insert five product records.
INSERT INTO products
    (product_id, product_name, category, price)
VALUES
    (1, 'Laptop', 'Electronics', 55000),
    (2, 'Mouse', 'Accessories', 700),
    (3, 'Keyboard', 'Accessories', 1200),
    (4, 'Monitor', 'Electronics', 12000),
    (5, 'Desk', 'Furniture', 6500);
    
-- 🧩 Question 9: Display all products.
SELECT *
FROM products;

-- 🧩 Question 10: Create an orders table, insert three records, and display them.
CREATE TABLE orders (
    order_id INT,
    customer_name VARCHAR(100),
    product_name VARCHAR(100),
    amount DECIMAL(10,2)
);

INSERT INTO orders
    (order_id, customer_name, product_name, amount)
VALUES
    (101, 'Ankit', 'Laptop', 55000),
    (102, 'Rahul', 'Mouse', 700),
    (103, 'Priya', 'Monitor', 12000);

SELECT *
FROM orders;








-- 🛠️ 3. Mini Project — Employee Database System
-- 🎯 Scenario: A company wants to store and retrieve basic employee information.

-- Step 1: Create the Project Database
CREATE DATABASE employee_db;
USE employee_db;

-- Step 2: Create the Table
CREATE TABLE employees (
    employee_id INT,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

-- Step 3: Insert Five Employees
INSERT INTO employees
    (employee_id, employee_name, department, salary)
VALUES
    (101, 'Ankit', 'IT', 50000),
    (102, 'Rahul', 'HR', 42000),
    (103, 'Priya', 'Finance', 55000),
    (104, 'Neha', 'IT', 48000),
    (105, 'Amit', 'Sales', 45000);
    
-- Step 4: Display All Employees
SELECT *
FROM employees;


-- 📘 SQL Chapter 1: Introduction to SQL for Data Engineers Completed ✅
