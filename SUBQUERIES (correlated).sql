-- Correlated  Subqueries (row-by-row processing)
-- Whose salary is higher than the average salary of their department?
SELECT
    o.department_id,
    o.first_name,
    o.last_name,
    o.salary
FROM employees o
WHERE o.salary > (
        SELECT AVG(i.salary)
        FROM employees i
        WHERE i.department_id = o.department_id
    );
	