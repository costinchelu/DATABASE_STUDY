-- Example of explicit cursor:
-- list codes and names of departments
SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_dept IS
        SELECT
            department_id,
            department_name
         FROM
            departments;
			
    v_department_id     departments.department_id%TYPE;
    v_department_name   departments.department_name%TYPE;
BEGIN
    OPEN c_dept;
	
    LOOP
        FETCH c_dept INTO v_department_id, v_department_name;
        EXIT WHEN c_dept%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_department_id || ' ' || v_department_name);
    END LOOP;
	
    CLOSE c_dept;
END;


-- Cursors and records
DECLARE
    CURSOR cur_emps IS
		SELECT
			*
		FROM
			employees
		WHERE
			department_id = 90
			AND salary > 20000;
	
	v_emp_record cur_emps%ROWTYPE;
BEGIN
    OPEN cur_emps;
	
    LOOP									--no loop needed if it's just a record
        FETCH cur_emps INTO v_emp_record;
        EXIT WHEN cur_emps%NOTFOUND;		--if no loop then no exit clause
        dbms_output.put_line(v_emp_record.employee_id
                             || ' '
                             || v_emp_record.first_name
                             || ' '
                             || v_emp_record.last_name
                             || ' ...');

    END LOOP;

    CLOSE cur_emps;
END;

-- For a user defined cursor:
DECLARE
    CURSOR cur_emps_dept IS
		SELECT
			e.first_name,
			e.last_name,
			d.department_name
		FROM
			employees     e,
			departments   d
		WHERE
			e.department_id = d.department_id;

    v_emps_dept_record cur_emps_dept%ROWTYPE;
BEGIN
    OPEN cur_emps_dept;
    LOOP
        FETCH cur_emps_dept INTO v_emps_dept_record;
        EXIT WHEN 
			cur_emps_dept%ROWCOUNT > 10 
			OR 
			cur_emps_dept%NOTFOUND;
        
		dbms_output.put_line(v_emps_dept_record.first_name
                             || ' '
                             || v_emps_dept_record.last_name
                             || ' - '
                             || v_emps_dept_record.department_name);

    END LOOP;

    CLOSE cur_emps_dept;
END;

/*
EXPLICIT CURSOR ATTRIBUTES

%ISOPEN (boolean) = true, if cursor is open

usually used before performing a fetch to test wether the cursor is open
*/
IF NOT cur_emps%ISOPEN THEN
	OPEN cur_emps;
END IF;
LOOP
	FETCH...
/*	
%NOTFOUND (boolean) = true, if recent fetch didn't return a row
%FOUND (boolean) = opposite to NOTFOUND
%ROWCOUNT (number) = evaluates the total rows fetched so far.

Usually NOTFOUND and ROWCOUNT are used in a loop to determine when to exit the loop

ROWCOUNT is also used to process an exact number of rows and to count the no of rows
fetched so far in a loop and/or determine when to exit the loop
*/

-- Example using %ROWCOUNT and %NOTFOUND
DECLARE
    CURSOR cur_emps IS
    SELECT
        employee_id,
        last_name
    FROM
        employees;

    v_emp_record cur_emps%rowtype;
BEGIN
    OPEN cur_emps;
    LOOP
        FETCH cur_emps INTO v_emp_record;
        EXIT WHEN cur_emps%rowcount > 10 OR cur_emps%notfound;
        dbms_output.put_line(v_emp_record.employee_id
                            || ' '
                            || v_emp_record.last_name);
    END LOOP;

    CLOSE cur_emps;
END;

-- Cursor FOR loops
DECLARE
    CURSOR cur_emps IS
    SELECT
        employee_id,
        last_name
    FROM
        employees
    WHERE
        department_id = 50
	ORDER BY last_name;

BEGIN
    FOR v_emp_record IN cur_emps LOOP
		EXIT WHEN cur_emps%ROWCOUNT > 5;
        dbms_output.put_line(v_emp_record.employee_id
                             || ' '
                             || v_emp_record.last_name);
    END LOOP;
