SELECT
    e.last_name,
    e.salary,
    e.department_id,
    d.maxsal
FROM
    employees  e,
    ( SELECT
            department_id,
            MAX(salary) maxsal
        FROM
            employees
        GROUP BY
            department_id )          d
WHERE
        e.department_id = d.department_id
    AND e.salary = d.maxsal;