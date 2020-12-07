-- IF (Conditional Control)
SET SERVEROUTPUT ON;

DECLARE
    v_my_age NUMBER := 31;
BEGIN
    IF v_my_age < 11 THEN
        dbms_output.put_line('I am a child');
    ELSIF v_my_age < 20 THEN
        dbms_output.put_line('I am young');
    ELSIF v_my_age < 30 THEN
        dbms_output.put_line('I am in my twenties');
    ELSIF v_my_age < 40 THEN
        dbms_output.put_line('I am in my thirties');
    ELSE
        dbms_output.put_line('I am mature');
    END IF;
END;
/

DECLARE
    v_myage    NUMBER := 10;
    v_myname   VARCHAR2(20) := 'Christopher';
BEGIN
    IF v_myage <= 11 AND LOWER(v_myname) LIKE 'christopher' THEN
        dbms_output.put_line('I am a child named Christopher');
    END IF;
END;
/

--CASE (Conditional Control)

DECLARE
    v_num   NUMBER := 15;
    v_txt   VARCHAR2(50);
BEGIN
    CASE v_num
        WHEN 20 THEN
            v_txt := 'Number equals 20';
        WHEN 17 THEN
            v_txt := 'Number equals 17';
        WHEN 15 THEN
            v_txt := 'Number equals 15';
        ELSE
            v_txt := 'Other number';
    END CASE;

    dbms_output.put_line(v_txt);
END;
/

DECLARE
    v_num   NUMBER := 15;
    v_txt   VARCHAR2(50);
BEGIN
    CASE
        WHEN v_num > 20 THEN
            v_txt := 'Number greater than 20';
        WHEN v_num > 15 THEN
            v_txt := 'Number greater than 15';
        ELSE
            v_txt := 'Number less than 15';
    END CASE;

    dbms_output.put_line(v_txt);
END;
/

--CASE Expression
SET SERVEROUTPUT ON;

DECLARE
    v_grade       CHAR(1) := 'A';
    v_appraisal   VARCHAR2(20);
BEGIN
    v_appraisal :=
        CASE v_grade
            WHEN 'A' THEN
                'Excellent'
            WHEN 'B' THEN
                'Very Good'
            WHEN 'C' THEN
                'Good'
            ELSE 'Lower grade'
        END;

    dbms_output.put_line('Grade: '
                         || v_grade
                         || '. Appraisal: '
                         || v_appraisal);
END;
/



------------

--case expression
SET SERVEROUTPUT ON

DECLARE
    v_lista     produse.pret_lista%TYPE;
BEGIN
    SELECT
        pret_lista
    INTO v_lista
    FROM
        produse
    WHERE
        id_produs = &p;

    dbms_output.put_line('Pretul de lista initial este: ' || v_lista);
    v_lista :=
        CASE
            WHEN v_lista < 500 THEN
                2 * v_lista
            WHEN v_lista BETWEEN 500 AND 1000 THEN
                1.5 * v_lista
            ELSE 1.25 * v_lista
        END;

    dbms_output.put_line('Pretul final este: ' || v_lista);
END;
/

--case statement
SET SERVEROUTPUT ON

DECLARE
    v_lista     produse.pret_lista%TYPE;
BEGIN
    SELECT
        pret_lista
    INTO v_lista
    FROM
        produse
    WHERE
        id_produs = &p;

    dbms_output.put_line('Pretul de lista initial este: ' || v_lista);
    CASE
        WHEN v_lista < 500 THEN
            v_lista := 2 * v_lista;
        WHEN v_lista BETWEEN 500 AND 1000 THEN
            v_lista := 1.5 * v_lista;
        ELSE
            v_lista := 1.25 * v_lista;
    END CASE;

    dbms_output.put_line('Pretul final este: ' || v_lista);
END;
/