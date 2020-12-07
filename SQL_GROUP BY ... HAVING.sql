--GROUP BY ... HAVING

SELECT
    department_name,
    department_id,
    MAX(salary)
FROM
    departments
    JOIN employees USING ( department_id )
GROUP BY
    department_name,
    department_id   --grupeaza
HAVING
    COUNT(*) > 2    --apoi selecteaza grupurile cu > 2 angajati/departament
ORDER BY
    department_id;
	
------------	
	
SELECT
    region_id,
    round(AVG(population))
FROM
    wf_countries
GROUP BY
    region_id
HAVING
    MIN(population) > 300000
ORDER BY
    AVG(population) DESC;
    
/*

Recomended order:

SELECT column, group_function
FROM table
[WHERE]
GROUP BY
HAVING
ORDER BY

*/