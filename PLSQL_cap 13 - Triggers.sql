/*
	Sunt asociati cu o tabela, view, schema sau database
	Sunt stocaţi în baza de date
	Se execută când are loc un eveniment. Tipuri de evenimente: 
	operatii LMD pe o tabela (insert/ update/ delete)
	operatii LMD pe o tabela virtuala (view) cu clauza INSTEAD OF
	operatii LDD (Create, Alter, Drop) la nivel de database sau schema
	evenimente la nivelul schemei sau bazei de date (shutdown sau logon/off)
	Se folosesc pentru gestionarea restricţiilor de integritate complexe, monitorizare, 
	centralizarea operatiilor. 
	Nu se recomanda construirea in exces a triggerilor.
	Pentru fiecare trigger se stabileşte:
			comanda care-l declanşează (insert| update| delete) - 
				Un trigger poate fi declanşat de mai multe comenzi
			momentul de timp la care se declanşează (before| after| instead of). 
				Pentru view se utilizeaza instead of, actiunile DML 
				vor fi inlocuite de corpul triggerului si vor fi afectate 
				tabelele din care este construit view-ul.
			nivelul (row| statement) - dacă triggerul este la nivel de rând 
				se execută pentru fiecare rând afectat de comenzile: 
				insert| update| delete. 
				Daca nu este afectat nici un rand triggerul nu se executa.
			Dimensiunea unui trigger nu poate depasi 32 kb! 
				Se poate include apelul unei proceduri in corpul triggerului 
				pentru a micsora dimensiunea acestuia.

	Pentru a vedea erorile la compilare:

				SHOW ERRORS TRIGGER nume_trigger;

	Sintaxa de creare a unui trigger:

				CREATE [OR REPLACE] TRIGGER nume_trigger
				[BEFORE| AFTER| INSTEAD OF] 
				[INSERT| [OR] | UPDATE [OF coloana,…]| [OR] | DELETE] 
				ON tabela
				[FOR EACH ROW ] 
				[WHEN conditie]
				corp_trigger

Corp_trigger poate fi un bloc PL/SQL (Begin…End)  sau un apel de procedura. 
Procedura poate fi implementata in PL/SQL, C sau JAVA, iar apelul se realizeaza: 

				CALL nume_proc (fara ; dupa numele sau!!!)


TIMING of triggers:
	BEFORE
	AFTER
	INSTEAD OF
	
    
EVENTS of triggers:
	INSERT
	UPDATE
	DELETE
(we can use OR to put more events)


We can use :old. :new.
or in some cases:
REFERENCING OLD as former NEW as latter
				:former. :latter:

*/

--example of trigger:
--after a salary modification, a trigger writes to log_table
CREATE OR REPLACE TRIGGER log_sal_change_trigg
	AFTER UPDATE OF salary ON employees
BEGIN	
	INSERT INTO log_table (
		user_id, 
		logon_date
	) VALUES (
		USER, 
		SYSDATE
	);
END;


--another DML trigger:
CREATE OR REPLACE TRIGGER log_dept_changes
	AFTER INSERT OR UPDATE OR DELETE ON departments
BEGIN
	INSERT INTO log_dept_table (
		which_user, 
		when_done
	) VALUES (
		USER, 
		SYSDATE
	);
END;


--trigger to create logging record automatically (after creating logging table)
CREATE TABLE log_table (
    user_id      VARCHAR2(30),
    logon_date   DATE
);

CREATE OR REPLACE TRIGGER logon_trigg 
	AFTER LOGON ON DATABASE 
BEGIN
    INSERT INTO log_table (
        user_id,
        logon_date
    ) VALUES (
        USER,
        SYSDATE
    );
END;


-- check trigger (insert in employees only on work days) (always a BEFORE trigger)
CREATE OR REPLACE TRIGGER secure_emp
	BEFORE INSERT ON employees
BEGIN
	IF TO_CHAR(SYSDATE, 'DY') IN ('SAT', 'SUN') THEN
		RAISE_APPLICATION_ERROR(-20500, 
				'You may insert into EMPLOYEES table only during business hours');
	END IF;
END;
--and the version with conditional predicates:
CREATE OR REPLACE TRIGGER secure_emp
	BEFORE INSERT OR UPDATE OR DELETE ON employees
BEGIN
	IF TO_CHAR(SYSDATE, 'DY') IN ('SAT', 'SUN') THEN
		IF DELETING THEN 
			RAISE_APPLICATION_ERROR(-20501, 
				'You may delete from EMPLOYEES table only during business hours');
		ELSIF INSERTING THEN 
			RAISE_APPLICATION_ERROR(-20502,
				'You may insert into EMPLOYEES table only during business hours');
		ELSIF UPDATING THEN
			RAISE_APPLICATION_ERROR(-20503,
				'You may update EMPLOYEES table only during business hours');
		END IF;
	END IF;
