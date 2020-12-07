--GROUPING functions
--takes a column as argument
--returns 1 for a computed row
--returns 0 for a returned row
SELECT
    department_id,
    job_id,
    SUM(salary),
    GROUPING(department_id) "Dept. sub total",
    GROUPING(job_id) "Job sub total"
FROM
    employees
WHERE
    department_id < 50
GROUP BY
    CUBE(department_id,
         job_id);