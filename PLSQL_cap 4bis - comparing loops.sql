-- BASIC LOOP
DECLARE
    v_loc_id locations.location_id%TYPE;
    v_counter NUMBER(1) := 1;
BEGIN
    SELECT 
        MAX(location_id) INTO v_loc_id
     FROM 
        locations
     WHERE
        country_id = 2;
        
    LOOP
        INSERT INTO locations(location_id, city, country_id)
        VALUES ((v_loc_id + v_counter), 'Montreal', 2);
        
        v_counter := v_counter + 1;
        EXIT WHEN v_counter > 3;
    END LOOP;
END;


-- WHILE LOOP
DECLARE
    v_loc_id locations.location_id%TYPE;
    v_counter NUMBER(1) := 1;
BEGIN
    SELECT 
        MAX(location_id) INTO v_loc_id
     FROM 
        locations
     WHERE
        country_id = 2;
        
    WHILE v_counter <= 3 LOOP
        INSERT INTO locations(location_id, city, country_id)
        VALUES ((v_loc_id + v_counter), 'Montreal', 2);
        
        v_counter := v_counter + 1;
    END LOOP;
END;


-- FOR LOOP
DECLARE
    v_loc_id locations.location_id%TYPE;
BEGIN
    SELECT 
        MAX(location_id) INTO v_loc_id
     FROM 
        locations
     WHERE
        country_id = 2;
        
    FOR i IN 1..3 LOOP
        INSERT INTO locations(location_id, city, country_id)
        VALUES ((v_loc_id + v_counter), 'Montreal', 2);
    END LOOP;
END;