END;
/*
No variable are declared to hold the fetched data and no INTO clause is required.
OPEN and CLOSE statements are not required, they happen automatically.
The scope of the implicit record is restricted to the loop, so you cannot reference
the record outside the loop
*/
-- cursor FOR loops using subqueries
BEGIN
    FOR v_emp_record IN
        (SELECT
            employee_id,
            last_name
        FROM
            employees
        WHERE
            department_id = 50
        ORDER BY last_name)
    LOOP
        dbms_output.put_line(v_emp_record.employee_id
                             || ' '
                             || v_emp_record.last_name);
    END LOOP;
END;
-- in this case we cannot reference explicit cursor attributes such as %rowcount

-- Cursors with parameters
DECLARE
    CURSOR cur_country (p_region_id NUMBER) IS
    SELECT
        country_id,
        country_name
    FROM
        countries
    WHERE
        region_id = p_region_id
    ORDER BY country_id;

    v_country_record cur_country%rowtype;
BEGIN

	dbms_output.put_line('SOUTH AMERICA:');
	
    OPEN cur_country(5);
    LOOP
        FETCH cur_country INTO v_country_record;
        EXIT WHEN cur_country%notfound;
        dbms_output.put_line(v_country_record.country_id
                             || ' '
                             || v_country_record.country_name);
    END LOOP;

    CLOSE cur_country;
	
	dbms_output.put_line('EUROPE:');
	
	OPEN cur_country(155);
    LOOP
        FETCH cur_country INTO v_country_record;
        EXIT WHEN cur_country%notfound;
        dbms_output.put_line(v_country_record.country_id
                             || ' '
                             || v_country_record.country_name);
    END LOOP;

    CLOSE cur_country;
END;
-- we always specify the parameter type but not its size (so not like NUMBER(1) )

-- Cursor FOR loops with a parameter
DECLARE
    CURSOR cur_emps (p_deptno NUMBER) IS
		SELECT
			employee_id,
			last_name
		FROM
			employees
		WHERE
			department_id = p_deptno
		ORDER BY last_name;

BEGIN
    FOR v_emp_record IN cur_emps(10) LOOP
        dbms_output.put_line(v_emp_record.employee_id
                             || ' '
                             || v_emp_record.last_name);
    END LOOP;
END;

-- Cursor with multiple parameters
DECLARE
    CURSOR cur_countries ( p_region_id NUMBER,
                           p_population NUMBER) IS
		SELECT
			country_id,
			country_name,
			population
		FROM
			countries
		WHERE
			region_id = p_region_id
			AND 
			population > p_population
		ORDER BY 
			population DESC;

BEGIN 
    FOR v_country_record IN cur_countries(145, 10000000) LOOP 
        dbms_output.put_line( v_country_record.country_id
                              || ' '
                              || v_country_record.country_name
                              || ' '
                              || v_country_record.population);
    END LOOP;
END;

-- Cursor with multiple parameters
DECLARE
    CURSOR cur_emps (p_job VARCHAR2,
                     p_salary NUMBER) IS
		SELECT
			e.employee_id,
			e.last_name,
			d.department_name
		FROM
			employees     e
			JOIN 
			departments   d 
			ON 
			e.department_id = d.department_id
		WHERE
			e.job_id = p_job
			AND 
			e.salary > p_salary
		ORDER BY 
			e.employee_id;

BEGIN
    FOR v_emp_record 
	IN cur_emps('IT_PROG', 6000) 
	LOOP
        dbms_output.put_line(v_emp_record.department_name
                             || ' '
                             || v_emp_record.employee_id
                             || ' '
                             || v_emp_record.last_name);
    END LOOP;
END;

/*
We can lock rows  as we open the cursor in order to prevent other users 
from updating them.
*/


