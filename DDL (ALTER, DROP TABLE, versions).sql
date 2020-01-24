-- DDL = DATA DEFINITION LANGUAGE


--          ALTER TABLE
--ADD one or more columns:
ALTER TABLE my_movie_collection 
    ADD (
        title          VARCHAR2(30),
        release_date   DATE DEFAULT SYSDATE,
        movie_cost     NUMBER(5, 2)
        );

--MODIFY a column (data type, size, DEFAULT value):

ALTER TABLE my_movie_collection
    MODIFY (
            title        VARCHAR2(35),
            movie_cost   NUMBER(5)
            );

--can decrease the width of a NUMBER column 
--		if it contains only null values, or has no rows
--VARCHAR -> can be decreased down to the 
--			largest value contained in the column
--data type can be changed only if the column has null values
--a change to the default value of a column afeects only later insertions

--DROP a column

ALTER TABLE my_movie_collection
DROP COLUMN release_date;

--a column containing data may be dropped
--but only one column at a time
--and at least one column must remain in the table
--as you cannot have a table with no columns
--dropping the column, data contained in it is lost and unrecoverable

--SET UNUSED for a column
-- usefull when a table is very large and dropping the column
--takes too much time. setting the column unused, will render the column
--unseen by sql and at later time all the unused columns can be removed
--(as we want to reclaim storage space)

ALTER TABLE my_movie_collection 
    SET UNUSED ( release_date );

ALTER TABLE my_movie_collection 
    DROP UNUSED COLUMNS;
	
--DROPPING TABLE
DROP TABLE my_movie_collection;

--DROPPING TABLE removing all constraints
DROP TABLE my_movie_collection CASCADE CONSTRAINTS;

--script for droping several tables:
begin
  for rec in (select table_name 
              from   all_tables 
              where  table_name like '%ABC_%'
             )
  loop
    execute immediate 'drop table '||rec.table_name;
  end loop;             
end;
/

--will get whole table to USER_RECYCLEBIN

--queering USER_RECYCLEBIN:
SELECT
    original_name,
    operation,
    droptime
FROM
    user_recyclebin;

--getting back table data from user_recyclebin:
FLASHBACK TABLE my_movie_collection TO BEFORE DROP;

--to safely drop a table we can use the PURGE command:
DROP TABLE my_movie_collection PURGE;

--to RENAME a table:
RENAME my_movie_collection TO movie_collection;

--to permanently delete all the rows of a table:
TRUNCATE TABLE employees;

--to COMMENT on a table or a column:
COMMENT ON COLUMN employees.employee_id 
IS 'ID of the employee';

--to view available comments in the data dictionary:
SELECT employees, comments
FROM user_tab_comments;

--for version control we can use constructions as follows:
SELECT employee_id, first_name, last_name, salary,
	versions_operation "OPERATION",
	versions_starttime "START DATE",
	versions_endtime "END DATE",
FROM employees
	VERSIONS BETWEEN SCN MINVALUE AND MAXVALUE
WHERE employee_id = 1;
--in this case we can see all modifications done for employee
--1 (for example salary value)



