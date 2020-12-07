-- Multiple-Column  Subqueries

--pair-wise subquery:
--selects employees whose manager and departments
--are the same as the manager and department of employees 149 or 174
SELECT
    employee_id,
    manager_id,
    department_id
FROM
    employees
WHERE ( manager_id, department_id ) IN
            ( SELECT manager_id, department_id
                FROM employees
                WHERE employee_id IN 
                ( 149, 174 )) 
AND employee_id NOT IN ( 149, 174 );
    
    -- non pair-wise multiple-column subquery
SELECT
    employee_id,
    manager_id,
    department_id
FROM
    employees
WHERE manager_id IN
            ( SELECT manager_id
                FROM employees
                WHERE employee_id IN 
                ( 149, 174 )) 
AND department_id IN
            ( SELECT department_id
                FROM employees
                WHERE employee_id IN
                (149,174))
AND employee_id NOT IN (149,174);