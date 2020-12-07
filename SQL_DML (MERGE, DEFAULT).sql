--DEFAULT value
CREATE TABLE my_employees (
    hire_date    DATE DEFAULT SYSDATE,
    first_name   VARCHAR2(15),
    last_name    VARCHAR2(15)
);

        --explicit use of DEFAULT

INSERT INTO my_employees (
    hire_date,
    first_name,
    last_name
) VALUES ( DEFAULT,
'Angelina',
'Wright' );

        --implicit use of DEFAULT

INSERT INTO my_employees (
    hire_date,
    first_name,
    last_name
) VALUES (
    'Angelina',
    'Wright'
);
    
--MERGE (INTO) ... (USING) (like update + insert)

MERGE INTO copy_employees c USING employees e 
    ON ( c.employee_id = e.employee_id )
WHEN MATCHED THEN UPDATE 
        SET 
                c.last_name = e.last_name, 
                c.department_id = e.department_id
WHEN NOT MATCHED THEN INSERT 
VALUES (
        e.employee_id,
        e.last_name,
        e.department_id );