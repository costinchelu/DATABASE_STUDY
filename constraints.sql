--CONSTRAINTS
----primary key
----foreign key
----unique
----not null
----check

--constraint names are written after CONSTRAINT keyword
--example of column level constraint:
CREATE TABLE clients (
    client_number   NUMBER(4)
        CONSTRAINT client_num_pk PRIMARY KEY,
    last_name       VARCHAR2(13)
        CONSTRAINT client_l_name_nn NOT NULL,
    email           VARCHAR2(80)
        CONSTRAINT client_email_uk UNIQUE
);

--example of table level constraint:
CREATE TABLE clients (
    client_number   NUMBER(5) NOT NULL, --default sys constraint name
    first_name      VARCHAR2(20),
    last_name       VARCHAR2(20),
    phone           VARCHAR2(20),
    email           VARCHAR2(20) NOT NULL,
    region          VARCHAR2(20),
    CONSTRAINT client_uk_phone_email UNIQUE ( phone,
                                              email ),
    CONSTRAINT region_loc_fk FOREIGN KEY (region)
        REFERENCES locations(region_name)
);
--NOT NULL constraints cannot be set at the table level
--all table level constraints must be named
--composite unique contraints are defined at table level
/*
referential-integrity constraint = a primary-key value
can exists without a coresponding foreign-key value
but a foreign-key must have a coresponding primary key

we have to first define a primary key before creating a
foreign key in the child table
*/

--ON DELETE CASCADE = automatically deletetes coresponding
--PK, when an FK is deleted
CREATE TABLE copy_employees (
    employee_id     NUMBER(6, 0)
        CONSTRAINT copy_emp_pk PRIMARY KEY,
    first_name      VARCHAR2(20),
    last_name       VARCHAR2(20),
    department_id   NUMBER(4, 0),
    email           VARCHAR2(25),
    CONSTRAINT cdept_dep_id_fk FOREIGN KEY ( department_id )
        REFERENCES copy_departments ( department_id )
        ON DELETE CASCADE
);
--rather than having the rowsin the child table deleted when
-- using ON DELETE CASCADE option, the child rows can be filled
--with NULL values using ON DELETE SET NULL option.

--CHECK constraint example:
CREATE TABLE copy_job_history (
    employee_id     NUMBER(6),
    start_date      DATE,
    end_date        DATE,
    job_id          VARCHAR2(10),
    department_id   NUMBER(4),
    CONSTRAINT cjhist_emp_id_stdate_pk 
        PRIMARY KEY ( employee_id,
                      start_date ),
    CONSTRAINT cjhist_enddate_ck 
        CHECK ( end_date > start_date )
);
--in this case checking that end date is set later than
--start date. There is no limit on the number of check
--constraints. Can also be defined at column level:
salary NUMBER(8, 2) CONSTRAINT emp_min_sal_ck 
	CHECK (salary > 0),
	
-------------MANAGING CONSTRAINTS-------------

--example adding a constraint after a table is created:
ALTER TABLE employees
ADD CONSTRAINT emp_id_pk 
	PRIMARY KEY (employee_id);

ALTER TABLE employees
ADD CONSTRAINT emp_dep_fk
	FOREIGN KEY (department_id) REFERENCES departments (department_id)
	ON DELETE CASCADE;
	
--NOT NULL constraints can be added only if the table is 
--empty or if the column contains values for every row.
--NOT NULL is used with ALTER TABLE-MODIFY
ALTER TABLE employees
MODIFY (email CONSTRAINT emp_email_nn NOT NULL);

--DROPping constraints is used by knowing constraint name:
ALTER TABLE departments 
DROP CONSTRAINT dep_depid_pk CASCADE;
--CASCADE is used because this PK has a link to a FK in
--employees table, and the FK will also be dropped


--disabling a constraint is simply switching off that constraint:
CREATE TABLE copy_employees (
    employee_id   NUMBER(6, 0) PRIMARY KEY DISABLE);

ALTER TABLE copy_employees 
DISABLE CONSTRAINT c_emp_dep_id_fk;

ALTER TABLE copy_departments 
DISABLE CONSTRAINT c_dep_dep_id_pk CASCADE;


--enabling constraints can be used both in CREATE TABLE and ALTER TABLE:
ALTER TABLE copy_departments
ENABLE CONSTRAINT c_dep_dep_id_pk;

--about CASCADE:
--if a CASCADE CONSTRAINT option is not included, any attempt
--to drop a PK or multicolumn constraint will fail.
--We can't delete a parent value if child values exists in other tables
ALTER TABLE departments
DROP ( department_id ) CASCADE CONSTRAINTS;


--to view all constraints on a table, 
--query the USER_CONSTRAINTS table
SELECT
    table_name,
    constraint_name,
    constraint_type,
    status
FROM
    user_constraints
WHERE
    table_name IN ( 'DEPARTMENTS', 'EMPLOYEES');
/*
constraint type:
P = primary key
R = references (foreign key)
C = check (including NOT NULL)
U = unique
*/