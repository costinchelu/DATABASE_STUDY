-- example of nested function

SELECT
 employee_id,
    first_name,
    last_name,
    TO_CHAR(next_day(add_months(hire_date, 6), 'Vineri'), 'fmDay, dd mon, YYYY') 
    "Next evaluation"
FROM
    employees
WHERE
    employee_id BETWEEN 80 AND 130;