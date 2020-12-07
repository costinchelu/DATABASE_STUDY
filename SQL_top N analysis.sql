SELECT
    ROWNUM AS "Longest employed",
    last_name,
    hire_date
FROM
    employees
WHERE
    ROWNUM <= 5
ORDER BY
    hire_date;
	
	-- OR
	
	
SELECT
    ROWNUM AS "Longest employed",
    last_name,
    hire_date
FROM
    (
        SELECT
            last_name,
            hire_date
        FROM
            employees
        ORDER BY
            hire_date
    )
WHERE
    ROWNUM <= 10;
	
	
-- if we want newest employees:

SELECT
    ROWNUM AS "Newest employed",
    last_name,
    hire_date
FROM
    (
        SELECT
            last_name,
            hire_date
        FROM
            employees
        ORDER BY
            hire_date DESC
    )
WHERE
    ROWNUM <= 10;
	