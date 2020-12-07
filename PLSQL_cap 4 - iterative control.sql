-- BASIC loops
SET SERVEROUTPUT ON;

DECLARE
    v_counter NUMBER(2) := 1;
BEGIN
    LOOP
        dbms_output.put_line('Loop execution # ' || v_counter);
        v_counter := v_counter + 1;
        EXIT WHEN v_counter > 5;
    END LOOP;
END;
/


DECLARE
    v_counter   NUMBER(2) := 1;
    v_loc_id    locations.location_id%TYPE;
BEGIN
    SELECT
        MAX(location_id)
    INTO v_loc_id
    FROM
        locations
    WHERE
        country_id = 2;

    LOOP
        INSERT INTO locations (
            location_id,
            city,
            country_id
        ) VALUES (
            ( v_loc_id + v_counter ),
            'Montreal',
            2
        );

        v_counter := v_counter + 1;
        EXIT WHEN v_counter > 3;
    END LOOP;

END;
/

-- WHILE loops
DECLARE
    v_counter   NUMBER := 1;
    v_loc_id    locations.location_id%TYPE;
BEGIN
    SELECT
        MAX(location_id)
    INTO v_loc_id
    FROM
        locations
    WHERE
        country_id = 2;

    WHILE v_counter <= 3 LOOP
        INSERT INTO locations (
            location_id,
            city,
            country_id
        ) VALUES (
            ( v_loc_id + v_counter ),
            'Montreal',
            2
        );

        v_counter := v_counter + 1;
    END LOOP;

END;
/

-- FOR loops
DECLARE
    v_loc_id    locations.location_id%TYPE;
BEGIN
    SELECT
        MAX(location_id)
    INTO v_loc_id
    FROM
        locations
    WHERE
        country_id = 2;

   FOR i IN 1..3 LOOP
        INSERT INTO locations (
            location_id,
            city,
            country_id
        ) VALUES (
            ( v_loc_id + v_counter ),
            'Montreal',
            2
        );

    END LOOP;

END;
/



-----------------



--Se afişează în ordine angajaţii cu codurile în intervalul 100-110 
--atât timp cât salariul acestora este mai mic decât media:

DECLARE
    v_sal        angajati.salariul%TYPE;
    v_salmediu   v_sal%TYPE;
    i            NUMBER(4) := 100;
BEGIN
    SELECT
        AVG(salariul)
    INTO v_salmediu
    FROM
        angajati;

    dbms_output.put_line('Salariul mediu este: ' || v_salmediu);
    LOOP
        SELECT
            salariul
        INTO v_sal
        FROM
            angajati
        WHERE
            id_angajat = i;

        dbms_output.put_line('Salariatul cu codul '
                             || i
                             || ' are salariul: '
                             || v_sal);
        i := i + 1;
        EXIT WHEN v_sal < v_salmediu OR i > 110;
    END LOOP;

END;
/