/*Declaring a cursor with the FOR UPDATE clause
(does not prevent other users from reading the rows)

keyword:
NOWAIT = returns an Oracle server error immediately (if rows have already been 
locked by another session)

WAIT n = waits for n seconds, and return the error if the other session is 
still locking the rows at the end of that time

if we omit NOWAIT keyword, the the Oracle server waits indefinetly until 
the rows are available.
*/
DECLARE
    CURSOR cur_emps IS
		SELECT
			employee_id,
			salary
		FROM
			my_employees
		WHERE
			salary <= 20000
    FOR UPDATE NOWAIT; 
	-- to lock just one column (FOR UPDATE OF salary NOWAIT)
    -- locking just one column would be necessary in case of a join

    v_emp_record cur_emps%ROWTYPE;
BEGIN
    OPEN cur_emps;
	
    LOOP
        FETCH cur_emps INTO v_emp_record;
        EXIT WHEN cur_emps%NOTFOUND;
		
        UPDATE 
			my_employees
        SET
            salary = v_emp_record.salary * 1.1
        WHERE
            CURRENT OF cur_emps;    
			-- is used in conjunction with FOR UPDATE to refer 
			-- to the current row
            -- (the most recently fetched row)
            -- is also used in UPDATE and DELETE statements
    END LOOP;

    CLOSE cur_emps;
END;


-- example with a join and FOR loop
DECLARE
    CURSOR cur_eds IS
		SELECT
			employee_id,
			salary,
			department_name
		FROM
			my_employees e,
			my_departments d
		WHERE
			e.department_id = d.department_id
    FOR UPDATE OF salary NOWAIT;

BEGIN
    FOR v_eds_record IN cur_eds
    LOOP
        UPDATE 
			my_employees
        SET
            salary = v_eds_record.salary * 1.1
        WHERE
            CURRENT OF cur_eds;  
			
    END LOOP;
END

/*
PROBLEM

You need to produce a report that lists each department as a sub-heading, 
immediately followed by a listing of the employees in that department, 
folowed by the next department, and so on.
*/
DECLARE
    CURSOR cur_dept IS
        SELECT 
            department_id,
            department_name
        FROM
            departments
        ORDER BY 
			department_name;
        
    CURSOR cur_emp(p_deptid NUMBER) IS 
	--we will open cur_emps several times (once for each department) and it must fetch a different set of rows each time
        SELECT
            first_name,
            last_name
        FROM
            employees
        WHERE
            department_id = p_deptid
        ORDER BY 
			last_name;
    
    v_dept_record cur_dept%ROWTYPE;
    v_emp_record cur_emp%ROWTYPE;
    
BEGIN
    OPEN cur_dept;
	
    LOOP
        FETCH cur_dept INTO v_dept_record;
        EXIT WHEN cur_dept%NOTFOUND;
		
        DBMS_OUTPUT.PUT_LINE(v_dept_record.department_name);
        
        OPEN cur_emp (v_dept_record.department_id);
		
        LOOP
            FETCH cur_emp INTO v_emp_record;
            EXIT WHEN cur_emp%NOTFOUND;
			
            DBMS_OUTPUT.PUT_LINE('  ' || 
                                 v_emp_record.last_name 
                                 || ' ' || 
								 v_emp_record.first_name);
        END LOOP;
		
        CLOSE cur_emp;
        
        -- the inner cur_emp executes once for each row fetched by cur_dept cursor and fetches a different subset of employees each time due to parameter p_deptid
        
    END LOOP;
	
    CLOSE cur_dept;
END;

/*
PROBLEM

You need to produce a report that lists each location in which your 
departments are situated, followed by the departments in that location.
*/
DECLARE
    CURSOR cur_loc IS
        SELECT
            *
        FROM
            locations;
            
    CURSOR cur_dept (p_locid NUMBER) IS
        SELECT 
            *
        FROM
            departments
        WHERE 
			location_id = p_locid;
    
    v_loc_record cur_loc%ROWTYPE;
    v_dept_record cur_dept%ROWTYPE;
    
BEGIN
    OPEN cur_loc;
	
    LOOP
        FETCH cur_loc INTO v_loc_record;
        EXIT WHEN cur_loc%NOTFOUND;
		
        DBMS_OUTPUT.PUT_LINE(v_loc_record.city);
        
        OPEN cur_dept (v_loc_record.location_id);
        LOOP
            FETCH cur_dept INTO v_dept_record;
            EXIT WHEN cur_dept%NOTFOUND;
			
            DBMS_OUTPUT.PUT_LINE('  ' || 
                                 v_dept_record.department_name);
                                 
        END LOOP;
        CLOSE cur_dept;
        
    END LOOP;
	
    CLOSE cur_loc;
