CREATE OR REPLACE FUNCTION get_salary (
    p_id   IN     employees.employee_id%TYPE
) RETURN NUMBER IS
    v_sal employees.salary%TYPE := 0;
BEGIN
    SELECT
        salary
    INTO v_sal
    FROM
        employees
    WHERE
        employee_id = p_id;

    RETURN v_sal;
END get_salary;


BEGIN
    dbms_output.put_line(get_salary(100));
END;

--or

DECLARE 
	v_sal employees.salary%TYPE;
BEGIN	
	v_sal := get_salary(100);
	dbms_output.put_line('Salary of employee_id 100 is ' || v_sal || '$');
END;



-- Verify validity of department number for an employee
CREATE OR REPLACE FUNCTION valid_dept (
    p_dept_no departments.department_id%TYPE
) RETURN BOOLEAN IS
    v_valid VARCHAR2(1);
BEGIN
    SELECT
        'x'
    INTO v_valid
    FROM
        departments
    WHERE
        department_id = p_dept_no;

    return(true);
EXCEPTION
    WHEN no_data_found THEN
        return(false);
    WHEN OTHERS THEN
        NULL;
END;



-- USER is a no parameter function (or SYSDATE)
BEGIN
	dbms_output.put_line(user);
END;



-- Create a function to determine each employee's taxes
CREATE OR REPLACE FUNCTION tax (
    p_value IN NUMBER
) RETURN NUMBER IS
BEGIN
    return(p_value * 0.08);
END tax;

--using the tax function:
SELECT
    employee_id,
    last_name,
    salary,
    tax(salary)
FROM
    employees
WHERE
    department_id = 50;
	
--using the tax function:
SELECT
    employee_id,
    tax(salary)
FROM
    employees
WHERE
    tax(salary) > (
        SELECT
            MAX(tax(salary))
        FROM
            employees
        WHERE
            department_id = 20
    )
ORDER BY
    tax(salary) DESC;
	
	

-- Example of handled exception in a procedure (program is not affected)
CREATE OR REPLACE PROCEDURE add_department (
    p_name   VARCHAR2,
    p_mgr    NUMBER,
    p_loc    NUMBER
) IS
BEGIN
    INSERT INTO departments (
        department_id,
        department_name,
        manager_id,
        location_id
    ) VALUES (
        departments_seq.NEXTVAL,
        p_nme,
        p_mgr,
        p_loc
    );

    dbms_output.put_line('Added department: ' || p_name);
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error adding department: ' || p_name);
END;
/*
The ADD_DEPARTMENT procedure creates a new department record by allocating 
a new department number from an Oracle sequence, and sets the department_name, 
manager_id, and location_id column values using the arguments of the p_name, 
p_mgr, and p_loc parameters, respectively. The procedure catches all raised 
exceptions in its own handler. 
The anonymous block makes three separate calls to the ADD_DEPARTMENT procedure.
The attempt to add an Editing department with manager_id of 99 is not successful 
because of a foreign key integrity constraint violation on the 
manager_id (manager_id must be a valid employee and there is no employee number 99 
in the EMPLOYEES table). 
Because the exception was handled in the ADD_DEPARTMENT procedure, 
the anonymous block continues to execute.
*/

-- Dropping procedures and functions
DROP PROCEDURE my_procedure;
DROP FUNCTION my_function;



------------------------



CREATE OR REPLACE FUNCTION verifica_salariul (
    p_id_angajat   IN             angajati.id_angajat%TYPE,
    p_sal_mediu    IN             NUMBER
) RETURN BOOLEAN IS
    v_salariul angajati.salariul%TYPE;
BEGIN
    SELECT
        salariul
    INTO v_salariul
    FROM
        angajati
    WHERE
        id_angajat = p_id_angajat;

    IF v_salariul > p_sal_mediu THEN
        RETURN true;
    ELSE
        RETURN false;
    END IF;
EXCEPTION
    WHEN no_data_found THEN
        RETURN NULL;
END;
/

DECLARE
    v_sal_mediu NUMBER;
BEGIN
--apelul procedurii pentru calculul salariului mediu:
    sal_mediu(v_sal_mediu);
    IF ( verifica_salariul(11, v_sal_mediu) IS NULL ) THEN
        dbms_output.put_line('Angajat cu ID invalid!');
    ELSIF ( verifica_salariul(11, v_sal_mediu) ) THEN
        dbms_output.put_line('Salariatul are salariul mai mare decat media!');
    ELSE
        dbms_output.put_line(' Salariatul are salariul mai mic decat media!');
    END IF;
END;
/