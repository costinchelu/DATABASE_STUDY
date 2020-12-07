-- Package example:
CREATE OR REPLACE PACKAGE manage_jobs_pkg IS
 --variabila globala:   
    g_todays_date DATE := SYSDATE;
--cursor:
    CURSOR jobs_curs IS
    SELECT
        employee_id,
        job_id
    FROM
        employees
    ORDER BY
        employee_id;
--procedura:
    PROCEDURE update_job (
        p_emp_id   IN         employees.employee_id%TYPE
    );
--procedura:
    PROCEDURE fetch_emps (
        p_job_id   IN         employees.job_id%TYPE,
        p_emp_id   OUT        employees.employee_id%TYPE
    );

END manage_jobs_pkg;



-- Package body example:
CREATE OR REPLACE PACKAGE BODY check_emp_pkg IS

    PROCEDURE chk_hiredate (
        p_date   IN       employees.hire_date%TYPE
    ) IS
    BEGIN
        IF months_between(SYSDATE, p_date) > g_max_length_of_service * 12 THEN
            RAISE_APPLICATION_ERROR(-20200, 'Invalid Hiredate');
        END IF;
    END chk_hiredate;

    PROCEDURE chk_dept_mgr (
        p_empid   IN        employees.employee_id%TYPE,
        p_mgr     IN        employees.manager_id%type
    ) IS
    BEGIN
    --...
    END chk_dept_mgr;

END check_emp_pkd;



DESCRIBE check_emp_pkg

/*
•Package body – This contains the executable code of the subprograms
 which were declared in the package specification. 
 It may also contain its own variable declarations.
 
•Package specification – The interface to your applications that declares 
the constructs (procedures, functions, variables and so on) 
which are visible to the calling environment.
*/



--
-- No salary can be increased more than 20% at one time_____________
-- Package specification:
CREATE OR REPLACE PACKAGE salary_pkg IS

    g_max_sal_raise CONSTANT NUMBER := 0.2;
	
    PROCEDURE update_sal (
        p_employee_id   employees.employee_id%TYPE,
        p_new_salary    employees.salary%TYPE
    );

END salary_pkg;
--The validation subprogram for checking whether the salary 
--increase is within the 20% limit will be implemented by a private function 
--declared in the package body.
-- Package body:
CREATE OR REPLACE PACKAGE BODY salary_pkg IS

--private function:
    FUNCTION validate_raise         				
     (
        p_old_salary   employees.salary%TYPE,
        p_new_salary   employees.salary%TYPE
    ) RETURN BOOLEAN IS
    BEGIN
        IF p_new_salary > ( p_old_salary * ( 1 + g_max_sal_raise ) ) THEN
            RETURN false;
        ELSE
            RETURN true;
        END IF;
    END validate_raise;

--public procedure:
    PROCEDURE update_sal            				
     (
        p_employee_id   employees.employee_id%TYPE,
        p_new_salary    employees.salary%TYPE
    ) IS
        v_old_salary employees.salary%TYPE;      	--local variable
    BEGIN
        SELECT
            salary
        INTO v_old_salary
        FROM
            employees
        WHERE
            employee_id = p_employee_id;

        IF validate_raise(v_old_salary, p_new_salary) THEN
            UPDATE employees
            SET
                salary = p_new_salary
            WHERE
                employee_id = p_employee_id;

        ELSE
            raise_application_error(-20210, 'Raise too high');
        END IF;

    END update_sal;

END salary_pkg;



-- Invoking package
EXEC salary_pkg.update_sal(100, 25000);

--removing packages:
DROP PACKAGE salary_pkg;

--source code can be viewed throug USER_SOURCE and ALL_SOURCE in Data Dictionary
SELECT 
	text 
FROM	
	USER_SOURCE
WHERE 
	name = 'SALARY_PKG' AND type = 'PACKAGE'
ORDER BY line;
--and for body:
SELECT 
	text 
FROM	
	USER_SOURCE
WHERE 
	name = 'SALARY_PKG' AND type = 'PACKAGE BODY'
ORDER BY line;

--for USER_ERRORS dictionary table:
SELECT 
	line, text, position		--where and error message
FROM
	USER_ERRORS
