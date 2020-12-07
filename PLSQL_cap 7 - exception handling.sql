/*
Exceptions:

Predefined Oracle Server errors (most common) 
(they have an error code and a name)

TOO_MANY_ROWS
NO_DATA_FOUND
INVALID_CURSOR
ZERO_DIVIDE

Non-predefined Oracle server errors: they have no name.
So they must be declared

https://docs.oracle.com/en/database/oracle/oracle-database/19/errmg/toc.html

exceptions starts with ORA

User-defined errors are defined by the programmer

Trapping exceptions:

WHEN TOO_MANY_ROWS [OR exception 2...] THEN
...;
...;
WHEN NO_DATA_FOUND THEN
...;
...;
WHEN OTHERS THEN
...;
...;


others = optional exception handling clause (must be the last exception
handler that is defined.
*/


-- Exception handling example:
DECLARE
    v_country_name   countries.country_name%type := 'Korea, South';
    v_elevation      countries.highest_elevation%TYPE;
BEGIN
    SELECT
        highest_elevation
    INTO 
		v_elevation
    FROM
        countries
    WHERE
        country_name = v_country_name;

EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('Country name '
                             || v_country_name
                             || ' cannot be found');
END;

--How to handle predefined Oracle server errors
DECLARE
    v_lname VARCHAR2(15);
BEGIN
    SELECT
        last_name
    INTO v_lname
    FROM
        employees
    WHERE
        job_id = 'ST_CLERK';

    dbms_output.put_line('The last name of st_clerk is: ' || v_lname);
EXCEPTION
    WHEN too_many_rows THEN
        dbms_output.put_line('Select statement found multiple rows');
    WHEN no_data_found THEN
        dbms_output.put_line('Select statement found no rows');
    WHEN OTHERS THEN
        dbms_output.put_line('Another type of error occured');
END;

--How to handle non-predefined Oracle server errors
DECLARE
    e_insert_ex EXCEPTION;
    PRAGMA EXCEPTION_INIT ( e_insert_ex, -01400 );
BEGIN
    INSERT INTO departments (
        department_id,
        department_name
    ) VALUES (
        280,
        NULL
    );

EXCEPTION
    WHEN e_insert_ex THEN
        dbms_output.put_line('Insert failed!');
END;


--Functions for trapping exceptions:
-- SQLCODE = returns the numeric value for the error code
-- SQLERM = returns character data containing the message 
-- associated with the error number.
DECLARE	
	v_error_code NUMBER;
	v_error_message VARCHAR2(255);

BEGIN	
	...
	...

EXCEPTION
	WHEN exception1 THEN
		...;
		...;
	WHEN OTHERS THEN
		ROLLBACK;
		v_error_code := SQLCODE;
		v_error_message := SQLERRM;
		INSERT INTO error_log(
						 e_user, 
						 e_date, 
						 error_code, 
						 error_message
		) VALUES(
			 USER,
			 SYSDATE,
			 v_error_code,
			 v_error_message
			 );
END;


--User-defined exceptions
DECLARE
    v_name VARCHAR2(20) := 'Accounting';
    v_deptno NUMBER := 27;
				--in this example, there is no department_id = 27
				-- The Oracle server will not update the variable because
				-- an inexistent department_id is not considered as error
    e_invalid_dept EXCEPTION;

BEGIN
    UPDATE departments
        SET department_name = v_name
        WHERE department_id = v_deptno;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_dept;
    END IF;
    
EXCEPTION
    WHEN e_invalid_dept THEN
    dbms_output.put_line('No such department id.');

END;
		
		
-- The RAISE_APPLICATION_ERROR procedure
-- used to return user_defined eror messages from stored subprograms
-- error_number mus fall beteween -20000 and -20999 (reserved for 
-- programmer use)
-- up to 2048 bytes long
-- there is an optional boolean parameter:
-- 		IF TRUE: error is placedon the stack of previous errors
--		IF FALSE(default): replaces all previous errors
-- can be used in executable or exception section

--in executable section
DECLARE
	v_mgr PLS_INTEGER := 123;
	
BEGIN	
	DELETE FROM employees
		WHERE manager_id = v_mgr;
	IF SQL%NOTFOUND THEN	
		RAISE_APPLICATION_ERROR(-20202, 'This is not a valid manager');
	END IF;

END;

--in exception section
DECLARE
    v_mgr           PLS_INTEGER := 27;
    v_employee_id   employees.employee_id%TYPE;
BEGIN
    SELECT
        employee_id
    INTO v_employee_id
    FROM
        employees
    WHERE
        manager_id = v_mgr;

    dbms_output.put_line('Employee #'
                         || v_employee_id
                         || ' works for manager #'
                         || v_mgr
                         || '.');

EXCEPTION
    WHEN no_data_found THEN
        RAISE_APPLICATION_ERROR(-20201, 'This manager has no employees.');
    WHEN too_many_rows THEN
        RAISE_APPLICATION_ERROR(-20202, 'Too many employees were found.');
