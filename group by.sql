-- Group By --

SELECT gender 
FROM employee_demographics
GROUP BY gender;

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;

SELECT occupation 
FROM employee_salary
GROUP BY occupation;


SELECT occupation,salary
FROM employee_salary
GROUP BY occupation, salary;

