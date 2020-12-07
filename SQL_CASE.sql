-------- CASE

SELECT
    last_name,
    CASE department_id
        WHEN 90   THEN 'Management'
        WHEN 80   THEN 'Sales'
        WHEN 60   THEN 'IT'
        ELSE 'Other departments'
    END "Department"
FROM
    employees;
	
	
-- ORACLE syntax
SELECT 
	last_name,
	DECODE (department_id,
		90, 'Management',
		80, 'Sales',
		60, 'IT',
		'Other departments') 
AS "Department"
FROM employees;
		
