-- Stored Procedures 


CREATE PROCEDURE large_salaries1()
SELECT *
FROM employee_salary
WHERE salary>=50000;

CALL large_salaries1();


-- ---------------------------------------

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



-- parameter 
DELIMITER $$
CREATE PROCEDURE large_salaries3(employee_id_param INT)
BEGIN
    SELECT salary
    FROM employee_salary
    WHERE employee_id = employee_id_param ;

END $$
DELIMITER ;
CALL large_salaries3(1);




