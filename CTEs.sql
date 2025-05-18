-- Common Table Expression (CTEs)

-- What is the average salary across all genders, based on the average salary within each gender group?
WITH CTE_Example As 
(
SELECT gender, AVG(salary) AS avg_salary, MAX(salary) AS max_salary, MIN(salary) AS min_salary,COUNT(salary) AS salary_count
FROM employee_demographics AS dem 
JOIN employee_salary AS sal 
   ON dem.employee_id = sal.employee_id
GROUP BY gender)

SELECT AVG(avg_salary)
FROM CTE_Example;

-- The above same probelm can be solve using subqueries given below 

SELECT AVg(avg_salary)
FROM   (SELECT gender, AVG(salary) AS avg_salary, MAX(salary) AS max_salary, 
                     MIN(salary) AS min_salary, COUNT(salary) AS salary_count
					 FROM employee_demographics AS dem 
					 JOIN employee_salary AS sal 
							ON dem.employee_id = sal.employee_id
					GROUP BY gender) AS subq ;

-- -----------------------------------------------------------------------------------------------

WITH CTE_Example (Gender, Avg_Salary, Max_Salary, Min_Salary, Salary_Count) AS
(
SELECT gender, AVG(salary), MAX(salary), MIN(salary),COUNT(salary) 
FROM employee_demographics AS dem 
JOIN employee_salary AS sal 
   ON dem.employee_id = sal.employee_id
GROUP BY gender)

SELECT *
FROM CTE_Example;

-- ----------------------------------------------------------------------------------------------------
-- we can perform join using CTEs

WITH CTE_Example1 As 
(
SELECT employee_id, gender, birth_date
FROM employee_demographics 
WHERE birth_date > '1985-01-01'
), 
CTE_Example2 AS 
(
SELECT employee_id,salary
FRom employee_salary
WHERE salary >50000
)

SELECT CTE_Example1.employee_id, gender, birth_date, salary
FROM CTE_Example1 
JOIN CTE_Example2
     ON CTE_Example1.employee_id = CTE_Example2.employee_id ;

