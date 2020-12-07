--Set operators: UNION
SELECT                      --first SELECT
    hire_date,
    employee_id,
    job_id
FROM
    employees
UNION
SELECT                       --second SELECT
    TO_DATE(NULL) start_date,
    employee_id,
    job_id
FROM
    job_history
ORDER BY
    employee_id;
    
-- more complex variant:

SELECT
    hire_date,
    employee_id,
    TO_DATE(NULL) start_date,
    TO_DATE(NULL) end_date,
    job_id,
    department_id
FROM
    employees
UNION
SELECT
    TO_DATE(NULL),
    employee_id,
    start_date,
    end_date,
    job_id,
    department_id
FROM
    job_history
ORDER BY
    employee_id;