-- LEFT, RIGHT & FULL OUTER Joins

-- LEFT (shows every employee - even without assignment)
SELECT
    e.last_name,
    d.department_id,
    d.department_name
FROM
    employees e
    LEFT OUTER JOIN departments d ON ( e.department_id = d.department_id );

	

-- RIGHT (shows every department - even without employees)
	SELECT
    e.last_name,
    d.department_id,
    d.department_name
FROM
    employees e
    RIGHT OUTER JOIN departments d ON ( e.department_id = d.department_id );
	
	
	
-- FULL (shows every occurence including those with NULL values)		
	SELECT
    e.last_name,
    d.department_id,
    d.department_name
FROM
    employees e
    FULL OUTER JOIN departments d ON ( e.department_id = d.department_id )
    ORDER BY department_id;
	
	
-- example using OUTER JOIN
SELECT
    last_name,
    e.job_id    "current job",
    jh.job_id   "old jobs",
    end_date
FROM
    employees e
    LEFT OUTER JOIN job_history jh ON ( e.employee_id = jh.employee_id )
ORDER BY
   jh.job_id NULLS LAST;