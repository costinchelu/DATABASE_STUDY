--GROUP BY GROUPING SETS
--multiple GROUP BY in the same SELECT statement
SELECT
    department_id,
    job_id,
    manager_id,
    SUM(salary)
FROM
    employees
WHERE
    department_id < 50
GROUP BY
    GROUPING SETS (
        ( job_id, manager_id ),
        ( department_id, job_id ),
        ( department_id, manager_id )
    );