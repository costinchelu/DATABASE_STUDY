/*
						Statements in PL/SQL:

- SELECT

A DML statement within a PL/SQL block can modify many rows 
(unlike a SELECT statement, which must read exactly one row).

- INSERT INTO .... VALUES
- DELETE FROM ....
- UPDATE .... SET ....
- MERGE INTO .... WHEN MATCHED THEN UPDATE SET ....

- COMMIT
- ROLLBACK
- SAVEPOINT


DDL & DCL cannot be used directly in PL/SQL 
(because they are constructed & executed at runtime)
- CREATE TABLE
- ALTER TABLE
- DROP TABLE

- GRANT
- REVOKE
*/


-- return sum of salaries of all employees from dept. no 60
SET SERVEROUTPUT ON;

DECLARE
    v_sum_sal   employees.salary%TYPE;
    v_deptno    NUMBER NOT NULL := 60;
BEGIN
    SELECT
        SUM(salary)
    INTO v_sum_sal
    FROM
        employees
    WHERE
        department_id = v_deptno;

    dbms_output.put_line('Dep #60 total salary costs: ' || v_sum_sal);
END;

/*
Group functions cannot be used directly in PL/SQL syntax.
For example, the following code does not work:

v_sum_sal := SUM(employees.salary);

Group functions must be part of a SQL statement within a PL/SQL block.
*/



-- update clause modifying several rows
DECLARE
    v_sal_increase employees.salary%TYPE := 800;
BEGIN
    UPDATE copy_temp
    SET
        salary = salary + v_sal_increase
    WHERE
        job_id = 'ST_CLERK';

END;

--delete example
DECLARE
    v_dept_no employees.department_id%TYPE := 10;
BEGIN
    DELETE FROM copy_emp
    WHERE
        department_id = v_dept_no;

END;

-- merge example
BEGIN	
	MERGE INTO copy_emp c USING employees e
		ON (e.employee_id = c.employee_id)
	WHEN MATCHED THEN
		UPDATE SET
			c.first_name = e. first_name,
			c.last_name = e.last_name,
			c.email = e.email,
			--....
	WHEN NOT MATCH THEN
		INSERT VALUES
			(e.employee_id, e.first_name,/* ... */  e.department_id)
end;			


				-- IMPLICIT CURSORS

-- example with delete:
SET SERVEROUTPUT ON;

DECLARE
    v_dept_no employees.department_id%TYPE := 50;
BEGIN
    DELETE FROM copy_emp
    WHERE
        department_id = v_dept_no;

    dbms_output.put_line(SQL%rowcount || ' rows deleted');
END;

/*

SQL%ROWCOUNT
SQL%FOUND
SQL%NOTFOUND

*/

--			TRANSACTION CONTROL STATEMENTS

BEGIN
	INSERT INTO languages
	VALUES( 40, 'Albanian');
	SAVEPOINT sp_l_1;
	
	INSERT INTO languages
	VALUES( 80, 'Arabic');
	SAVEPOINT sp_l_2;
	
	INSERT INTO languages
	VALUES( 180, 'Bulgarian');
	SAVEPOINT sp_l_3;
	
	INSERT INTO languages
	VALUES( 200, 'Cantonese');
	
	COMMIT;
END;

--ROLLBACK will only recover changes until the last commit
