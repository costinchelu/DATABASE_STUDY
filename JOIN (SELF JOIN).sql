-- SELF joining

SELECT
    worker.last_name || ' works for ' || manager.last_name "Works for"
FROM
    employees worker
    JOIN employees manager 
        ON ( worker.manager_id = manager.employee_id );
		
/*
to join a table to itself, the table is given two names or aliases;
this will make the database "think" that there are two tables.

manager_id in the worker table is equal to employee_id in the manager table.
*/

SELECT
        worker.manager_id "Manager ID",
        worker.last_name "Worker name",
        manager.last_name   "Manager name"
FROM
    employees worker
    JOIN employees manager 
        ON ( worker.manager_id = manager.employee_id );