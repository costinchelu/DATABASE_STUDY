-- ON clause
SELECT
    last_name,
    first_name,
    job_title
FROM
    employees e
    JOIN jobs j ON ( e.job_id = j.job_id )
ORDER BY
    last_name;
	
	
-- joining 2 tables that has no common column	
	SELECT
    last_name,
    salary,
    grade_level,
    lowest_sal
FROM
    employees
    JOIN job_grades ON ( salary BETWEEN lowest_sal AND highest_sal );
	
	
	-- joining 3 tables
SELECT
    last_name "Nume",
    department_name   "Departament",
    city "Oras"
FROM
    employees
    JOIN departments USING ( department_id )
    JOIN locations USING ( location_id );