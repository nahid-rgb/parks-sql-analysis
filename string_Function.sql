-- String Function 

SELECT first_name, LENGTH(first_name) AS Name_Length
FROM employee_demographics
ORDER BY Name_Length;

SELECT first_name, LENGTH(first_name) AS Name_Length
FROM employee_demographics
ORDER BY Name_Length;

SELECT first_name, UPPER(first_name)
FROM employee_demographics
ORDER BY first_name;

SELECT first_name, LENGTH(first_name) AS Name_Length
FROM employee_demographics
ORDER BY Name_Length;


SELECT TRIM(" SQL ");
SELECT LTRIM(" SQL "); -- Left trim
SELECT RTRIM(" SQL "); -- Right trim


SELECT first_name, 
LEFT(first_name,4),
RIGHT(first_name,4), 
SUBSTRING(first_name, 3,2),
SUBSTRING(birth_date, 6,2) AS birth_month
FROM employee_demographics;


SELECT first_name, REPLACE(first_name, 'a','z')
FROM employee_demographics;


SELECT first_name, LOCATE('An',first_name)
FROM employee_demographics;


SELECT first_name, last_name,
CONCAT(first_name,' ',last_name) AS Full_Name
FROM employee_demographics;
