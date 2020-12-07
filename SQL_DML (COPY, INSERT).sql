--DML (DATA MANIPULATION LANGUAGE)

--COPY (make a copy after a table)
CREATE TABLE copy_employees
    AS
        ( SELECT
            *
        FROM
            employees
        );

-- DESCRIBE (verify and view the copied table)

DESCRIBE copy_employees

SELECT
    *
FROM
    copy_employees;
    
--INSERT (INTO) (add a new row in a table)

INSERT INTO copy_employees (
    employee_id,
    first_name,
    last_name,
    email,
    phone_number,
    hire_date,
    job_id,
    salary,
    manager_id,
    department_id
) VALUES (
    145,
    'Michael',
    'Vargas',
    'MVARGAS',
    '650. 121.2005',
    '10-07-1998',
    'st_clerk',
    3600,
    124,
    50
);
--NULL values can be inserted with '' (2 single quotes), or writing NULL.

--copy many rows from a table to another using a subquery

--insert data with a prompt window:
INSERT INTO copy_employees (
	employee_id,
    first_name,
    last_name,
    email,
    phone_number,
	hire_date
) VALUES (
	'&employee_id',
    '&first_name',
    '&last_name',
    '&email',
    '&phone_number'
	TO_DATE('&hire_date', 'mon dd, yyyy')
);


INSERT INTO sales_reps (
    id,
    name,
    salary,
    commission_pct
)
    SELECT
        employees_id,
        last_name,
        salary,
        commision_pct
    FROM
        employees
    WHERE
        job_id LIKE '%REP%';
        
--copy all rows from one table to another:

INSERT INTO sales_reps
    SELECT
        *
    FROM
        employees;
        
