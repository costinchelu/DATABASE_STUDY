--GROUP BY clause
--folosita pentru despartirea tabelului in grupuri mai mici
--functiile de grup pot rula pe acele categorii separat
SELECT
    department_name,
    department_id,
    round(AVG(salary), 2)
FROM
    departments
    JOIN employees USING ( department_id )
WHERE
    department_id IS NOT NULL
GROUP BY
    department_id,
    department_name
ORDER BY
    AVG(salary) DESC;
	
-- GROUPS within GROUPS
SELECT
    department_id,
    job_id,
    COUNT(*)
FROM
    employees
WHERE
    department_id > 40
GROUP BY
    department_id,
    job_id
ORDER BY
    department_id;
    
--nesting group functions (can be nested to a depth of 2)

SELECT
    round(MAX(AVG(salary)), 2)
FROM
    employees
GROUP BY
    department_id;