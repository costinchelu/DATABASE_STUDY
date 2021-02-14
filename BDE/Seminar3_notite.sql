/* SEMINAR 3 - BDOO

metoda:
- tip returnat
- numele metodei
- parametrii (tip, nr, ordine)

Doar un subtip poate supraincarca metode care au exact aceeasi parametrii formali ca si supertipul


*/

SET SERVEROUTPUT ON;

-- creare obiect si corp

CREATE OR REPLACE TYPE obj_adresa AS OBJECT (

    strada VARCHAR2(20),
    numar VARCHAR2(3),
    cod_postal VARCHAR2(5),
    oras VARCHAR2(15),
    id_tara CHAR(2),
    
    MEMBER FUNCTION adresa_completa RETURN VARCHAR2    
);


CREATE OR REPLACE TYPE BODY obj_adresa 
AS MEMBER FUNCTION adresa_completa 
RETURN VARCHAR2 IS x VARCHAR2(50);

    BEGIN
        x := strada || ', ' || numar || ', ' || cod_postal || ', ' || oras || ', ' || id_tara;
        return x;
    END adresa_completa;
END;

-- creare si afisare obiect:

DECLARE
    var1 obj_adresa;

BEGIN
    var1 := obj_adresa('Calea Dorobantilor', '15', '31525', 'Bucuresti', 'RO');
    DBMS_OUTPUT.PUT_LINE(var1.strada || ', nr. ' || var1.numar);
END;

-- modificare obiect si corp

CREATE OR REPLACE TYPE obj_adresa AS OBJECT (

    strada VARCHAR2(20),
    numar VARCHAR2(3),
    cod_postal VARCHAR2(5),
    oras VARCHAR2(15),
    id_tara CHAR(2),
    
    MEMBER FUNCTION adresa_completa RETURN VARCHAR2,
	
	-- constructor explict (fara tara)
	CONSTRUCTOR FUNCTION obj_adresa (
		p_strada VARCHAR2,
		p_nr VARCHAR2,
		p_cod VARCHAR2,
		p_oras VARCHAR2)
		
	RETURN SELF AS RESULT
);


CREATE OR REPLACE TYPE BODY obj_adresa 
AS MEMBER FUNCTION adresa_completa 
RETURN VARCHAR2 IS x VARCHAR2(50);

    BEGIN
        x := strada || ', ' || numar || ', ' || cod_postal || ', ' || oras || ', ' || id_tara;
        return x;
    END adresa_completa;
    
    CONSTRUCTOR FUNCTION obj_adresa (
		p_strada VARCHAR2,
        p_nr VARCHAR2,
		p_cod VARCHAR2,
		p_oras VARCHAR2)
		
	RETURN SELF AS RESULT IS
        BEGIN
            -- luam fiecare atribut si punem valoarea din parametru
            self.strada := p_strada;
            self.numar := p_nr;
            self.cod_postal := p_cod;
            self.oras := p_oras;
			self.id_tara := 'RO';
			RETURN;
            
        END;
END;


-- primul exemplu = constructorul implicit
-- al doilea, cel explicit
DECLARE
    var1 obj_adresa;
    var2 obj_adresa;

BEGIN
    var1 := obj_adresa('Calea Dorobantilor', '15', '31525', 'Bucuresti', 'RO');
    var2 := obj_adresa('Calea Bucuresti', '10', '21475', 'Brasov');
    DBMS_OUTPUT.PUT_LINE(var1.strada || ', nr. ' || var1.numar);
    DBMS_OUTPUT.PUT_LINE(var2.strada || ', nr. ' || var2.numar);
END;


-- crearea unei tabele:

CREATE OR REPLACE TYPE obj_autentificare AS OBJECT (
    username VARCHAR2(20),
    parola VARCHAR2(20)
);

CREATE TABLE autentificare OF obj_autentificare (
    CONSTRAINT ck_autentificare_nn_user CHECK (username IS NOT NULL),
    CONSTRAINT ck_autentificare_nn_parola CHECK (parola IS NOT NULL)
);


-- 1. crearea specificatiilor obiectului
-- 2. crearea corpului obiectului
-- 3. crearea tabelelor pe baza tipurilor de obiecte
-- 4. apelul metodelor tipurilor de obiecte
CREATE OR REPLACE TYPE obj_utilizatori AS OBJECT (
    id_user NUMBER(10),
    cnp VARCHAR2(13),
    nume VARCHAR2(50),
    email VARCHAR2(25),
    date_login obj_autentificare,
    adresa obj_adresa,
    
    MEMBER FUNCTION verifica_email(p_id NUMBER) RETURN BOOLEAN
) NOT FINAL;


CREATE TABLE t_utilizatori OF obj_utilizatori;


CREATE TYPE BODY obj_utilizatori AS
    MEMBER FUNCTION verifica_email (
        p_id NUMBER
    ) RETURN BOOLEAN IS
        var t_utilizatori.email%TYPE;
    BEGIN
        SELECT
            email
        INTO var
        FROM
            t_utilizatori
        WHERE
            id_user = p_id;

        IF var LIKE '%@%.%' THEN
            RETURN true;
        ELSE
            RETURN false;
        END IF;
    END;

END;



CREATE OR REPLACE TYPE obj_cursanti UNDER obj_utilizatori (
    data_nasterii DATE,
    MEMBER PROCEDURE adauga_cursant
);


CREATE TABLE t_cursanti OF obj_cursanti;



CREATE OR REPLACE TYPE BODY obj_cursanti AS
MEMBER PROCEDURE adauga_cursant IS
    var t_cursanti.id_user%TYPE;
    
    BEGIN
        SELECT
            NVL(MAX(id_user), 0) + 1 INTO var
        FROM
            t_cursanti;
            
        INSERT INTO
            t_cursanti 
        VALUES
            (var, cnp, nume, email, date_login, adresa, data_nasterii);
    END;
END;


DECLARE
    cursant1 obj_cursanti;
    cursant2 obj_cursanti;
BEGIN
    cursant1 := obj_cursanti(1, 
                            21321321, 
                            'Ion', 
                            'ion@ion.com', 
                            obj_autentificare('Gigi', 'pass'), 
                            obj_adresa('Mosilor', 22, '2121', 'Bucuresti'), 
                            SYSDATE);
    cursant2 := obj_cursanti(1, 
                            2121212, 
                            'gigel', 
                            'asd@ase.com', 
                            obj_autentificare('gigel', 'parola'), 
                            obj_adresa('Mosilor', 22, '2121', 'Bucuresti'), 
                            SYSDATE);
    cursant1.adauga_cursant;                                                    
    cursant2.adauga_cursant;
END;


SELECT * FROM t_cursanti;
 
 
DECLARE
    ob1 obj_autentificare;
BEGIN
    SELECT 
        date_login INTO ob1 
    FROM 
        t_cursanti 
    WHERE 
        id_user = 1;
        
    dbms_output.put_line(ob1.username);
END;





