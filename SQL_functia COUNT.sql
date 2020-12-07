-- functia count (merge pe valori numerice , dar si tip data sau string)
--determina numarul de randuri non NULL
SELECT
    COUNT(employee_id)
FROM
    employees; -- numarul de angajati

SELECT
    COUNT(*)    
FROM
    employees
WHERE
    hire_date < '01-01-1996';
/* 
numara toate randurile(inclusiv duplicate) precum si cele 
care ar putea avea NULL in una sau mai multe coloane
*/