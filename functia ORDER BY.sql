/* ORDER BY example */

SELECT
    first_name || ' ' || last_name "Numele",
    hire_date   "Data inceput"
FROM
    employees
WHERE
    employee_id <= 105
ORDER BY
    department_id, last_name DESC;