WHERE 
	name = 'BAD_PROC' AND type = 'PROCEDURE'
ORDER BY sequence;



-- Overloading example:
CREATE OR replace PACKAGE BODY dept_pkg IS

    PROCEDURE add_department (
        p_deptno   NUMBER,
        p_name     VARCHAR2 := 'unknown',
        p_loc      NUMBER := 1700
    ) IS
    BEGIN
        INSERT INTO departments (
            department_id,
            department_name,
            location_id
        ) VALUES (
            p_deptno,
            p_name,
            p_loc
        );

    END add_department;

    PROCEDURE add_department (
        p_name   VARCHAR2 := 'unknown',
        p_loc    NUMBER := 1700
    ) IS
    BEGIN
        INSERT INTO departments (
            department_id,
            department_name,
            location_id
        ) VALUES (
            departments_seq.NEXTVAL,
            p_name,
            p_loc
        );

    END add_department;

end dept_pkg;

-- Example usage:
BEGIN	
	dept_pkg.add_department(980, 'Education', 2500);
END;



-- Bodiless package:
CREATE OR REPLACE PACKAGE our_exceptions IS
    e_cons_violation EXCEPTION;
    PRAGMA exception_init ( e_cons_violation, -2292 );
    e_value_too_large EXCEPTION;
    PRAGMA exception_init ( e_value_too_large, -1438 );
END our_exceptions;

GRANT EXECUTE ON our_exceptions TO PUBLIC;

BEGIN
    INSERT INTO excep_test ( number_col ) VALUES ( 12345 );

EXCEPTION
    WHEN our_exceptions.e_value_too_large THEN
        dbms_output.put_line('Value too big for column data type');
END;




-- Example package:
CREATE OR REPLACE PACKAGE taxes_pkg IS
    FUNCTION tax (
        p_value IN NUMBER
    ) RETURN NUMBER;

END taxes_pkg;

CREATE OR REPLACE PACKAGE BODY taxes_pkg IS

    FUNCTION tax (
        p_value IN NUMBER
    ) RETURN NUMBER IS
        v_rate NUMBER := 0.08;
    BEGIN
        return(p_value * v_rate);
    END tax;

END taxes_pkg;




-- Using UTL_FILE package example:
CREATE OR REPLACE PROCEDURE sal_status (
    p_dir        IN           VARCHAR2,
    p_filename   IN           VARCHAR2
) IS

    v_file         utl_file.file_type;
    CURSOR emp_curs IS
    SELECT
        last_name,
        salary,
        department_id
    FROM
        employees
    ORDER BY
        department_id;

    v_newdeptno    employees.department_id%TYPE;
    v_olddeptnno   employees.department_id%TYPE := 0;
BEGIN
    v_file := utl_file.fopen(p_dir, p_filename, 'w');
    utl_file.put_line(v_file, 'REPORT: GENERATED ON ' || SYSDATE);
    utl_file.new_line(v_file);
    FOR emp_rec IN emp_curs LOOP 
	
		utl_file.put_line(v_file, ' EMPLOYEE: '
            || emp_rec.last_name
            || 'earns: '
            || emp_rec.salary);
    END LOOP;

    utl_file.put_line(v_file, '***END OF REPORT ***');
    utl_file.fclose(v_file);
EXCEPTION
    WHEN utl_file.invalid_filehandle THEN
        raise_application_error(-20001, 'Invalid file.');
    WHEN utl_file.write_error THEN
        raise_application_error(-20002, 'Unable to write to file');
END sal_status;


BEGIN
	sal_status('MYDIR', 'salreport.txt');
END;




----------------------------




CREATE OR REPLACE PACKAGE actualizare_produse IS
    PROCEDURE adauga_produs (
        p_codp    produse.id_produs%TYPE,
        p_denp    produse.denumire_produs%TYPE,
        p_lista   produse.pret_lista%TYPE,
        p_min     produse.pret_min%TYPE
    );

    PROCEDURE modifica_produs (
        p_codp    produse.id_produs%TYPE,
        p_denp    produse.denumire_produs%TYPE,
        p_lista   produse.pret_lista%TYPE,
        p_min     produse.pret_min%TYPE
    );

    PROCEDURE modifica_produs (
        p_codp    produse.id_produs%TYPE,
        p_lista   produse.denumire_produs%TYPE
    );

    PROCEDURE sterge_produs (
        p_codp produse.id_produs%TYPE
    );

    FUNCTION exista_cod (
        p_codp produse.id_produs%TYPE
    ) RETURN BOOLEAN;

    exceptie EXCEPTION;
