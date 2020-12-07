--variabile

SET SERVEROUTPUT ON

DECLARE
    v_first_name   VARCHAR2(25);
    v_last_name    VARCHAR2(25);
BEGIN
    SELECT
        first_name,
        last_name
    INTO
        v_first_name,
        v_last_name
    FROM
        employees
    WHERE
        lower(last_name) = 'hunold';

    dbms_output.put_line('Employee of the month is: '
                         || v_first_name
                         || ' '
                         || v_last_name
                         || '.');

EXCEPTION
    WHEN too_many_rows THEN
        dbms_output.put_line('Too many rows! Use a cursor.');
END;
/


DECLARE
    v_counter INTEGER := 0;
BEGIN
    v_counter := v_counter + 1;             --increment
    dbms_output.put_line('Counter s value is: ' || v_counter);
END; 
/

DECLARE
    fam_birthdate    DATE;              --non-initialized values are NULL by default
    fam_size         NUMBER(2) NOT NULL := 10;
    fam_location     VARCHAR2(13) := 'Florida';
    fam_bank         CONSTANT NUMBER := 50000;
    fam_population   INTEGER;
    fam_name         VARCHAR2(20) DEFAULT 'Roberts';
    fam_party_size   CONSTANT PLS_INTEGER := 20;
BEGIN
    SELECT TO_CHAR(SYSDATE) INTO fam_birthdate FROM DUAL;
    dbms_output.put_line('Birthdate: ' || fam_birthdate);
END;
/


--example of variables in a function:
SET SERVEROUTPUT ON;

CREATE FUNCTION num_characters 
(p_string IN VARCHAR2)   
    RETURN INTEGER IS
    v_num_characters INTEGER;
BEGIN
    SELECT
        length(p_string)
    INTO v_num_characters
    FROM
        dual;

    RETURN v_num_characters;
END;
/

DECLARE
    v_length_of_string INTEGER;
BEGIN
    v_length_of_string := num_characters('Oracle Corp.');
    dbms_output.put_line(v_lenth_of_string);
END;
/


/*
Identifiers: (may include $ _ #) (not case sensitive)


PROCEDURE
FUNCTION
VARIABLE
EXCEPTION
CONSTANT
PACKAGE
RECORD
PL/SQL TABLE
CURSOR


*/

-- te %TYPE generic type

SET SERVEROUTPUT ON;

DECLARE
    v_first_n employees.first_name%TYPE;
BEGIN
    SELECT
        first_name
    INTO v_first_n
    FROM
        employees
    WHERE
        employee_id = 100;

    dbms_output.put_line('Prenume: ' || v_first_n);
END;


-- nested blocks
SET SERVEROUTPUT ON;

DECLARE
    v_outer_var VARCHAR2(20) := 'GLOBAL VARIABLE';
BEGIN
    DECLARE
        v_inner_var v_outer_var%TYPE := 'INNER VARIABLE';
    BEGIN
        dbms_output.put_line(v_inner_var);
        dbms_output.put_line(v_outer_var);
    END;

    dbms_output.put_line(v_outer_var);
END;

--Să se calculeze suma a două numere, iar rezultatul să se dividă cu 3. 
--Numerele se vor introduce de la tastatură.

VARIABLE g_rezultat NUMBER  --(global, static)(variabila de substitutie)

ACCEPT p_num1 PROMPT 'Introduceţi primul număr:' --(variabile de legatura)

ACCEPT p_num2 PROMPT 'Introduceţi al doilea număr:'

DECLARE
    v_num1   NUMBER(9, 2) := &p_num1;
    v_num2   NUMBER(9, 2) := &p_num2;
BEGIN
    :g_rezultat := ( v_num1 + v_num2 ) / 3;
END;
/

--Să se afişeze salariul mărit cu un x procente. 
--Salariul şi procentul se citesc de la tastatură.

ACCEPT p_sal PROMPT 'Introduceţi salariul:'

ACCEPT p_procent PROMPT 'Introduceţi procentul:'

DECLARE
    v_sal       NUMBER := &p_sal;
    v_procent   NUMBER := &p_procent;
BEGIN
    dbms_output.put_line
    (TO_CHAR( nvl(v_sal, 0) * (1 + nvl(v_procent, 0) / 100) ));
END;
/