END;
--trigger keywords deleting, ... are declared boolean variables
--for tesing UPDATE on specific columns:
CREATE OR REPLACE TRIGGER secure_emp
	BEFORE UPDATE ON employees
BEGIN
	IF UPDATING ('SALARY') THEN
		IF TO_CHAR(SYSDATE, 'DY') IN ('SAT', 'SUN') THEN
		RAISE_APPLICATION_ERROR(-20501,
			'You may not update SALARY on the weekend');
		END IF;
	ELSIF UPDATING('JOB_ID') THEN
		IF TO_CHAR(SYSDATE, 'DY') = 'SUN' THEN
		RAISE_APPLICATION_ERROR(-20502,
			'You may not update JOB_ID on Sunday');
		END IF;
	END IF;
END;
--the trigger will allow other columns of EMPLOYEES to be updated at any time




--business rule: no-employee's job can be changed to a job that the employee has 
--already done in the past (ROW TRIGGER)
CREATE OR REPLACE TRIGGER check_sal_trigg 
	BEFORE UPDATE OF job_id ON employees
    FOR EACH ROW
DECLARE
    v_job_count INTEGER;
BEGIN
    SELECT
        COUNT(*)
    INTO v_job_count
    FROM
        job_history
    WHERE
        employee_id = :old.employee_id
        AND job_id = :new.job_id;

    IF v_job_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20201, 'This employee has already done this job');
    END IF;
END;
/*
this business rule cannot be enforced using a check constraint because you cannot
code subqueries in a constraint definition.
To enforce this business rule requires a trigger to be used.
*/

--another ROW TRIGGER example:
CREATE OR REPLACE TRIGGER log_emps
	AFTER UPDATE OF salary ON employees 
	FOR EACH ROW
BEGIN
	INSERT INTO log_emp_table 
		(who, when, which_employee, old_salary, new_salary)
	VALUES 
		(USER, SYSDATE, :OLD.employee.id, :OLD.salary, :NEW.salary);
END;


--another example of ROW TRIGGER
CREATE OR REPLACE TRIGGER audit_emp_values AFTER
    DELETE OR INSERT OR UPDATE ON employees
    FOR EACH ROW
BEGIN
    INSERT INTO audit_emp (
        user_name,
        time_stamp,
        empl_id,
        old_last_name,		--old values are actually NULL
        new_last_name,
        old_title,
        new_title,
        old_salary,
        new_salary
    ) VALUES (
        USER,
        SYSDATE,
        :old.employee_id,
        :old.last_name,
        :new.last_name,
        :old.job_id,
        :new.job_id,
        :old.salary,
        :new.salary
    );
END;


--prevent employees who are not a president or vice presizent from having a salary > 15000
CREATE OR REPLACE TRIGGER restrict_salary BEFORE
    INSERT OR UPDATE OF salary ON employees
    FOR EACH ROW
BEGIN
    IF NOT ( :new.job_id IN (
        'AD_PRES',
        'AD_VP'
    ) ) AND :new.salary > 15000 THEN
        raise_application_error(-20202, 'Employee '
                                        || :new.last_name
                                        || ' cannot earn more than $15,000.');
    END IF;
END;

--when updating:
UPDATE employees
SET
    salary = 15001
WHERE
    last_name IN (
        'King',
        'Davies'
    );
--we get:
/*
Error report -
ORA-20202: Employee Davies cannot earn more than $15,000.
ORA-06512: la "CHELUC_ID.RESTRICT_SALARY", linia 6
ORA-04088: eroare în timpul executiei triggerului 'CHELUC_ID.RESTRICT_SALARY'
*/


--using WHEN (for condition)
CREATE OR REPLACE TRIGGER higher_salary AFTER
    UPDATE OF salary ON employees
    FOR EACH ROW
    WHEN ( new.salary > old.salary )		-- correlation names not prefixed with :
BEGIN
    INSERT INTO log_emp_table (
        who,
        when_updated,
        which_employee,
        old_salary,
        new_salary
    ) VALUES (
        user,
        SYSDATE,
        :old.employee_id,
        :old.salary,
        :new.salary
    );

END;


--INSTEAD OF (always row triggers)
/*
•	Sunt triggeri realizati doar pentru view-uri
•	Se utilizeaza pentru actualizarea tabelelor din care este construit un view neactualizabil. 
•	Realizeaza operatii DML pe aceste tabele, iar Oracle Server declanseaza triggerii 
		pe tabelele respective.
•	Daca un view este actualizabil, triggerii respectivi se declanseaza automat.
•	Sunt triggeri la nivel de rand.
•	Nu permit utilizarea clauzelor BEFORE|AFTER
*/

			--Creating first table
