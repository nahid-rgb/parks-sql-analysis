-- joins 

SELECT * 
FROM employee_demographics;

SELECT * 
FROM employee_salary;


-- INNER JOIN --

SELECT dem.employee_id, age, occupation 
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
   ON dem.employee_id = sal.employee_id;


-- OUTER JOIN --
-- (LEFT JOIN)-- 

SELECT *
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal
   ON dem.employee_id = sal.employee_id;
   
-- RIGHT JOIN --   
SELECT *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
   ON dem.employee_id = sal.employee_id;   
   
   
   
-- SELF JOIN    

SELECT sal1.employee_id  AS sal_secret_agent, 
sal1.first_name AS first_name_secret_agent, 
sal1.last_name AS last_name_secret_agent, 

sal2.employee_id  AS sal_secret_agent, 
sal2.first_name AS first_name_secret_agent, 
sal2.last_name AS last_name_secret_agent 

FROM employee_salary AS sal1
JOIN employee_salary AS sal2
    ON sal1.employee_id+1 = sal2.employee_id;
    
    
-- JOINING MULTIPLE TABLES TOGETHER 


SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
   ON dem.employee_id = sal.employee_id
INNER JOIN  parks_departments AS pd
   ON sal.dept_id = pd.department_id;
   
SELECT * 
FROM parks_departments;
