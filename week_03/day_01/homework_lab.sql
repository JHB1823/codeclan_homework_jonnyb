SELECT *
FROM employees

-- Question 1 

-- Find all the employees who work in the ‘Human Resources’ department.

SELECT *
FROM employees 
WHERE department = 'Human Resources'

-- Question 2 
--Get the first_name, last_name, and country of the employees who work in the ‘Legal’ department

SELECT 
	first_name,
	last_name,
	country
FROM employees 
WHERE department = 'Legal';

--Question 3 
--Count the number of employees based in Portugal.

SELECT country,
   COUNT(id) AS Portugal_employees
FROM employees 
WHERE country = 'Portugal'
GROUP BY country;


--question 4 
--Count the number of employees based in either Portugal or Spain.


SELECT country,
	COUNT(id) AS num_employees
FROM employees
WHERE country = 'Portugal' OR country = 'Spain'
GROUP BY country IN ('Portugal', 'Spain');


--Question 5
--Count the number of pay_details records lacking a local_account_no.

SELECT 
	count(id)
FROM pay_details 
WHERE local_account_no IS NULL 

--Question 6 
--Get a table with employees first_name and last_name ordered alphabetically by last_name (put any NULLs last).



SELECT 
	first_name,
	last_name
FROM employees 
ORDER BY last_name ASC

--Question 7
How many employees have a first_name beginning with ‘F’?

SELECT 
	first_name,
	count(id) AS begins_with_f
FROM employees 
WHERE first_name LIKE 'f%';

--question 8

--Count the number of pension enrolled employees not based in either France or Germany.

SELECT 
	count(id)
FROM employees 
WHERE country != 'France' OR country != 'Germany'
AND pension_enrol IS TRUE;


--Question 9 
--Obtain a count by department of the employees who started work with the corporation in 2003.

SELECT 
	count(id)
FROM employees 
WHERE start_date >= '2003-01-01' AND <= '2003-12-31';


--Question 10 
--Obtain a table showing department, fte_hours and 
--the number of employees in each department who work each fte_hours pattern. 
-- Order the table alphabetically by department, 
--and then in ascending order of fte_hours.


SELECT 
	COUNT(id) AS number_of_employees_on_fte_pattern
FROM employees 
GROUP BY department , fte_hours
ORDER BY   department ASC, fte_hours ASC;



--Question 11 
--Obtain a table showing any departments in which there are two or more employees lacking a stored first name.
-- Order the table in descending order of the number of employees lacking a first name, 
--and then in alphabetical order by department???

SELECT department, 
	COUNT(id) AS num_employees_no_first
FROM employees 
WHERE first_name IS NULL
GROUP BY department
HAVING COUNT(id) >= 2
ORDER BY COUNT(id) DESC NULLS LAST, department ASC NULLS LAST ;


--Question break down 
--1 SELECT departments 
--Count() for missing names 
--2 FROM employees
--3 WHERE first_name

--GROUP BY department 
-- when missing 2 names ? count names missing insert count between 1-2
-- show group when missing names count is equal to/more than 2 
-- missing values in desc


SELECT
	department, 
	COUNT(id) AS missing_names
FROM employees 
WHERE first_name IS NULL
GROUP BY department 
HAVING COUNT(id) >= 2
ORDER BY COUNT(ID) DESC, department ; 

--Question 12
--Tough!] Find the proportion of employees in each department who are grade 1.

SELECT 
  department, 
  SUM(CAST(grade = '1' AS INT)) / CAST(COUNT(id) AS REAL) AS prop_grade_1 
FROM employees 
GROUP BY department;

SELECT 
	grade,
	grade = 1 AS in_grade_1
FROM employees;