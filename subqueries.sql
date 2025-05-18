-- Subqueries 
-- Retrieve all personal information of employees who work in the Parks and Recreation department.
SELECT * 
FROM employee_demographics
WHERE employee_id IN 
                  (SELECT employee_id
                    FROM employee_salary
                    WHERE dept_id = 1);

-- -----------------------------------------------------------------------------------------------
SELECT first_name, last_name, salary, AVG(salary) -- Every column in SELECT must be in GROUP BY or be inside an aggregate function.
FROM employee_salary
GROUP BY first_name, last_name,salary;


SELECT first_name , salary,
     (SELECT AVG(salary) FROM employee_salary)
FROM employee_salary;


SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;


SELECT  AVG(max_AGE)
FROM 
(SELECT gender, 
        AVG(age) AS avg_Age,
        MAX(age) AS max_Age, 
        MIN(age) AS min_Age, 
        COUNT(age) AS age_Count
        FROM employee_demographics 
        GROUP BY gender) AS Agg_table  ;     -- Every derived table must have its own alias
        
        
