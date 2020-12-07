-- NATURAL JOIN
SELECT
    first_name,
    last_name,
    job_id,
    job_title
FROM
    employees
    NATURAL JOIN jobs
WHERE
    department_id > 80;