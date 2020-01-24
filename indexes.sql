---------INDEXES---------
/*
Schema object that can speed up the retrieval of rows 
by using a pointer. If we don't have an index on the column
we'are selecting, a full table scan occurs.

Indexes are logically and physically independent
 of the table they index. Can be created and dropped without 
 having any effect on the base tables or other indexes.
 
 Dropping a table, will also drop corresponding indexes.
 
 We will create an index if columns 
	- contains a wide range of values 
	- or a large number of NULL values
	- when one or more columns are frequently used 
			together in a WHERE clause or a join condition.
	- when table is large and most queries are expected to
		receive less than 2-4% of the rows.
 
 To create an index, we must have the CREATE TABLE privilege.
 To create an index in any schema, we need CREATE ANY INDEX 
 privilege or CREATE TABLE privilege in the table we want to 
 create index.
 NULL values are not included in the index.
*/
CREATE INDEX wf_cont_reg_id_idx 
ON wf_coutries ( region_id );

--example creating composite index:
CREATE INDEX emps_name_idx
ON employees( first_name, last_name );

--quering indexes for confirmation:
SELECT DISTINCT 
		ic.index_name,
		ic.column_name,
		ic.column_position,
		id.uniqueness
FROM user_indexes id, user_ind_columns ic
WHERE id.table_name = ic.table_name
		AND ic.table_name = 'EMPLOYEES';
--we used USER_INDEXES data dictionary view joined with
--USER_IND_COLUMNS view

--example of function based index:
--in this example we created a function based index because we 
--don't know in what case the data is stored in DBA
CREATE INDEX upper_last_name_idx 
ON
    employees ( UPPER(last_name) );

	
SELECT
    *
FROM
    employees
WHERE
    UPPER(last_name) = 'KING';
--so, we allowed case-insensitive searches

--we must ensure that Oracle Server uses the index
--rather than full table scan by insuring that the value
--of the function is not null in subsequent queries:
SELECT
    *
FROM
    employees
WHERE
    upper(last_name) IS NOT NULL
ORDER BY
    upper(last_name);
    

--example when Oracle Server will use full table scan:
--(even if the hire_date column is indexed)
SELECT 
	first_name,
	last_name,
	hire_date
FROM employees
WHERE TO_CHAR( hire_date, 'YYYY' ) = '1987';
--example when Oracle Server will use a function based index:
CREATE INDEX emp_hire_year_idx
ON employees (TO_CHAR( hire_date, 'YYYY' ));

SELECT
	first_name,
	last_name,
	hire_date
FROM employees
WHERE TO_CHAR( hire_date,'YYYY' ) = '1987';


--indexes cannot be modified
--it must be dropped and then re-created
DROP INDEX upper_last_name_idx;
DROP INDEX emp_hire_year_idx;
DROP INDEX emps_name_idx;




