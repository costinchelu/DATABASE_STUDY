--GROUP BY ...CUBE
--produces cross-tabulation reports

SELECT
    department_id,
    job_id,
    SUM(salary)
FROM
    employees
WHERE
    department_id < 60
GROUP BY
    CUBE(department_id,
         job_id);
--subtotals for dept_id, subtotals for job_id, grand total