-- 📘 DAY 14 — SQL Date Functions & Date Filtering
-- Data Engineer 90-Day Roadmap | Beginner to Advanced
-- 🎯 Goal: Learn how to store, extract, format, and filter date values in MySQL. These skills are useful for tracking employee joining dates, transactions, orders, and daily data pipelines.

-- 📚 STUDY — Theory DAY 14

-- SQL date functions help you work with date and time values, such as extracting a year, finding today's date, calculating date differences, and adding days to a date.
            
--                                                          📅 Date Processing Flow
--                                                                |
--                                                          Date in Database
--                                                          2025-06-15
--                                                                |
--                                                          Date Functions
--                                                          YEAR · MONTH · DAY · DATEDIFF
--                                                                |
--                                                          Filtered Reports
--                                                          Monthly / yearly analysis



-- 2. Important Date Functions
-- Function	                          Purpose	                         Example
-- CURDATE()	                      Current date	                     2026-10-03
-- NOW()	                          Current date and time	             Current timestamp
-- YEAR()	                          Extract year	                     YEAR('2025-06-15') → 2025
-- MONTH()	                          Extract month	                     MONTH('2025-06-15') → 6
-- DAY()	                          Extract day	                     DAY('2025-06-15') → 15
-- DATEDIFF()	                      Difference in days	             DATEDIFF('2025-06-20','2025-06-15') → 5
-- DATE_ADD()	                      Add time to a date	             Add 7 days
-- DATE_SUB()	                      Subtract time from a date	         Subtract 1 month
-- LAST_DAY()	                      Last date of month	             2025-06-30
-- DATE_FORMAT()	                  Format a date	                     15-Jun-2025

-- 3. Date Filtering
-- Use WHERE with date values to retrieve records for a specific date or date range.
-- = finds an exact date.
-- > and < find dates after or before a date.
-- BETWEEN filters an inclusive date range.


-- 4. Date and Time Data Types
-- DATE — stores year, month, and day.
-- DATETIME — stores date and time.
-- TIMESTAMP — stores a date-time value with MySQL's time-zone conversion behavior.


-- 5. Extracting Date Parts
-- Date parts help organize data into yearly, monthly, or daily reports.
-- Example: Extract the year, month, and day from an employee's joining date.
SELECT
    employee_name,
    YEAR(joining_date) AS Joining_Year,
    MONTH(joining_date) AS Joining_Month,
    DAY(joining_date) AS Joining_Day
FROM employees;


-- 6. Date Arithmetic
-- DATE_ADD() and DATE_SUB() calculate dates relative to an existing date.
SELECT
    DATE_ADD('2025-06-15', INTERVAL 7 DAY) AS After_7_Days,
    DATE_SUB('2025-06-15', INTERVAL 1 MONTH) AS Previous_Month;


-- 7. Date Difference
-- DATEDIFF() returns the number of days between two dates. The result is the first date minus the second date.
SELECT
    DATEDIFF('2025-06-20', '2025-06-15') AS Days_Difference;


-- 8. Date Formatting
-- DATE_FORMAT() displays a date in a chosen format. It changes the output format, not the stored date.
SELECT
    DATE_FORMAT('2025-06-15', '%d-%b-%Y') AS Formatted_Date;

-- Common format specifiers: %Y = four-digit year, %m = month number, %M = month name, %d = day, %b = abbreviated month name.

-- 9. Filtering Date Ranges
-- For a DATE column, BETWEEN includes both endpoints. For a DATETIME column, a half-open range (>= start and < next day) is often safer when retrieving a whole day or month.
SELECT
    employee_id,
    employee_name,
    joining_date
FROM employees
WHERE joining_date >= '2025-01-01'
  AND joining_date < '2026-01-01'
ORDER BY joining_date;


-- 💻 CODE — MySQL Workbench DAY 14
-- Database setup: Create a sample employee table with joining dates to practice date functions and filtering.
CREATE DATABASE company_day14;

USE company_day14;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    city VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE
);

