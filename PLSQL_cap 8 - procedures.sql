--procedure to insert a new department (in a previously created table)
CREATE OR REPLACE PROCEDURE add_dept AS

    v_dept_id     dept.department_id%TYPE;
    v_dept_name   dept.department_name%TYPE;
	
	BEGIN
		v_dept_id := 280;
		v_dept_name := 'ST-Curriculum';
		INSERT INTO dept (
			department_id,
			department_name
		) VALUES (
			v_dept_id,
			v_dept_name
		);
	
		dbms_output.put_line('Inserted '
							|| SQL%rowcount
							|| ' row.');
	END;


--Invoking procedure
BEGIN
	procedure_name;
END;
 
 --with parameters
 CREATE OR REPLACE PROCEDURE add_dept (
	p_name IN my_depts.department_name%TYPE   DEFAULT 'Unknown',
	p_loc  IN my_depts.location_id%TYPE) 
	AS

	BEGIN
		INSERT INTO my_depts(
			department_id,
			department_name,
			location_id)
		VALUES(
			departments_seq.NEXTVAL,
			p_name,
			p_loc);
			
	END add_dept;
 
 --passing by positional notation
 add_dept('EDUCATION', 1400);
 --passing by named notation
 add_dept(p_loc => 1400, p_name => 'EDUCATION');
 --passing by combination notation
add_dept('EDUCATION', p_loc => 1400);


 
-- Example of nested procedures
CREATE OR REPLACE PROCEDURE delete_emp (
    p_emp_id   IN         employees.employee_id%TYPE
) IS

    PROCEDURE log_emp (
        p_emp   IN      employees.employee_id%TYPE
    ) IS
    BEGIN
        INSERT INTO logging_table VALUES ( p_emp, ... );

    END log_emp;

BEGIN
    DELETE FROM employees
    WHERE
        employee_id = p_emp_id;

    log_emp(p_emp_id);
END delete_emp;



--example procedure with parameters
CREATE OR REPLACE PROCEDURE raise_salary
   (p_id 		IN my_employees.employee_id%TYPE,
	p_percent 	IN NUMBER)
AS
BEGIN	
	UPDATE my_employees
		SET salary = salary * (1 + p_percent/100)
		WHERE employee_id = p_id;
END raise_salary;
	
--to execute procedure with parameters:
BEGIN	
	raise_salary(176, 10);
END;

--invoke procedure from another procedure:
CREATE OR REPLACE PROCEDURE process_employees
AS
	CURSOR emp_cursor IS
		SELECT employee_id
		FROM my_employees;

BEGIN	
	FOR v_emp_rec IN emp_cursor
	LOOP
		raise_salary(v_emp_rec.employee_id, 10);
	END LOOP;
END process_employees;
/*
In this example, the PROCESS_EMPLOYEES procedure uses a cursor 
to process all the records in the EMPLOYEES table and passes each employee’s ID 
to the RAISE_SALARY procedure. 
If there are 20 rows in the EMPLOYEES table, 
RAISE_SALARY will execute 20 times. 
Every employee in turn receives a 10% salary increase.
*/


-- IN parameters can only be read within the procedure (default)
-- they cannot be modified

-- OUT parameters return values to the calling enviroment


-- IN and OUT parameters example
CREATE OR REPLACE PROCEDURE query_emp (
    p_id       IN         employees.employee_id%TYPE,
    p_name     OUT        employees.last_name%TYPE,
    p_salary   OUT        employees.salary%TYPE
) IS
BEGIN
    SELECT
        last_name,
        salary
    INTO
        p_name,
        p_salary
    FROM
        employees
    WHERE
        employee_id = p_id;

END query_emp;

--displaying the calls of the procedure
DECLARE
    a_emp_name   employees.last_name%TYPE;
    a_emp_sal    employees.salary%TYPE;
BEGIN
    query_emp(178, a_emp_name, a_emp_sal);
    dbms_output.put_line('NAME: ' || a_emp_name);
    dbms_output.put_line('SALARY: ' || a_emp_sal);