END;

-- FOR loop version
DECLARE
    CURSOR cur_loc IS
        SELECT
            *
        FROM
            locations;
            
    CURSOR cur_dept (p_locid NUMBER) IS
        SELECT 
            *
        FROM
            departments
        WHERE 
			location_id = p_locid;
    
BEGIN
    FOR v_loc_rec IN cur_loc
    LOOP
        DBMS_OUTPUT.PUT_LINE(v_loc_rec.city);
        
        FOR v_dept_rec IN cur_dept (v_loc_rec.location_id)
        LOOP
            DBMS_OUTPUT.PUT_LINE('  ' || 
                                 v_dept_rec.department_name);
                                 
        END LOOP;
        
    END LOOP;
END;


--script for droping several tables:
BEGIN
  FOR rec IN(SELECT table_name 
              FROM   all_tables 
              WHERE  table_name LIKE '%ABC_%'
             )
  LOOP
    EXECUTE IMMEDIATE 'drop table ' || rec.table_name;
  END LOOP;             
END;



--------------------



-- CURSOR IMPLICIT
--Se șterge din tabela REGIUNI, regiunea a cărei ID este introdus de utilizator 
--prin intermediul variabilei de substituție g_rid. 
--Mesajul este afișat folosind variabila de mediu nr_sters.

ACCEPT g_rid PROMPT 'Introduceti id-ul regiunii:'

VARIABLE nr_sters VARCHAR2(100)

DECLARE 
BEGIN
    DELETE FROM regiuni
    WHERE
        id_regiune = &g_rid;

    :nr_sters := TO_CHAR(SQL%rowcount)
                 || ' INREGISTRARI STERSE';
END;
/


            -- CURSOR EXPLICIT
            -- varianta BASIC


--Să se afişeze lista cu numele şi salariul angajaţilor 
--din departamentul 60 folosind un cursor explicit și trei variabile 
SET SERVEROUTPUT ON

DECLARE
    CURSOR ang_cursor IS                --(I)
		SELECT
			id_angajat,
			nume,
			salariul
		FROM
			angajati
		WHERE
			id_departament = 60;

    ang_id     angajati.id_angajat%TYPE;
    ang_nume   angajati.nume%TYPE;
    ang_sal    angajati.salariul%TYPE;
BEGIN
    dbms_output.put_line('Lista cu salariariile angajatilor din departamentul 60');
    OPEN ang_cursor;                --(II)
    LOOP                            --(III)
        FETCH ang_cursor INTO       --(IV)
            ang_id,
            ang_nume,
            ang_sal;
        EXIT WHEN ang_cursor%NOTFOUND;
        dbms_output.put_line('Salariatul '
                             || ang_nume
                             || ' are salariul: '
                             || ang_sal);
    END LOOP;

    CLOSE ang_cursor;               --(V)
END;
/
-- sau folosind ROWTYPE
DECLARE
    CURSOR ang_cursor IS
    SELECT
        id_angajat,
        nume,
        salariul
    FROM
        angajati
    WHERE
        id_departament = 60;

    ang_rec     ang_cursor%ROWTYPE;     --tipul record definit cu %ROWTYPE pt incarcarea valorilor cursorului
BEGIN
    dbms_output.put_line('Lista cu salariariile angajatilor din departamentul 60');
    OPEN ang_cursor;
    LOOP
        FETCH ang_cursor INTO ang_rec;
        EXIT WHEN ang_cursor%NOTFOUND;
        dbms_output.put_line('Salariatul '
                             || ang_rec.nume
                             || ' are salariul: '
                             || ang_rec.salariul);

    END LOOP;

    CLOSE ang_cursor;
END;
/

