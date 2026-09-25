-- DAY 2
-- 1. Create a database
-- This database will be used to practice data types and constraints.
CREATE DATABASE company_day2;

-- 2. Select the database
-- This tells MySQL which database we want to work with.
USE company_day2;

-- 3. Create the employees table
-- Different data types and constraints are applied to the columns.
CREATE TABLE employees (
employee_id INT PRIMARY KEY,
employee_name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
department VARCHAR(50) DEFAULT 'General',
salary DECIMAL (10,2),
Joining_date DATE
);

-- 4. Insert employee records
-- Add employee information using the defined data types.
INSERT INTO employees
(employee_id, employee_name, email, department, salary, joining_date)
VALUES
(101, 'Rahul Sharma', 'rahul@gmail.com', 'IT', 65000.50, '2026-01-10'),
(102, 'Amit Kumar', 'amit@gmail.com', 'HR', 45000.00, '2026-02-15'),
(103, 'Priya Singh', 'priya@gmail.com', 'Finance', 50000.75, '2026-03-20');

-- 5. Display all employees
-- View the data stored in the employees table.
SELECT *
FROM employees;

-- 6. Check table structure
-- This shows columns, data types, and key information.
DESCRIBE employees;

-- 7. Test the DEFAULT constraint
-- If department is not provided, MySQL uses the default value.
INSERT INTO employees
(employee_id, employee_name, email, salary, joining_date)
VALUES
(104, 'Neha Verma', 'neha@gmail.com', 55000.00, '2026-04-05');

-- 8. Display the employee with ID 104
-- Check whether the DEFAULT department value was applied.
SELECT *
FROM employees
WHERE employee_id = 104;

-- 🧪 Day 2 Practice Answers
-- 1. Create a database named student_db.
CREATE DATABASE student_db;

-- 2. Create a students table with:
-- student_id
-- student_name
-- email
-- age

-- Use appropriate data types.
CREATE TABLE students (
    student_id INT,
    student_name VARCHAR(100),
    email VARCHAR(100),
    age INT
);

-- 3. Make student_id the PRIMARY KEY.
ALTER TABLE students
ADD PRIMARY KEY (student_id);

-- 4. Make student_name NOT NULL.
ALTER TABLE students
MODIFY student_name VARCHAR(100) NOT NULL;

-- 5. Make email UNIQUE.
ALTER TABLE students
ADD UNIQUE (email);

-- 6. Insert 5 student records.
INSERT INTO students
(student_id, student_name, email, age)
VALUES
(1, 'Rahul Sharma', 'rahul@gmail.com', 21),
(2, 'Amit Kumar', 'amit@gmail.com', 22),
(3, 'Priya Singh', 'priya@gmail.com', 20),
(4, 'Neha Verma', 'neha@gmail.com', 23),
(5, 'Ravi Kumar', 'ravi@gmail.com', 21);
-- 7. Display all students.
SELECT *
FROM students;

-- 8. Use DESCRIBE to check the table structure.
DESCRIBE students;

-- 9. Create a column with a DEFAULT value.
ALTER TABLE students
ADD COLUMN city VARCHAR(50) DEFAULT 'Delhi';

-- 10. Try inserting a duplicate value into a UNIQUE column and observe what happens.
INSERT INTO students
(student_id, student_name, email, age)
VALUES
(6, 'Ankit Kumar', 'ankit@gmail.com', 22);

-- 🛠️ MINI PROJECT — DAY 2
-- Student Registration & Data Quality System

-- 1. Create the college database
-- This database will store student registration data.
CREATE DATABASE college_db;

-- 2. Select the college database
-- This tells MySQL where we want to create our student table.
USE college_db;

-- 3. Create the students table
-- Constraints are used to maintain accurate and reliable student data.
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT,
    city VARCHAR(50) DEFAULT 'Delhi'
);

-- 4. Insert student records
-- Add student information while following the table constraints.
INSERT INTO students
(student_id, student_name, email, age, city)
VALUES
(1, 'Rahul Sharma', 'rahul@gmail.com', 21, 'Mathura'),
(2, 'Amit Kumar', 'amit@gmail.com', 22, 'Agra'),
(3, 'Priya Singh', 'priya@gmail.com', 20, 'Delhi'),
(4, 'Neha Verma', 'neha@gmail.com', 23, 'Noida'),
(5, 'Ravi Kumar', 'ravi@gmail.com', 21, 'Meerut'),
(6, 'Pooja Sharma', 'pooja@gmail.com', 22, 'Jaipur'),
(7, 'Arjun Singh', 'arjun@gmail.com', 20, 'Gurgaon'),
(8, 'Sneha Gupta', 'sneha@gmail.com', 21, 'Delhi'),
(9, 'Vikas Yadav', 'vikas@gmail.com', 24, 'Agra'),
(10, 'Karan Verma', 'karan@gmail.com', 22, 'Noida');

-- 5. Insert a student without city
-- MySQL should automatically use Delhi as the city.
INSERT INTO students
(student_id, student_name, email, age)
VALUES
(11, 'Ankit Kumar', 'ankit@gmail.com', 22);

-- 6. Display the student
-- Check whether the city was automatically set to Delhi.
SELECT *
FROM students
WHERE student_id = 11;

-- 7. Test duplicate student ID
-- The PRIMARY KEY should prevent duplicate student IDs.
INSERT INTO students
(student_id, student_name, email, age, city)
VALUES
(1, 'Test Student', 'test1@gmail.com', 21, 'Delhi');

-- 8. Test missing student name
-- The NOT NULL constraint should prevent an empty student name.
INSERT INTO students
(student_id, email, age, city)
VALUES
(12, 'test2@gmail.com', 21, 'Delhi');

-- 9. Test duplicate email
-- The UNIQUE constraint should prevent duplicate email addresses.
INSERT INTO students
(student_id, student_name, email, age, city)
VALUES
(13, 'Test Student', 'rahul@gmail.com', 21, 'Delhi');

-- 10. Check the final table structure
-- Verify the columns, data types, and constraints.
DESCRIBE students;