END;


--IN OUT parameters example
CREATE OR REPLACE PROCEDURE format_phone_no (
    p_phone_no IN OUT VARCHAR2
) IS
BEGIN
    p_phone_no := '('
                  || substr(p_phone_no, 1, 3)
                  || ')'
                  || substr(p_phone_no, 4, 3)
                  || '-'
                  || substr(p_phone_no, 7);
END format_phone_no;
--entering '8006330575' gets '(800)633-0575'



--Using record structure as a parameter
CREATE OR REPLACE PROCEDURE sel_one_emp (
			p_emp_id	IN		employees.employee_id%type,
			p_emp_rec	OUT		employees%ROWTYPE)
	IS
	BEGIN
		SELECT
			*
		INTO
			p_emprec
		FROM
			employees
		WHERE
			employee_id = p_emp_id;
	
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
				...
	END;
END sel_one_emp;

--Invocation:
DECLARE	
	v_emprec employees%ROWTYPE;
BEGIN
	sel_one_emp(100, v_emprec);
...
dbms_output.put_line(v_emprec.last_name);
...
END;


----------------------



--procedura IN
CREATE OR REPLACE PROCEDURE modifica_salariul_procent (
    p_id_angajat   IN             angajati.id_angajat%TYPE,
    procent        IN             NUMBER
) IS
    v_salariul angajati.salariul%TYPE;
BEGIN
    SELECT
        salariul
    INTO v_salariul
    FROM
        angajati
    WHERE
        id_angajat = p_id_angajat;

    dbms_output.put_line('Angajatul are salariul de ' || v_salariul);
    UPDATE angajati
    SET
        salariul = salariul * ( 1 + procent / 100 )
    WHERE
        id_angajat = p_id_angajat;

    SELECT
        salariul
    INTO v_salariul
    FROM
        angajati
    WHERE
        id_angajat = p_id_angajat;

    dbms_output.put_line('Angajatul are acum salariul de ' || v_salariul);
END;
/


--procedura IN OUT
CREATE OR REPLACE PROCEDURE modifica_salariul_med (
    p_id_angajat   IN             angajati.id_angajat%TYPE,
    p_sal_mediu    IN OUT         NUMBER
) IS
    nume   angajati.nume%TYPE;
    sal    angajati.salariul%TYPE;
BEGIN
    SELECT
        nume,
        salariul
    INTO
        nume,
        sal
    FROM
        angajati
    WHERE
        id_angajat = p_id_angajat;

    IF sal < p_sal_mediu THEN
        modifica_salariul_procent(p_id_angajat, 15);
    END IF;
    sal_mediu(p_sal_mediu);
END;
/

--procedura OUT
CREATE OR REPLACE PROCEDURE cauta_angajat (
    p_id_angajat   IN             angajati.id_angajat%TYPE,
    p_nume         OUT            angajati.nume%TYPE,
    p_salariul     OUT            angajati.salariul%TYPE
) IS
BEGIN
    SELECT
        nume,
        salariul
    INTO
        p_nume,
        p_salariul
    FROM
        angajati
    WHERE
        id_angajat = p_id_angajat;

    dbms_output.put_line(' Angajatul '
                         || p_nume
                         || ' are salariul de: '
                         || p_salariul);
END;
/

SET SERVEROUTPUT ON

DECLARE
    v_nume       angajati.nume%TYPE;
    v_salariul   angajati.salariul%TYPE;
BEGIN
    cauta_angajat(150, v_nume, v_salariul);
END;
/


--procedura apelata folosind EXECUTE:
CREATE OR REPLACE PROCEDURE sal_mediu (
    p_sal_mediu OUT NUMBER
) IS
BEGIN
    SELECT
        AVG(salariul)
    INTO p_sal_mediu
    FROM
        angajati;

END;
/

VARIABLE v_sal_mediu NUMBER

EXECUTE sal_mediu(:v_sal_mediu)

PRINT v_sal_mediu



