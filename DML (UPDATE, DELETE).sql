--UPDATE statement

				--example changing one line's phone number
UPDATE copy_employees
SET
    phone_number = '123456'
WHERE
    employee_id = 200;

				--example changing several lines or columns

UPDATE copy_employees
SET
    salary = '2800',
    commission_pct = '0,1'
WHERE
    employee_id IN 
		( 143,
		  144 );

				--updating a column with a value from a subquery 
				--(value from e_id 100 to 101)

UPDATE copy_employees
SET
    salary = (
        SELECT
            salary
        FROM
            copy_employees
        WHERE
            employee_id = 100
    )
WHERE
    employee_id = 101;


				--example with two subqueries

UPDATE copy_employees
SET
    salary = (
        SELECT
            salary
        FROM
            copy_employees
        WHERE
            employee_id = 144
    ),
    job_id = (
        SELECT
            job_id
        FROM
            copy_employees
        WHERE
            employee_id = 144
    )
WHERE
    employee_id = 145;
			--we can also copy information from one table to another

--ALTER statement
ALTER TABLE copy_employees ADD (
    department_name   VARCHAR2(30));

UPDATE copy_employees e
SET
    e.department_name = (
        SELECT
            d.department_name
        FROM
            departments d
        WHERE
            e.department_id = d.department_id
    );
	
--DELETE (removes rows)
DELETE FROM copy_employees
WHERE
    department_id = (
        SELECT
            department_id
        FROM
            departments
        WHERE
            department_name = 'Shipping'
    );
	

			-- more complex example:
DELETE FROM copy_employees e
WHERE e.manager_id IN 
                ( SELECT d.manager_id
                   FROM employees d
                   HAVING COUNT(d.department_id) < 2
                   GROUP BY d.manager_id );
