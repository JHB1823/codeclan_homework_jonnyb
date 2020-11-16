-- 1 Get a table of all employees details, 
--together with their local_account_no and local_sort_code, if they have them.


SELECT 
	employees.*,
	pay_details.local_account_no, 
	pay_details.local_sort_code 
FROM employees
LEFT JOIN pay_details
ON employees.pay_detail_id = pay_details.id;

--Amend your query from question 1 above to also return the name
-- of the team that each employee belongs to.

SELECT 
	employees.*,
	team.name,
	pay_details.local_account_no, 
	pay_details.local_sort_code 
FROM (employees
LEFT JOIN pay_details) LEFT JOIN 
	()
ON employees.pay_detail_id = pay_details.id;

--Find the first name, 
--last name and 
--team name of employees who are members of teams 
--for which the charge cost is greater than 80. 
--Order the employees alphabetically by last name.

SELECT 
  e.first_name, 
  e.last_name, 
  t.name AS team_names
FROM employees AS e INNER JOIN teams AS t
ON e.team_id = t.id
WHERE CAST(t.charge_cost AS INT) > 80
ORDER BY e.last_name  ASC NULLS LAST;

--Breakdown the number of employees in each of the teams, 
--including any teams without members. Order the table by increasing size of team.


SELECT 
  t.name AS team_names, 
  COUNT(e.id) AS num_memployees
FROM employees AS e RIGHT JOIN teams AS t
ON e.team_id = t.id
GROUP BY t.name
ORDER BY num_employees ASC;

??


--The effective_salary of an employee is defined as their fte_hours multiplied
-- by their salary. Get a table for each employee showing their id,
-- first_name, last_name, fte_hours, salary and effective_salary,
-- along with a running total of effective_salary with employees placed in ascending order of effective_salary.
 
SELECT 
  id,
  first_name,
  last_name,
  fte_hours,
  salary,
  fte_hours * salary AS effective_salary,
  SUM(fte_hours * salary) OVER (ORDER BY fte_hours * salary ASC NULLS LAST)
    AS running_tot_effective_salary
FROM employees;


--The total_day_charge of a team is defined as the charge_cost of 
--the team multiplied by the number of employees in the team. 
--Calculate the total_day_charge for each team.




