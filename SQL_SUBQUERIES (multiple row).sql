--Multiple-Row Subqueries

        --IN
SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
    EXTRACT(YEAR FROM hire_date) IN (       --EXTRACT (extract DD MM YYYY from the data type)
        SELECT
            EXTRACT(YEAR FROM hire_date)
        FROM
            employees
        WHERE
            department_id = 90
    );
	
		--ANY
SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
    EXTRACT(YEAR FROM hire_date) < ANY (
        SELECT
            EXTRACT(YEAR FROM hire_date)
        FROM
            employees
        WHERE
            department_id = 90
    );
    
		--ALL
    
SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
    EXTRACT(YEAR FROM hire_date) < ALL (
        SELECT
            EXTRACT(YEAR FROM hire_date)
        FROM
            employees
        WHERE
            department_id = 90
    );
	
	
-- GROUP BY ... HAVING with multi-row subqueries

		-- find the departments whose minimum salary is less than the salary
		-- of any employee who works in department 10 or 20
		-- (we need to group the outer query by department_id)
SELECT
    department_id,
    MIN(salary)
FROM
    employees
GROUP BY
    department_id
HAVING
    MIN(salary) < ANY (
        SELECT
            salary
        FROM
            employees
        WHERE
            department_id IN (
                10,
                20
            )
    )
ORDER BY
    department_id;