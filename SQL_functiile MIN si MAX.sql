--functia MIN & MAX

SELECT
    MIN(life_expect_at_birth) "Life exp."
FROM
    wf_countries;

	
	
SELECT
    MAX(country_name)
FROM
    wf_countries;

	
	
SELECT
    MIN(hire_date)
FROM
    employees;
	
-- more than one group function

SELECT
    MAX(salary),
    MIN(salary),
    MIN(employee_id)
FROM
    employees
WHERE
    department_id = 60;