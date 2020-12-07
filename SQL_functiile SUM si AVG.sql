--functia SUM, AVG, NVL
SELECT
    SUM(area) "Aria totala (km^2)"
FROM
    wf_countries
WHERE
    region_id = 29;

SELECT
    round(AVG(salary), 1) "Media salariului ($)"
FROM
    employees
WHERE
    department_id = 90;
	
--NVL include in expresie(calcul) inclusiv valorile NULL

