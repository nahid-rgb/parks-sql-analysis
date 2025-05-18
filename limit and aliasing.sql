-- Limit and Aliasing --

SELECT * 
FROM employee_demographics
ORDER BY age DESC
LIMIT 3;

SELECT * 
FROM employee_demographics
ORDER BY age DESC
LIMIT 3,1;


-- Aliasing

SELECT gender , AVG(age) AS Avg_Age
FROM employee_demographics
GROUP BY gender
HAVING Avg_Age>40; 