CREATE TABLE new_emps AS
	SELECT 
		employee_id,
		last_name,
		salary,
		department_id
	FROM 
		employees;

			--Creating second table
CREATE TABLE new_depts AS
	SELECT
		d.department_id,
		d.department_name,
		SUM(e.salary) dept_sal
	FROM
		employees e,
		departments d
	WHERE
		e.department_id = d.department_id
	GROUP BY
		d.department_id,
		d.department_name;			

			--Creating the view
CREATE VIEW emp_details AS
	SELECT
		e.employee_id,
		e.last_name,
		e.salary,
		e.department_id,
		d.department_name
	FROM
		new_emps e,
		new_depts d
	WHERE
		e.department_id = d.department_id;

			--Creating the INSTEAD OF trigger
CREATE OR REPLACE TRIGGER new_emp_dept
	INSTEAD OF INSERT ON emp_details
BEGIN
	INSERT INTO 
		new_emps
	VALUES (
		:NEW.employee_id,
		:NEW.last_name,
		:NEW.salary,
		:NEW.department_id
		);

	UPDATE
		new_depts
	SET dept_sal = dept_sal + :NEW.salary
	WHERE
		department_id = :NEW.department_id;

END;
	
			--Insertion will now correctly work
INSERT INTO 
    emp_details 
VALUES (
    9001,
    'ABBOTT',
    3000,
    10,
    'Administration'
    );
	
	
	
--Compound trigger example:
CREATE OR REPLACE TRIGGER log_emps FOR
    UPDATE OF salary ON copy_employees
COMPOUND TRIGGER
    TYPE t_log_emp IS
        TABLE OF log_table%ROWTYPE
         INDEX BY BINARY_INTEGER;
    log_emp_tab   t_log_emp;
    v_index       BINARY_INTEGER := 0;
    
    AFTER EACH ROW IS 
    BEGIN
        v_index := v_index + 1;
        log_emp_tab(v_index).employee_id := :old.employee.id;
        log_emp_tab(v_index).change_date := SYSDATE;
        log_emp_tab(v_index).salary := :new.salary;
    END AFTER EACH ROW;
    
    AFTER STATEMENT IS 
    BEGIN
        FORALL i IN log_emp_tab.first..log_emp_tab.last
            INSERT INTO log_table VALUES log_emp_tab ( i );
    END AFTER STATEMENT;
    
END log_emps;



------------------------



--Se creează un trigger 
--care asigură unicitatea codului produsului folosind valorile generate de o secvenţă:

CREATE SEQUENCE produse_secv 
    START WITH 1 
    INCREMENT BY 1 
    MAXVALUE 100 
    NOCYCLE;


CREATE OR REPLACE TRIGGER generare_codprodus 
    BEFORE INSERT ON produse
    FOR EACH ROW
BEGIN
    SELECT
        produse_secv.NEXTVAL
    INTO :new.id_produs
    FROM
        dual;
END;
/

--Exemplu de trigger INSTEAD OF

		--crearea tabelei virtuale
CREATE OR REPLACE VIEW clienti_v AS
    SELECT
        cl.id_client,
        cl.prenume_client,
        cl.nume_client,
        cl.limita_credit,
        co.nr_comanda,
        co.data
    FROM
        clienti   cl,
        comenzi   co
    WHERE
        cl.id_client = co.id_client;

		--crearea triggerului
CREATE OR REPLACE TRIGGER exemplu_trigger 
	INSTEAD OF INSERT OR UPDATE OR DELETE ON clienti_v
    FOR EACH ROW
BEGIN
    IF inserting THEN
        INSERT INTO clienti (
            id_client,
            prenume_client,
            nume_client,
            limita_credit
        ) VALUES (
            :new.id_client,
            :new.prenume_client,
            :new.nume_client,
            :new.limita_credit
        );

        INSERT INTO comenzi (
            nr_comanda,
            data,
            id_client
        ) VALUES (
            :new.nr_comanda,
            :new.data,
            :new.id_client
        );

    ELSIF deleting THEN
        DELETE FROM comenzi
        WHERE
            nr_comanda = :old.nr_comanda;

    ELSIF updating('nume_client') THEN
        UPDATE clienti
        SET
            nume_client = :new.nume_client
        WHERE
            id_client = :old.id_client;

    ELSIF updating('data') THEN
        UPDATE comenzi
        SET
            data = :new.data
        WHERE
            nr_comanda = :old.nr_comanda;

    END IF;
END;
/

		--testare trigger
INSERT INTO 
	clienti_v 
VALUES (
    10,
    'Ioan',
    'Bucur',
    200,
    100,
    SYSDATE );

DELETE FROM 
	clienti_v
WHERE
    nume_client = 'Bucur';

UPDATE 
	clienti_v
SET
    nume_client = 'Popescu'
WHERE
    id_client = 20;
