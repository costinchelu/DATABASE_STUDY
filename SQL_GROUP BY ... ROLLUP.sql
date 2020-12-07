--GROUP BY ... ROLLUP
--creates subtotals and grand total
SELECT
    department_id,
    job_id,
    SUM(salary)
FROM
    employees
WHERE
    department_id < 50
GROUP BY
    ROLLUP(department_id,
           job_id);