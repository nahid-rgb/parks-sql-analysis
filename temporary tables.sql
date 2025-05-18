-- Temporary Tables 

-- First way to create a temporary table
CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
 last_name varchar (50),
 favourite_Movie varchar(100)
);


INSERT INTO temp_table
VALUES("Nahid","Rahman","Sons of Anarchy");

SELECT *  
FROM temp_table;

-- 2nd way to create a temporary table 

CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary>=50000;

SELECT * 
FROM salary_over_50k;




