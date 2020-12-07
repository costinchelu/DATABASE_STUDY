/* using rules of precedence */

SELECT
    last_name || ' ' || salary * 1.05 "Employee Raise",
    department_id,
    first_name
FROM
    employees
WHERE
    department_id IN (
        50,
        80
    ) AND
    first_name LIKE 'C%' OR
    last_name NOT LIKE '%s';

/* works differently from: */

SELECT
    department_id,
    first_name,
    last_name, salary * 1.05 "Employee Raise"
FROM
    employees
WHERE
    department_id IN (
        50,
        80
    ) OR
    first_name LIKE 'C%' AND
    last_name LIKE '%s';
	
	/* where all employees in departments 50, 80 are selected. In this case, OR doesn't have a purpose */