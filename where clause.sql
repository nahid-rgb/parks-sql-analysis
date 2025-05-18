-- WHERE CLAUSE 


SELECT * 
FROM employee_salary
WHERE first_name = "Leslie";


SELECT * 
FROM employee_salary
WHERE salary>50000;


SELECT * 
FROM employee_demographics
WHERE gender !="Female";


SELECT * 
FROM employee_demographics
WHERE birth_date>"1987-03-04";

-- AND OR NOT -- Logical Operator 

SELECT * 
FROM employee_demographics
WHERE  birth_date>"1987-03-04" and gender = "Male";


SELECT * 
FROM employee_demographics
WHERE  birth_date>"1987-03-04" OR gender = "Male";

SELECT * 
FROM employee_demographics
WHERE  birth_date>"1987-03-04" OR NOT gender = "Male";


SELECT * 
FROM employee_demographics
WHERE  (first_name = "Leslie" AND last_name ="Knope") OR age>55 ;

-- LIKE STATEMENT --% and _

SELECT * 
FROM employee_demographics
WHERE first_name LIKE "%er%";


SELECT * 
FROM employee_demographics
WHERE first_name LIKE "a%";

SELECT * 
FROM employee_demographics
WHERE first_name LIKE "a___"; 

SELECT * 
FROM employee_demographics
WHERE first_name LIKE "a___%"; 


