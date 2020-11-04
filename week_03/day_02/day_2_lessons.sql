--“Get a list of all the animals that have diet plans
-- together with the diet plans that they are on.”

SELECT 
	a.name,
	a.species,
	d.diet_type
FROM animals AS a INNER JOIN diets AS d
ON a.diet_id = d.id

--“Find any known dietary requirements for animals over four years old.”

SELECT 
	a.name,
	a.species,
	a.age,
	d.diet_type
FROM animals AS a INNER JOIN diets AS d
ON a.diet_id = d.id 
WHERE a.age > 4 

-- ^^Once you have shortened animal - a. in FROM also us AS !

--“Breakdown the number of animals in the zoo by their diet types.” - 'group by' diet type 

SELECT 
	d.diet_type, -- grouping by
	count(a.id) -- counting the total of each animal in diet_type 
FROM animals AS a INNER JOIN diets AS d --join in a tibble
ON a.diet_id = d.id 
GROUP BY d.diet_type --group by 


SELECT 
	a.name,
	a.species, 
	a.age,
	d.diet_type
FROM animals AS a INNER JOIN diets AS d 
ON a.diet_id = d.id
WHERE d.diet_type = 'herbivore';

-- "all animals and thier diets if they have a stored diet"

SELECT 
	a.name,
	a.species,
	d.diet_type
FROM animals AS a LEFT JOIN diets AS d
ON a.diet_id = d.id

-- "get all diets plus any details of animals that follow them"


SELECT 
	a.name,
	a.species,
	d.diet_type
FROM animals AS a RIGHT JOIN diets AS d
ON a.diet_id = d.id
	
--"return how many animals follow each diet type
--Including any diet which no animal follows 


SELECT 
	d.diet_type,
	COUNT(a.id)  AS total_diet_type
FROM animals AS a RIGHT JOIN diets AS d 
ON a.diet_id = d.id 
GROUP BY d.diet_type
ORDER BY d.diet_type asc;


SELECT 
	a.*,
	d.*
FROM animals AS a FULL JOIN diets AS d 
ON a.diet_id = d.id 

-- Joins in many-many relationships 
--"each animal is cared for by many keepers,
--and each keeper cares for many animals"


--“Get a rota for the keepers and the animals they
-- look after, ordered first by animal name, and then by day.”

SELECT 
	cs.DAY,
	k.name AS keeper_name
FROM 
	(animals AS a INNER JOIN care_schedule AS cs -- inside bracket produces a table then we make 3rd table
	ON a.id = cs.animal_id) INNER JOIN keepers AS k 
	ON cs.keeper_id = k.id
WHERE a.name ='Ernest'
ORDER BY cs.DAY ;


	
	




