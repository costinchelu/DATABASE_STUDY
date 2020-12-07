-- RECORDS

/*
PL/SQL record – a composite data type consisting of a group of related data items 
stored as fields, each with its own name and data type.
*/

SET SERVEROUTPUT ON;

DECLARE
    v_emp_record employees%rowtype;
BEGIN
    SELECT
        *
    INTO v_emp_record
    FROM
        employees
    WHERE
        employee_id = 100;

    dbms_output.put_line('Email for '
                         || v_emp_record.first_name
                         || ' '
                         || v_emp_record.last_name
                         || ' is '
                         || v_emp_record.email
                         || '@oracle.com.');

END;
/

-- RECORD BASED ON ANOTHER RECORD (good for taking one row at a time)
DECLARE
    v_emp_record        employees%rowtype;
    v_emp_copy_record   v_emp_record%rowtype;
BEGIN
    SELECT
        *
    INTO v_emp_record
    FROM
        employees
    WHERE
        employee_id = 100;

    v_emp_copy_record := v_emp_record;
    v_emp_copy_record.salary := v_emp_record.salary * 1.2;
    dbms_output.put_line(v_emp_record.first_name
                         || ' '
                         || v_emp_record.last_name
                         || ': old salary = '
                         || v_emp_record.salary
                         || ', proposed new salary = '
                         || v_emp_copy_record.salary
                         || '.');

END;
/

-- USER-DEFINED RECORDS (good for joins)
DECLARE
    TYPE person_dept IS RECORD (
        first_name          employees.first_name%TYPE,
        last_name           employees.last_name%TYPE,
        department_name     departments.department_name%TYPE
    );
	
    v_person_dept_rec   person_dept;
BEGIN
    SELECT
        e.first_name,
        e.last_name,
        d.department_name
    INTO 
		v_person_dept_rec
    FROM
        employees     e
        JOIN departments   d 
        ON e.department_id = d.department_id
    WHERE
        employee_id = 200;

    dbms_output.put_line(v_person_dept_rec.first_name
                         || ' '
                         || v_person_dept_rec.last_name
                         || ' is in the '
                         || v_person_dept_rec.department_name
                         || ' department.');

END;
/

-- Populating an INDEX BY table (good for taking more records (or column))
DECLARE
    TYPE t_hire_date IS TABLE OF 
		employees.hire_date%TYPE 
	INDEX BY BINARY_INTEGER;
	
    v_hire_date_tab 	t_hire_date;
BEGIN
    FOR emp_rec IN (
        SELECT
            employee_id,
            hire_date
        FROM
            employees
    ) LOOP
        v_hire_date_tab(emp_rec.employee_id) := emp_rec.hire_date;
    END LOOP;
END;
/

-- Populating an INDEX BY table - and sets the primary key using a sequence 
-- derived from incrementing v_count.
DECLARE
    TYPE t_hire_date IS TABLE OF 
		employees.hire_date%TYPE 
	INDEX BY BINARY_INTEGER;
	
    v_hire_date_tab   t_hire_date;
    v_count           BINARY_INTEGER := 0;
BEGIN
    FOR emp_rec IN (
        SELECT
            hire_date
        FROM
            employees
    ) LOOP
        v_count := v_count + 1;
        v_hire_date_tab(v_count) := emp_rec.hire_date;
    END LOOP;
END;
/

/*
Built_in methods for INDEX BYE
EXISTS (parameter)
PRIOR (parameter)
COUNT
NEXT (parameter)
FIRST
LAST
DELETE
TRIM
*/

-- COUNT method
DECLARE
    TYPE t_hire_date IS TABLE OF 
		employees.hire_date%TYPE 
	INDEX BY BINARY_INTEGER;
	
    v_hire_date_tab     t_hire_date;
    v_hire_date_count   NUMBER(4);
BEGIN
    FOR emp_rec IN 
                ( SELECT
                    employee_id,
                    hire_date
                  FROM
                    employees ) 
    LOOP 
        v_hire_date_tab(emp_rec.employee_id) := emp_rec.hire_date;
    END LOOP;

    dbms_output.put_line(v_hire_date_tab.COUNT);
END;
/

-- INDEX BY table of records with a ROWTYPE record
DECLARE
    TYPE t_emp_rec IS TABLE OF employees%ROWTYPE
    INDEX BY BINARY_INTEGER;
    
    v_emp_rec_tab t_emp_rec;
    
BEGIN
    FOR emp_rec IN
				( SELECT 
					* 
				FROM 
					employees )
    LOOP 
		v_emp_rec_tab(emp_rec.employee_id) := emp_rec;
    
		dbms_output.put_line(v_emp_rec_tab(emp_rec.employee_id).salary);
    END LOOP;
END;

---------------------



--Utilizând un tip de dată înregistrare de același tip cu un rând
--din tabela DEPARTAMENTE să se afișeze denumirea fiecărui 
--departament cu id-ul: 10, 20, 30, 40, 50.

DECLARE
    vrec_dep   departamente%ROWTYPE;
    i          NUMBER := 10;
BEGIN
    LOOP
        SELECT
            *
        INTO 
			vrec_dep
        FROM
            departamente
        WHERE
            id_departament = i;

        dbms_output.put_line('Departamentul: '
                             || vrec_dep.id_departament
                             || ' are denumirea de: '
                             || vrec_dep.denumire_departament);

        EXIT WHEN i >= 50;
        i := i + 10;
    END LOOP;
END;
/


DECLARE
--declarare tip
    TYPE num_table IS
        TABLE OF produse.denumire_produs%TYPE INDEX BY PLS_INTEGER;
-- declarare variabilă tablou
    v_tab   num_table;
    i       NUMBER(5) := 2252;
BEGIN
--incarcarea in tablou:
    LOOP
        SELECT
            denumire_produs
        INTO
            v_tab
        (i)
        FROM
            produse
        WHERE
            id_produs = i;

        i := i + 1;
        EXIT WHEN i > 2255;
    END LOOP;
--extragerea din tablou

    FOR i IN v_tab.first..v_tab.last 
        LOOP 
            IF v_tab.EXISTS(i) THEN
                dbms_output.put_line('Nume produs: ' || v_tab(i));
            END IF;
    END LOOP;

    dbms_output.put_line('Total produse in tabloul indexat: ' || v_tab.count);
END;
/


--Utilizarea unui tablou indexat de același tip cu un rând din tabela ANGAJATI - %ROWTYPE
DECLARE
--declararea tipului si a variabilei
    TYPE ang_table IS
        TABLE OF angajati%rowtype INDEX BY PLS_INTEGER;
    v_tab ang_table;
BEGIN
--incarcarea in tablou:
    FOR i IN 130..135 LOOP SELECT
                               *
                           INTO
                               v_tab
                           (i)
                           FROM
                               angajati
                           WHERE
                               id_angajat = i;

    END LOOP;
--extragerea din tablou

    FOR i IN v_tab.first..v_tab.last LOOP 
        dbms_output.put_line('Angajatul: '
                            || v_tab(i).nume
                            || ' lucreaza in departamentul: '
                            || v_tab(i).id_departament);
    END LOOP;

    dbms_output.put_line('Total angajati in tabloul indexat: ' || v_tab.count);
END;
/


