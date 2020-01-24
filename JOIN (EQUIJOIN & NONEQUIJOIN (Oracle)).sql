-- EQUIJOIN (Oracle inner joins)
SELECT
    employees.last_name,
    employees.job_id,
    jobs.job_title
FROM
    employees,
    jobs
WHERE
    employees.job_id = jobs.job_id;
	

	-- Join 3 tables
SELECT
    last_name,
    city
FROM
    employees e,
    departments d,
    locations l
WHERE
    e.department_id = d.department_id AND
    d.location_id = l.location_id;
	
	
-- Oracle Outer Joins
--NONEQUIJOIN (echivalent cu JOIN ON)
SELECT
    last_name,
    salary,
    grade_level,
    lowest_sal,
    highest_sal
FROM
    employees,
    job_grades
WHERE
    ( salary BETWEEN lowest_sal AND highest_sal );
	
	
--echivalent cu LEFT OUTER JOIN (Oracle)
SELECT
    e.last_name,
    d.department_id,
    d.department_name
FROM
    employees e,
    departments d
WHERE
    e.department_id = d.department_id (+); --(+) is for selecting NULL also
	-- there is no equivalent for FULL OUTER JOIN