--tot BASIC, dar folosind un FOR LOOP (pentru selectia nr de randuri)
--să se încarce în tabela MESAJE primii 5 angajaţi (id şi nume)
CREATE TABLE mesaje (
    cod    VARCHAR2(7),
    nume   VARCHAR2(20)
);

DECLARE
    v_id     angajati.id_angajat%TYPE;
    v_nume   angajati.nume%TYPE;
	
    CURSOR c1 IS
    SELECT
        id_angajat,
        nume
    FROM
        angajati;

BEGIN
    OPEN c1;
	
    FOR i IN 1..5 LOOP
        FETCH c1 INTO
            v_id,
            v_nume;
        INSERT INTO mesaje VALUES (
            v_id,
            v_nume
        );
    END LOOP;

    CLOSE c1;
END;
/


SELECT
    *
FROM
    mesaje;
--in locul FOR LOOP se poate folosi ROWCOUNT
DECLARE
    v_id     angajati.id_angajat%TYPE;
    v_nume   angajati.nume%TYPE;
	
    CURSOR c1 IS
    SELECT
        id_angajat,
        nume
    FROM
        angajati;

BEGIN
    OPEN c1;
	
    LOOP
        FETCH c1 INTO
            v_id,
            v_nume;
        EXIT WHEN c1%rowcount > 5 OR c1%notfound;
        INSERT INTO mesaje VALUES (
            v_id,
            v_nume
        );

    END LOOP;

    CLOSE c1;
END;
/

--exemplu mai complex
--Să se afişeze primele 3 comenzi care au cele mai multe 
--produse comandate. În acest caz înregistrările 
--vor fi ordonate descrescător în funcţie de numărul 
--produselor comandate
DECLARE
    CURSOR c_com IS
		SELECT
			c.nr_comanda,
			CAST(c.data AS DATE) data, 
			--coloana data este transformata din TIMESTAMP in DATA
			COUNT(r.id_produs) numar
		FROM
			comenzi        c,
			rand_comenzi   r
		WHERE
			c.nr_comanda = r.nr_comanda
		GROUP BY
			c.nr_comanda,
			c.data
		ORDER BY
			COUNT(r.id_produs) DESC;

    rec_com         c_com%rowtype;
BEGIN
    dbms_output.put_line('Numarul de produse pentru fiecare comanda:');
    IF NOT c_com%isopen THEN
        OPEN c_com;
    END IF;
    LOOP
        FETCH c_com INTO rec_com;
        EXIT WHEN c_com%notfound OR c_com%rowcount > 3;
        dbms_output.put_line('Comanda '
                             || rec_com.nr_comanda
                             || ' data pe '
                             || rec_com.data
                             || ' are: '
                             || rec_com.numar
                             || ' produse');

    END LOOP;

    CLOSE c_com;
END;
/


            -- CURSOR EXPLICIT
            -- varianta parcurgerii cu FOR LOOP

FOR nume_record IN nume_cursor LOOP
	--------------------------------------------------------
END LOOP;
--În acest caz, tipul RECORD nu trebuie declarat. 
--Se realizează în mod implicit deschiderea, 
--încărcarea și închiderea cursorului. 


DECLARE
    CURSOR ang_cursor IS
    SELECT
        id_angajat,
        nume,
        salariul
    FROM
        angajati
    WHERE
        id_departament = 60;

BEGIN
    dbms_output.put_line('Lista cu salariariile angajatilor din departamentul 60');
    FOR ang_rec IN ang_cursor 
    LOOP dbms_output.put_line('Salariatul '
                                || ang_rec.nume
                                || ' are salariul: '
                                || ang_rec.salariul);
    END LOOP;

END;
/
--se poate folosi si un cursor anonim
--Să se afişeze suma aferentă salariilor din fiecare departament:
BEGIN
    dbms_output.put_line('Total salarii pe fiecare departament:');
    FOR dep_rec IN (
        SELECT
            d.id_departament dep,
            SUM(a.salariul) sal
        FROM
            angajati       a,
            departamente   d
        WHERE
            a.id_departament = d.id_departament
        GROUP BY
            d.id_departament
    ) LOOP dbms_output.put_line('Departamentul '
                                || dep_rec.dep
                                || ' are de platit salarii in valoare de: '
                                || dep_rec.sal
                                || ' RON');
    END LOOP;