END;

--with a user-defined exception
DECLARE
    e_name EXCEPTION;
    PRAGMA exception_init ( e_name, -20999 );
    v_last_name employees.last_name%TYPE := 'Silly Name';
BEGIN
    DELETE FROM employees
    WHERE
        last_name = v_last_name;

    IF SQL%rowcount = 0 THEN
        RAISE_APPLICATION_ERROR(-20999, 'Invalid last name');
    ELSE
        dbms_output.put_line(v_last_name || ' deleted');
    END IF;

EXCEPTION
    WHEN e_name THEN
        dbms_output.put_line('Valid last names are: ');
        FOR c1 IN (
            SELECT DISTINCT
                last_name
            FROM
                employees
        ) 
        LOOP 
            dbms_output.put_line(c1.last_name);
        END LOOP;

    WHEN OTHERS THEN
        dbms_output.put_line('Error deleting from employees');
END;


-- propagating predefined Oracle Server exceptions from a sub-block
DECLARE
    v_last_name     employees.last_name%TYPE;
BEGIN
    BEGIN
        SELECT
            last_name
        INTO v_last_name
        FROM
            employees
        WHERE
            employee_id = 999;
        dbms_output.put_line('Message 1');
    EXCEPTION
        WHEN too_many_rows THEN
            dbms_output.put_line('Message 2');
    END;
    
dbms_output.put_line('Message 3');

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Message 4');
END;
				-- will output "Message 4"	
				
-- scope-wise: declare user-named exceptions in the outermost block
DECLARE
    e_myexcep EXCEPTION;
BEGIN
    BEGIN
        RAISE e_myexcep;
        dbms_output.put_line('Message 1');
    EXCEPTION
        WHEN too_many_rows THEN
            dbms_output.put_line('Message 2');
    END;

    dbms_output.put_line('Message 3');
EXCEPTION
    WHEN e_myexcep THEN
        dbms_output.put_line('Message 4');
END;


-------------------------


-- example of nested exceptions
-- The code will fail to compile because e_inner_excep cannot be referenced in the outer block
DECLARE 
    e_outer_excep EXCEPTION; 
BEGIN 
    DECLARE 
       e_inner_excep EXCEPTION; 
    BEGIN 
       RAISE e_outer_excep; 
    END; 
EXCEPTION 
    WHEN e_outer_excep THEN 
       DBMS_OUTPUT.PUT_LINE('Outer raised'); 
    WHEN e_inner_excep THEN 
       DBMS_OUTPUT.PUT_LINE('Inner raised'); 
END; 


-- redefinire exceptie predefinita

--Să se insereze în tabela departamente un nou departament 
--cu ID-ul 200, fără a preciza denumirea acestuia. 
--În acest caz va apare o eroarea cu codul  ORA-01400 
--prin care programatorul este avertizat de încălcarea 
--unei restricţii de integritate. 
--Această excepţie poate fi tratată astfel:

DECLARE
-- se asociază un nume codului de eroare apărut
    insert_except EXCEPTION;
    PRAGMA exception_init ( insert_except, -01400 );
BEGIN
    INSERT INTO departments (
        department_id,
        department_name
    ) VALUES (
        200,
        NULL
    );

EXCEPTION
--se tratează eroarea prin numele său
    WHEN insert_except THEN
        dbms_output.put_line('Nu ati precizat informatii suficiente pentru departament');
--se afişează mesajul erorii
        dbms_output.put_line(sqlerrm);
END;
/


--Să se şteargă toate înregistrările din tabela PRODUSE. 
--Acest lucru va duce la apariţia erorii cu codul –2292, reprezentând 
--încălcarea restricţiei referenţiale. 
--Valorile SQLCODE şi SQLERRM vor fi inserate în tabela ERORI. 
--ATENTIE! Aceste variabile nu se pot utiliza direct într-o comandă SQL 
--(cum ar fi SELECT, INSERT, UPDATE sau DELETE), 
--drept pentru care vor fi încărcate mai întâi in variabilele PL/SQL COD și MESAJ 
--și apoi utilizate în instrucţiuni SQL.
CREATE TABLE erori (
    utilizator     VARCHAR2(40),
    data           DATE,
    cod_eroare     NUMBER(10),
    mesaj_eroare   VARCHAR2(255)
);

DECLARE
    cod     NUMBER;
    mesaj   VARCHAR2(255);
    del_exception EXCEPTION;
    PRAGMA exception_init ( del_exception, -2292 );
BEGIN
    DELETE FROM produse;

EXCEPTION
    WHEN del_exception THEN
        dbms_output.put_line('Nu puteti sterge produsul');
        dbms_output.put_line('Exista comenzi asignate lui');
        cod := sqlcode;
        mesaj := sqlerrm;
        INSERT INTO erori VALUES (
            user,
            SYSDATE,
            cod,
            mesaj
        );

END;
/

SELECT
    *
FROM
    erori;




