# 🏞️ Parks and Recreation SQL Project

This project involves analyzing employee details, job roles, salaries, and department information in the fictional Parks and Recreation department using SQL queries.

---

## 📊 Dataset Overview

The dataset includes the following tables:

- **employee_demographics**: Contains personal information about employees, such as age, gender, and date of birth.
- **employee_salary**: Stores job-related data including occupation, salary, and department assignment.
- **parks_departments**: Holds information about various city departments like Parks and Recreation, Healthcare, Finance, etc.

---

## 🔍 Exploring the Dataset

```sql
SELECT * FROM employee_demographics; -- 11 rows  
SELECT * FROM employee_salary;       -- 12 rows  
SELECT * FROM parks_departments;     -- 6 rows  

**1. Basic SQL Queries**
*Selected specific columns (SELECT)
*Used DISTINCT to filter unique values
```sql
SELECT first_name, last_name,birth_date FROM employee_demographics;
SELECT DISTINCT first_name FROM employee_demographics;
SELECT DISTINCT first_name, gender FROM employee_demographics;
SELECT first_name, last_name, age , age+10 FROM employee_demographics;

**2.WHERE Clause**
*Practiced conditional filters using WHERE, AND, OR, NOT, and pattern matching with LIKE.
```sql
-- WHERE clause filters
SELECT * FROM employee_salary WHERE first_name = "Leslie";
SELECT * FROM employee_salary WHERE salary > 50000;
SELECT * FROM employee_demographics WHERE gender != "Female";
SELECT * FROM employee_demographics WHERE birth_date > "1987-03-04";

-- AND, OR, NOT
SELECT * FROM employee_demographics WHERE birth_date > "1987-03-04" AND gender = "Male";
SELECT * FROM employee_demographics WHERE birth_date > "1987-03-04" OR gender = "Male";
SELECT * FROM employee_demographics WHERE birth_date > "1987-03-04" OR NOT gender = "Male";
SELECT * FROM employee_demographics WHERE (first_name = "Leslie" AND last_name = "Knope") OR age > 55;

-- LIKE patterns
SELECT * FROM employee_demographics WHERE first_name LIKE "%er%";
SELECT * FROM employee_demographics WHERE first_name LIKE "a%";
SELECT * FROM employee_demographics WHERE first_name LIKE "a___";
SELECT * FROM employee_demographics WHERE first_name LIKE "a___%";

**3.Aggregate Functions & GROUP BY**
*Used AVG(), MAX(), MIN(), COUNT() for summaries.Grouped data using GROUP BY.Filtered groups using HAVING
```sql
SELECT gender FROM employee_demographics GROUP BY gender;
SELECT gender, AVG(age) FROM employee_demographics GROUP BY gender;
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age) FROM employee_demographics GROUP BY gender;
SELECT occupation FROM employee_salary GROUP BY occupation;
SELECT occupation,salary FROM employee_salary GROUP BY occupation, salary;

**4.LIMIT and Aliasing**
*Used aliases to rename columns and LIMIT to restrict output.
```sql
-- LIMIT
SELECT * FROM employee_demographics ORDER BY age DESC LIMIT 3;
SELECT * FROM employee_demographics ORDER BY age DESC LIMIT 3,1;

-- Aliasing
SELECT gender , AVG(age) AS Avg_Age FROM employee_demographics GROUP BY gender HAVING Avg_Age>40;

**5.JOINS**
*Practiced joining tables using INNER, LEFT, RIGHT, and SELF JOIN to combine information.
```sql
SELECT dem.employee_id, age, occupation FROM employee_demographics AS dem INNER JOIN employee_salary AS sal ON dem.employee_id = sal.employee_id;
-- OUTER JOIN --
-- (LEFT JOIN)-- 
SELECT * FROM employee_demographics AS dem LEFT JOIN employee_salary AS sal ON dem.employee_id = sal.employee_id;
   
-- RIGHT JOIN --   
SELECT * FROM employee_demographics AS dem RIGHT JOIN employee_salary AS sal ON dem.employee_id = sal.employee_id;

-- SELF JOIN    
SELECT sal1.employee_id  AS sal_secret_agent, sal1.first_name AS first_name_secret_agent, sal1.last_name AS last_name_secret_agent, 
sal2.employee_id  AS sal_secret_agent,  sal2.first_name AS first_name_secret_agent, sal2.last_name AS last_name_secret_agent 
FROM employee_salary AS sal1 JOIN employee_salary AS sal2 ON sal1.employee_id+1 = sal2.employee_id;
    
-- JOINING MULTIPLE TABLES TOGETHER 
SELECT * FROM employee_demographics AS dem INNER JOIN employee_salary AS sal ON dem.employee_id = sal.employee_id INNER JOIN  parks_departments AS pd ON sal.dept_id = pd.department_id;
SELECT * FROM parks_departments;

