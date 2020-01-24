--subquery example
SELECT
    first_name,
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date > (
        SELECT
            hire_date
        FROM
            employees
        WHERE
            last_name = 'Vargas'
    )
ORDER BY
    hire_date;
	
	------------------------------
	
SELECT
    last_name,
    job_id,
    department_id
FROM
    employees
WHERE
    department_id = (
        SELECT
            department_id
        FROM
            departments
        WHERE
            department_name = 'Marketing'
    )
ORDER BY
    job_id;
		
	------------------------------
	
--subqueries from different tables
SELECT
    last_name,
    job_id,
    salary,
    department_id
FROM
    employees
WHERE
    job_id = (
        SELECT
            job_id
        FROM
            employees
        WHERE
            employee_id = 141
    ) AND
    department_id = (
        SELECT
            department_id
        FROM
            departments
        WHERE
            location_id = 1500
    )
ORDER BY
    last_name;
	
	------------------------------
	
--Which employees earn less than the average salary?
SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary < (
        SELECT
            AVG(salary)
        FROM
            employees
    )
ORDER BY
    salary DESC;
		
	------------------------------
	
--Which departments have lowest salary 
--that is greater than the lowest salary in department 50?
SELECT
    department_id,
    MIN(salary)
FROM
    employees
GROUP BY
    department_id
HAVING
    MIN(salary) > (
        SELECT
            MIN(salary)
        FROM
            employees
        WHERE
            department_id = 50
    )
ORDER BY
    min(salary);