END;
/

--CURSORI CU PARAMETRU:
--Să se afişeze produsele al căror valoarea totală comandată este 
--mai mare decât valoarea totală a comenzilor pentru produsul 3134.
DECLARE
    CURSOR c_prod ( p_val NUMBER ) IS
		SELECT
			p.id_produs,
			p.denumire_produs,
			SUM(r.cantitate * r.pret) total
		FROM
			produse        p,
			rand_comenzi   r
		WHERE
			p.id_produs = r.id_produs
		GROUP BY
			p.id_produs,
			p.denumire_produs
		HAVING
			SUM(r.cantitate * r.pret) > p_val
		ORDER BY
			total DESC;

    v_val      NUMBER(5);
    rec_prod   c_prod%rowtype;
BEGIN
    SELECT
        SUM(pret * cantitate)
    INTO v_val
    FROM
        rand_comenzi
    WHERE
        id_produs = 3134;

    dbms_output.put_line('Produsele al caror cantitate vândută este mai mare decat ' || v_val);
    IF NOT c_prod%isopen THEN
        OPEN c_prod(v_val);
    END IF;
    LOOP
        FETCH c_prod INTO rec_prod;
        EXIT WHEN c_prod%notfound;
        dbms_output.put_line('Din produsul '
                             || rec_prod.id_produs
                             || ', '
                             || rec_prod.denumire_produs
                             || ', vanzarile au fost in valoare de '
                             || rec_prod.total
                             || ' u.m.');

    END LOOP;

    CLOSE c_prod;
END;
/

--Să se afişeze pentru fiecare comanda produsele comandate. 
--În acest caz se utilizează două variabile de tip cursor. 
--Vom folosi parcurgerea cursorului cu FOR:
DECLARE
--cursorul care va prelua comenzile incheiate
    CURSOR c_com IS
    SELECT
        nr_comanda,
        data
    FROM
        comenzi
    WHERE
        modalitate = 'online'
    ORDER BY
        nr_comanda;

--cursorul care, pentru fiecare comanda, va afisa produsele din cadrul acesteia, ordonate descrescator

    CURSOR c_prod (
        p_nr_comanda NUMBER
    ) IS
    SELECT
        r.id_produs,
        p.denumire_produs,
        r.cantitate
    FROM
        produse        p,
        rand_comenzi   r
    WHERE
        p.id_produs = r.id_produs
        AND r.nr_comanda = p_nr_comanda
    ORDER BY
        r.id_produs DESC;

BEGIN
    FOR rec_com IN c_com LOOP
        dbms_output.put_line('Comanda '
                             || rec_com.nr_comanda
                             || ' incheiata la data de '
                             || rec_com.data);

        FOR rec_prod IN c_prod(rec_com.nr_comanda) LOOP --cursorul primeste drept parametru numarul comenzii care a fost afisata

         dbms_output.put_line('Din produsul '
                                || rec_prod.id_produs
                                || ', '
                                || rec_prod.denumire_produs
                                || ', s-au comandat '
                                || rec_prod.cantitate
                                || ' bucati');
        END LOOP;

        dbms_output.put_line('============');
    END LOOP;
END;
/

--

--exemplu cu clauza FOR UPDATE si WHERE CURRENT OF
DECLARE
    CURSOR c_situatie IS
    SELECT
        cod,
        valoare,
        tva
    FROM
        situatie
    FOR UPDATE OF tva NOWAIT;

BEGIN
    FOR rec_situatie IN c_situatie LOOP
        UPDATE situatie
        SET
            tva = valoare * 0.19
        WHERE
            CURRENT OF c_situatie;

        dbms_output.put_line('Comanda '
                             || rec_situatie.cod
                             || ' are valoarea totala de '
                             || rec_situatie.valoare
                             || ' RON si tva de: '
                             || rec_situatie.tva);

    END LOOP;
END;
/