INSERT INTO employees
(employee_id, employee_name, department, city, salary, joining_date)
VALUES
(101, 'Rahul Sharma', 'IT', 'Delhi', 65000, '2023-01-15'),
(102, 'Amit Kumar', 'HR', 'Noida', 45000, '2024-03-20'),
(103, 'Priya Singh', 'Finance', 'Delhi', 55000, '2022-07-10'),
(104, 'Neha Verma', 'IT', 'Gurgaon', 72000, '2025-02-05'),
(105, 'Ravi Kumar', 'Sales', 'Agra', 40000, '2023-11-25'),
(106, 'Pooja Sharma', 'Finance', 'Delhi', 60000, '2024-06-12'),
(107, 'Suresh Patel', 'IT', 'Noida', 58000, '2021-09-18'),
(108, 'Anjali Gupta', 'HR', 'Agra', 48000, '2025-01-08'),
(109, 'Vikas Singh', 'Sales', 'Delhi', 52000, '2022-12-01'),
(110, 'Kiran Verma', 'IT', 'Gurgaon', 75000, '2023-05-22');


-- Example 1 — View today's date and current date-time
SELECT
    CURDATE() AS Today,
    NOW() AS Current_Date_Time;


-- Example 2 — Extract year, month, and day
SELECT
    employee_name,
    joining_date,
    YEAR(joining_date) AS Joining_Year,
    MONTH(joining_date) AS Joining_Month,
    DAY(joining_date) AS Joining_Day
FROM employees;


-- Example 3 — Find employees who joined in 2024
SELECT
    employee_name,
    department,
    joining_date
FROM employees
WHERE YEAR(joining_date) = 2024;


-- Example 4 — Calculate days since joining
SELECT
    employee_name,
    joining_date,
    DATEDIFF(CURDATE(), joining_date) AS Days_Since_Joining
FROM employees;


-- Example 5 — Display a formatted joining date
SELECT
    employee_name,
    DATE_FORMAT(joining_date, '%d-%b-%Y') AS Formatted_Joining_Date
FROM employees;


-- Example 6 — Calculate a date 30 days after joining
SELECT
    employee_name,
    joining_date,
    DATE_ADD(joining_date, INTERVAL 30 DAY) AS After_30_Days
FROM employees;


-- 🧪 DAY 14 — PRACTICE QUESTIONS: SQL ANSWERS DAY 14
-- Database: company_day14
-- Table: employees
-- Tool: MySQL Workbench

-- 1. Display all employees and their joining dates.
SELECT
    employee_name,
    joining_date
FROM employees;


-- 2. Find employees who joined in 2023.
SELECT
    employee_name,
    department,
    joining_date
FROM employees
WHERE YEAR(joining_date) = 2023;


-- 3. Display employee names and extract the joining month.
SELECT
    employee_name,
    MONTH(joining_date) AS Joining_Month
FROM employees;


-- 4. Find employees who joined after 2024-01-01.
SELECT
    employee_name,
    department,
    joining_date
FROM employees
WHERE joining_date > '2024-01-01';


-- 5. Find employees who joined between 2022-01-01 and 2023-12-31.
SELECT
    employee_name,
    department,
    joining_date
FROM employees
WHERE joining_date BETWEEN '2022-01-01' AND '2023-12-31';


-- 6. Display each employee's joining date in DD-Mon-YYYY format.
SELECT
    employee_name,
    DATE_FORMAT(joining_date, '%d-%b-%Y') AS Formatted_Joining_Date
FROM employees;


-- 7. Calculate the number of days between each employee's joining date and today.
SELECT
    employee_name,
    joining_date,
    DATEDIFF(CURDATE(), joining_date) AS Days_Since_Joining
FROM employees;


-- 8. Display each employee's joining date and the date 90 days after joining.
SELECT
    employee_name,
    joining_date,
    DATE_ADD(joining_date, INTERVAL 90 DAY) AS After_90_Days
FROM employees;


-- 9. Find employees who joined in January, regardless of the year.
SELECT
    employee_name,
    department,
    joining_date
FROM employees
WHERE MONTH(joining_date) = 1;


-- 10. Display employees who joined before 2023-01-01, sorted by joining date from oldest to newest.
SELECT
    employee_name,
    department,
    joining_date
FROM employees
WHERE joining_date < '2023-01-01'
ORDER BY joining_date ASC;



