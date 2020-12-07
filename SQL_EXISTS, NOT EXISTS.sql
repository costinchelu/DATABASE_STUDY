-- EXISTS & NOT EXISTS
-- Which employees are not managers?
-- to answer we have to analize who is a manager and then who is not
SELECT
    last_name   "Not a Manager"
FROM
    employees emp
WHERE
    NOT EXISTS (
        SELECT *
        FROM
            employees mgr
        WHERE
            mgr.manager_id = emp.employee_id
    );