**6.UNIONS**
*Merged results from multiple tables
```sql
SELECT first_name, last_name
FROM employee_demographics
UNION DISTINCT -- by default union is distinct
SELECT first_name, last_name
FROM employee_salary;

SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary;

SELECT first_name, last_name, "Old Man" AS Label
FROM employee_demographics
WHERE age > 40 AND gender = "Male"
UNION
SELECT first_name, last_name, "Old Lady" AS Label
FROM employee_demographics
WHERE age > 40 AND gender = "Female"
UNION
SELECT first_name, last_name, "Highly Paid Employee" AS Label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name;

**7.String Functions**
*Used functions like LENGTH(), UPPER(), REPLACE(), and CONCAT() for string manipulation
```sql
SELECT first_name, LENGTH(first_name) AS Name_Length FROM employee_demographics ORDER BY Name_Length;
SELECT first_name, LENGTH(first_name) AS Name_Length FROM employee_demographics ORDER BY Name_Length;
SELECT first_name, UPPER(first_name) FROM employee_demographics ORDER BY first_name;
SELECT first_name, LENGTH(first_name) AS Name_Length FROM employee_demographics ORDER BY Name_Length;
SELECT TRIM(" SQL ");
SELECT LTRIM(" SQL "); -- Left trim
SELECT RTRIM(" SQL "); -- Right trim
SELECT first_name, LEFT(first_name,4), RIGHT(first_name,4), SUBSTRING(first_name, 3,2), SUBSTRING(birth_date, 6,2) AS birth_month FROM employee_demographics;
SELECT first_name, REPLACE(first_name, 'a','z') FROM employee_demographics;
SELECT first_name, LOCATE('An',first_name) FROM employee_demographics;
SELECT first_name, last_name, CONCAT(first_name,' ',last_name) AS Full_Name FROM employee_demographics;

**8.CASE Statement**
*
```sql
SELECT first_name, last_name,age,
CASE 
  WHEN age <= 30 THEN 'Young'
  WHEN age BETWEEN 31 and 50 THEN 'Old'
  WHEN age >=50 THEN "On Death's Door"
END AS Age_Measure
FROM employee_demographics;

-- pay Increase and Bonus 
-- <50000 = 5% 
-- >50000 = 7%
-- Finance = 10% bonus
SELECT first_name,last_name,salary,
CASE 
    WHEN salary <50000 THEN salary * 1.05
    WHEN salary > 50000 THEN salary * 1.07
END AS New_Salary,
CASE 
    WHEN dept_id = 6 THEN salary * .10
END AS Bonus
FROM employee_salary;

**9.SUBQUERIES**
*Filtered records based on subquery results for advanced analysis.
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

**10.Window Functions**
* Learned advanced analytics using ROW_NUMBER() and OVER().
```sql
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

**11.TEMPORARY Tables**
*Created temporary tables for storing intermediate results.
```sql
-- First way to create a temporary table
CREATE TEMPORARY TABLE temp_table (first_name varchar(50), last_name varchar (50),favourite_Movie varchar(100));
INSERT INTO temp_table VALUES("Nahid","Rahman","Sons of Anarchy");
SELECT * FROM temp_table;

-- 2nd way to create a temporary table 
CREATE TEMPORARY TABLE salary_over_50k SELECT * FROM employee_salary WHERE salary>=50000;
SELECT * FROM salary_over_50k;

**12.Stored Procedures**
*Learned to create and call stored procedures, with and without parameters.
```sql
CREATE PROCEDURE large_salaries1() SELECT * FROM employee_salary WHERE salary>=50000;
CALL large_salaries1();

-- Withou parameter
DELIMITER $$
CREATE PROCEDURE large_salaries2()
BEGIN
    SELECT *
    FROM employee_salary
    WHERE salary >= 50000;
    SELECT *
    FROM employee_salary
    WHERE salary >= 10000;
END $$
DELIMITER ;
CALL large_salaries2();

--With parameter 
DELIMITER $$
CREATE PROCEDURE large_salaries3(employee_id_param INT)
BEGIN
    SELECT salary
    FROM employee_salary
    WHERE employee_id = employee_id_param ;
END $$
DELIMITER ;
CALL large_salaries3(1);

**13.TRIGGERS & EVENTS**
* Automatically updated records using AFTER INSERT trigger.
*Scheduled automatic tasks using SQL events.
```sql
-- TRIGGERS
DELIMITER $$
CREATE TRIGGER employee_insert
      AFTER INSERT ON employee_salary 
      FOR EACH ROW 
BEGIN 
     INSERT INTO employee_demographics(employee_id,first_name,last_name)
     VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;
INSERT INTO employee_salary(employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES(13, "Virat", "kohli", "Crickter", 500000, NULL);
INSERT INTO employee_salary(employee_id, first_name, last_name,occupation,salary,dept_id)
VALUES(14,"Mahfujur","Rahman", "Data Analyst", 45000, NULL);

-- EVENTS
DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND 
DO 
BEGIN
     DELETE
     FROM employee_demographics
     WHERE age >= 60;
END $$
DELIMITER ;
SHOW VARIABLES LIKE 'event%';