-- 🛠️ MINI PROJECT — DAY 14
-- Employee Joining Timeline & Workforce Report
-- Scenario: The HR department needs a report showing employee joining dates, service duration, recent hires, and monthly hiring trends.

-- 1. Employee Joining Report
SELECT
    employee_id,
    employee_name,
    department,
    joining_date,
    YEAR(joining_date) AS Joining_Year
FROM employees
ORDER BY joining_date ASC;


-- 2. Calculate Completed Years of Service
SELECT
    employee_id,
    employee_name,
    joining_date,
    TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) AS Years_Of_Service
FROM employees
ORDER BY Years_Of_Service DESC;


-- 3. Identify Employees Who Joined Within the Last 365 Days
SELECT
    employee_id,
    employee_name,
    department,
    joining_date
FROM employees
WHERE joining_date >= DATE_SUB(CURDATE(), INTERVAL 365 DAY)
  AND joining_date <= CURDATE()
ORDER BY joining_date DESC;


-- 4. Calculate Each Employee's Six-Month Anniversary Date
SELECT
    employee_id,
    employee_name,
    joining_date,
    DATE_ADD(joining_date, INTERVAL 6 MONTH) AS Six_Month_Anniversary
FROM employees
ORDER BY joining_date;


-- 5. Generate a Monthly Hiring Report
SELECT
    YEAR(joining_date) AS Hiring_Year,
    MONTH(joining_date) AS Hiring_Month,
    DATE_FORMAT(joining_date, '%M') AS Month_Name,
    COUNT(*) AS Employees_Hired
FROM employees
GROUP BY
    YEAR(joining_date),
    MONTH(joining_date),
    DATE_FORMAT(joining_date, '%M')
ORDER BY
    Hiring_Year,
    Hiring_Month;


-- 6. Find Earliest and Latest Joining Dates for Each Department
SELECT
    department,
    MIN(joining_date) AS Earliest_Joining_Date,
    MAX(joining_date) AS Latest_Joining_Date,
    COUNT(*) AS Employee_Count
FROM employees
GROUP BY department
ORDER BY department;


-- 7. Final Workforce Timeline
SELECT
    employee_id,
    employee_name,
    department,
    city,
    joining_date,
    YEAR(joining_date) AS Joining_Year,
    TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) AS Years_Of_Service
FROM employees
ORDER BY joining_date ASC;


-- 🎯 Key Learning
--  YEAR(), MONTH() and DAY() extract date components.
--  DATEDIFF() calculates the difference in days.
--  TIMESTAMPDIFF() calculates the difference in a specified unit, such as years.
-- DATE_ADD() and DATE_SUB() perform date arithmetic.
-- DATE_FORMAT() formats dates for reports.
-- MIN(), MAX() and GROUP BY help summarize hiring trends.


-- 🎯 INTERVIEW QUESTIONS + ANSWERS DAY 14
-- 1. What are SQL date functions?
-- SQL date functions help retrieve, format, compare, and perform calculations on date and time values.

-- 2. What is the difference between CURDATE() and NOW()?
-- CURDATE() returns the current date, while NOW() returns the current date and time.

-- 3. What does DATEDIFF() do?
-- It calculates the number of days between two dates, using the first date minus the second date.

-- 4. What is the purpose of DATE_ADD()?
-- It adds a specified time interval to a date, such as adding 30 days to an employee's joining date.

-- 5. What is the difference between DATE and DATETIME?
-- DATE stores a calendar date, whereas DATETIME stores both the date and time.

-- 6. What does YEAR() return?
-- It extracts the year from a date value.

-- 7. What is DATE_FORMAT() used for?
-- It formats a date for display using specified format patterns, without changing the stored value.

-- 8. How can you filter records for a particular year?
-- You can use YEAR(date_column) = year, or use a date range such as date_column >= '2025-01-01' AND date_column < '2026-01-01'. A range can be more suitable for indexed date columns.

-- 9. What does LAST_DAY() do?
-- It returns the last calendar date of the month for a given date.

-- 10. What is the difference between DATEDIFF() and TIMESTAMPDIFF()?
-- DATEDIFF() returns the difference in days, while TIMESTAMPDIFF() returns the difference in a specified unit, such as years, months, or days.