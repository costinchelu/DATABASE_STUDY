--Dynamic SQL with a DDL statement:
--in-line
CREATE OR REPLACE PROCEDURE drop_any_table(
	p_table_name 	VARCHAR2) IS

	BEGIN
		EXECUTE IMMEDIATE 'DROP TABLE ' || p_table_name;
	END;
	
--in a variable
CREATE OR REPLACE PROCEDURE drop_any_table(
	p_table_name 	VARCHAR2) IS
	
	v_dynamic_stmt 	VARCHAR2(50);

	BEGIN
		v_dynamic_stmt := 'DROP TABLE ' || p_table_name;
		EXECUTE IMMEDIATE v_dynamic_stmt;
	END;
	

--Dynamic SQL with a DML statement:
CREATE OR REPLACE FUNCTION del_rows(
	p_table_name 	VARCHAR2) RETURN NUMBER IS
	
	BEGIN
		EXECUTE IMMEDIATE 'DELETE FROM ' || p_table_name;
		RETURN SQL%ROWCOUNT;
	END;
--invoking the function:
DECLARE	
	v_count	NUMBER;

BEGIN
	v_count := del_rows('EMPLOYEE_NAMES');
	DBMS_OUTPUT.PUT_LINE(v_count || ' rows deleted.');
END;


--Dynamic SQL with a DML statement:
CREATE OR REPLACE PROCEDURE add_row(
	p_table_name	VARCHAR2,
	p_id			NUMBER,
	p_name			VARCHAR2) IS
	
	BEGIN
		EXECUTE IMMEDIATE 'INSERT INTO ' 
						  || p_table_name 
						  || 'VALUES('
						  || p_id
						  || ', '''
						  || p_name
						  || ''')';
	END;
	

BEGIN
	add_row('EMPLOYEE_NAMES', 250, 'Chang');
END;



			