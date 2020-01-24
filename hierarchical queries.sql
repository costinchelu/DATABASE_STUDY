-- Hierarchical Queries
SELECT
    employee_id,
    last_name,
    job_id,
    manager_id
FROM
    employees
START WITH
    employee_id = 100
CONNECT BY
    PRIOR employee_id = manager_id;

--or

SELECT
    last_name || ' reports to ' || PRIOR last_name "Ierarhie in jos"
FROM
    employees
START WITH
    last_name = 'King'
CONNECT BY
    PRIOR employee_id = manager_id;
	
	--------------------------------------
	
-- LEVEL

SELECT
    level,
    last_name || ' reports to ' || PRIOR last_name "Ierarhie in jos"
FROM
    employees
START WITH
    last_name = 'King'
CONNECT BY
    PRIOR employee_id = manager_id
ORDER BY
    ( level );
	
-- example query report (top-down)
	
SELECT
    lpad(last_name, length(last_name) +(level * 4) - 2, '_') "Organisational Chart"
FROM
    employees
START WITH
    last_name = 'King'
CONNECT BY
    PRIOR employee_id = manager_id;
	
	
	
-- example query report (bottom-up)
	
SELECT
    lpad(last_name, length(last_name) +(level * 4) - 2, '_') "Organisational Chart"
FROM
    employees
START WITH
    last_name = 'Grant'
CONNECT BY
    employee_id = PRIOR manager_id;
	

	
-- pruning (removing an employee from chart)
	
SELECT
    lpad(last_name, length(last_name) +(level * 4) - 2, '_') "Organisational Chart"
FROM
    employees
START WITH
    last_name = 'Kochhar'
CONNECT BY
    employee_id = PRIOR manager_id
    AND last_name != 'Higgins';