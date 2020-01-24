-- functia NVL
SELECT
    country_name         "Tara",
   NVL( internet_extension, 'Nu are')   "Adresa"
FROM
    wf_countries
WHERE
    location = 'Southern Africa'
ORDER BY
    internet_extension DESC;
	
-- functia NVL2

SELECT
    last_name,
    salary,
    NVL2(commission_pct, salary + (salary * commission_pct), salary) "Income"
FROM
    employees
WHERE
    department_id IN (
        80,
        90
    );
