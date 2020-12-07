-- basic looping through a cursor
DECLARE
    CURSOR cur_emps IS
		SELECT
			first_name,
			last_name,
			salary
		FROM
			employees
		ORDER BY
			salary DESC;

    v_emp_rec   cur_emps%ROWTYPE;
BEGIN
    OPEN cur_emps;
	  
    LOOP
        FETCH cur_emps INTO v_emp_rec;
        EXIT WHEN cur_emps%NOTFOUND;
        
        dbms_output.put_line(v_emp_rec.first_name
                             || ' '
                             || v_emp_rec.last_name
                             || ' - '
                             || v_emp_rec.salary || ' $');
    END LOOP;

    CLOSE cur_emps;
END;

-- FOR loop through a cursor

DECLARE
    CURSOR cur_emps IS
		SELECT
			first_name,
			last_name,
			salary
		FROM
			employees
		ORDER BY
			salary DESC;
BEGIN
    FOR v_emp_rec IN cur_emps LOOP
        
        dbms_output.put_line(v_emp_rec.first_name
                             || ' '
                             || v_emp_rec.last_name
                             || ' - '
                             || v_emp_rec.salary || ' $');
		-- optional EXIT:
		-- EXIT WHEN cur_emps%ROWCOUNT > 4;
		
    END LOOP;
END;

-- 


