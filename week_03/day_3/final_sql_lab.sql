Final SQL Lab and Homework

--Q1:
--Are there any pay_details records lacking 
--both a local_account_no and iban number?

SELECT
	local_account_no ,
	iban
FROM pay_details
WHERE local_account_no  IS NULl
AND iban IS NULL 



SELECT 
	first_name,
	last_name,
	country
FROM 
	employees 
ORDER BY country ASC 


SELECT 
	first_name,
	last_name,
	country
FROM 
	employees 
ORDER BY last_name ASC, NULL LAST;

-- 1

--Are there any pay_details records lacking 
--both a local_account_no and iban number?

SELECT *
FROM pay_details 
WHERE local_account_no IS NULL AND iban IS NULL;

-- No pay_details are lacking both an local_account_no & an iban number 

-- 2

--Get a table of employees first_name, last_name and country,
--ordered alphabetically first by country 
--and then by last_name (put any NULLs last).

SELECT 
	first_name,
	last_name,
	country
FROM employees 
ORDER BY country, last_name ASC NULLS LAST;


-- 3 
-- Find the details of the top ten highest paid employees in the corporation.


SELECT *
FROM employees 
ORDER BY salary DESC NULLS LAST
LIMIT 10 ;
-- 4 
SELECT 
	first_name,
	last_name,
	salary, 
	country
FROM employees 
WHERE country = 'Hungary'
ORDER BY salary ASC NULLS LAST
LIMIT 1;


-- 5 

--Find all the details of any employees with a ‘yahoo’ email address?


SELECT *
FROM employees 
WHERE email LIKE '%yahoo%';


-- 6 
-- Provide a breakdown of the numbers of employees enrolled,
-- not enrolled, and with unknown enrollment status in the corporation pension scheme.


SELECT 
	pension_enrol,
	COUNT (id) AS num_of_employees
FROM employees
GROUP BY pension_enrol;


-- 7 

--What is the maximum salary among those employees in the 
--‘Engineering’ department who work 1.0 full-time equivalent hours (fte_hours)?


SELECT 
	id,
	first_name,
	last_name,
	fte_hours,
	department, 
	salary
FROM employees 
WHERE department = 'Engineering' AND fte_hours = 1
ORDER BY salary DESC
LIMIT 1;


-- 8

--Get a table of country, number of employees in that country,
--and the average salary of employees in that 
--country for any countries in which more than 30 employees are based. 
--Order the table by average salary descending.


SELECT
	employees.country,
	COUNT(employees.id) AS employee_count,
	AVG(employees.salary) AS avg_salary
FROM employees
GROUP BY employees.country 
HAVING COUNT(employees.id) > 30
ORDER BY AVG(employees.salary) DESC NULLS LAST;


-- 9

--Return a table containing each employees first_name, 
--last_name, full-time equivalent hours (fte_hours),
-- salary, and a new column effective_yearly_salary 
--which should contain fte_hours multiplied by salary.

SELECT 
	id,
	first_name,
	last_name,
	fte_hours,
	salary,
	fte_hours * salary AS effective_yearly_salary
FROM employees;

-- 10
--Find the first name and last name of all employees who lack a local_tax_code.

SELECT 
	e.first_name,
	e.last_name,
	p.local_tax_code
FROM employees AS e INNER JOIN pay_details AS p
ON e.id = p.id
WHERE p.local_tax_code IS NULL;


-- 11

--The expected_profit of an employee is defined as
-- (48 * 35 * charge_cost - salary) * fte_hours, 
--where charge_cost depends upon the team to which the employee belongs. 
--Get a table showing expected_profit for each employee.


SELECT
	t.id,
	CAST(t.charge_cost AS INT),
	e.salary,
	e.first_name,
	e.last_name,
	e.fte_hours,
	48 * 35 * CAST(t.charge_cost AS INT) - e.salary AS expected_profit
FROM employees AS e LEFT JOIN teams AS t 
ON e.team_id = t.id;


-- 12




SELECT 
	id,
	first_name,
	last_name,
	salary,
	fte_hours,
	salary
SELECT 
	department,
	count(id) AS num_employees
FROM employees 
GROUP BY department 
ORDER BY count(id) DESC 
LIMIT 1
	

SELECT 
	id,
	first_name,
	last_name,
	salary,
	fte_hours,
	salary

???