END;
/

CREATE OR REPLACE PACKAGE BODY actualizare_produse IS

    PROCEDURE adauga_produs (
        p_codp    produse.id_produs%TYPE,
        p_denp    produse.denumire_produs%TYPE,
        p_lista   produse.pret_lista%TYPE,
        p_min     produse.pret_min%TYPE
    ) IS
    BEGIN
        IF exista_cod(p_codp) THEN
            RAISE exceptie;
        ELSE
            INSERT INTO produse (
                id_produs,
                denumire_produs,
                pret_lista,
                pret_min
            ) VALUES (
                p_codp,
                p_denp,
                p_lista,
                p_min
            );

        END IF;
    EXCEPTION
        WHEN exceptie THEN
            dbms_output.put_line('Produs existent!');
    END;

    PROCEDURE modifica_produs (
        p_codp    produse.id_produs%TYPE,
        p_denp    produse.denumire_produs%TYPE,
        p_lista   produse.pret_lista%TYPE,
        p_min     produse.pret_min%TYPE
    ) IS
    BEGIN
        IF exista_cod(p_codp) THEN
            UPDATE produse
            SET
                denumire_produs = p_denp,
                pret_lista = p_lista,
                pret_min = p_min
            WHERE
                id_produs = p_codp;

        ELSE
            RAISE exceptie;
        END IF;
    EXCEPTION
        WHEN exceptie THEN
            dbms_output.put_line('Produsul cu aceast cod nu exista!');
    END;

--supraîncarcare a procedurii modifica_produs:
    PROCEDURE modifica_produs (                                     
        p_codp    produse.id_produs%TYPE,
        p_lista   produse.denumire_produs%TYPE
    ) IS
    BEGIN
        IF exista_cod(p_codp) THEN
            UPDATE produse
            SET
                pret_lista = p_lista
            WHERE
                id_produs = p_codp;

        ELSE
            RAISE exceptie;
        END IF;
    EXCEPTION
        WHEN exceptie THEN
            dbms_output.put_line('Produsul cu aceast cod nu exista!');
    END;

    PROCEDURE sterge_produs (
        p_codp produse.id_produs%TYPE
    ) IS
    BEGIN
        IF exista_cod(p_codp) THEN
            DELETE FROM produse
            WHERE
                id_produs = p_codp;

            dbms_output.put_line('Produsul cu codul '
                                 || p_codp
                                 || ' a fost sters!');
        ELSE
            RAISE exceptie;
        END IF;
    EXCEPTION
        WHEN exceptie THEN
            dbms_output.put_line('Produsul cu aceast cod nu exista!');
    END;

    FUNCTION exista_cod (
        p_codp produse.id_produs%TYPE
    ) RETURN BOOLEAN IS
        v_unu NUMBER;
    BEGIN
        SELECT
            1
        INTO v_unu
        FROM
            produse
        WHERE
            id_produs = p_codp;

        RETURN true;
    EXCEPTION
        WHEN no_data_found THEN
            RETURN false;
    END;
END;
/

--Apelul procedurilor / funcțiilor din cadrul pachetului:
EXECUTE actualizare_produse.adauga_produs(449, 'ceai', 12, 14);

SELECT
    *
FROM
    produse
WHERE
    id_produs = 449;


--Apelarea procedurii supra-încărcate
EXECUTE actualizare_produse.modifica_produs(449, 20);

SELECT
    *
FROM
    produse
WHERE
    id_produs = 449;


--Se poate folosi și CALL în loc de execute
CALL actualizare_produse.modifica_produs(449, NULL);

SELECT
    *
FROM
    produse
WHERE
    id_produs = 449;


--Apelarea dintr-un bloc anonim
BEGIN
    actualizare_produse.sterge_produs(449);
END;
/

SELECT
    *
FROM
    produse
WHERE
    id_produs = 449;