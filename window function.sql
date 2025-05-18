-- Window Function 

-- This is group by 
SELECT gender, AVG(salary) avg_salary
FROM employee_demographics AS dem
JOIN employee_salary AS sal
    ON dem.employee_id = sal.employee_id
GROUP BY gender;


-- Instead of group by we can use window function for more details that is given below 
SELECT dem.first_name,dem.last_name,gender, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics AS dem 
JOIN employee_salary AS sal 
   ON dem.employee_id = sal.employee_id;
   
 
/*OVER(PARTITION BY gender) means ->Calculate the average salary for each 
gender group, but keep every individual row */


SELECT dem.first_name, dem.last_name, gender,salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_Total 
FROM employee_demographics AS dem 
JOIN employee_salary AS sal
  ON dem.employee_id = sal.employee_id;


/*OVER() lets  apply functions like SUM(), AVG(), ROW_NUMBER() without collapsing 
rows — it keeps all rows and adds calculated values alongside them.
*/
-- ---------------------------------------------------------------
SELECT dem.employee_id,dem.first_name, dem.last_name, gender,salary,
ROW_NUMBER() OVER()  
FROM employee_demographics AS dem 
JOIN employee_salary AS sal
  ON dem.employee_id = sal.employee_id;


SELECT dem.employee_id,dem.first_name, dem.last_name, gender,salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS dense_rank_num
FROM employee_demographics AS dem 
JOIN employee_salary AS sal
  ON dem.employee_id = sal.employee_id;

-- ROW_NUMBER(): assigns a unique row number within each gender group, even if salaries tie
-- RANK(): assigns the same rank to tied salaries but skips the next rank(s)
-- DENSE_RANK(): assigns the same rank to tied salaries but does NOT skip any ranks