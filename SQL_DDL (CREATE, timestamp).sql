 --simple CREATE TABLE syntax
CREATE TABLE my_friends (
    first_name   VARCHAR2(20),
    last_name    VARCHAR2(30),
    email        VARCHAR2(30),
    phone_num    VARCHAR2(13),
    birth_date   DATE
);

--creating external tables
CREATE TABLE emp_load (
    employee_number      CHAR(5),
    employee_dob         CHAR(20),
    employee_last_name   CHAR(20),
    employee_first_name  CHAR(15),
    employee_middle_name CHAR(15),
    employee_hire_date   DATE)
ORGANIZATION EXTERNAL 
        ( TYPE ORACLE_LOADER
           DEFAULT DIRECTORY def_dir1
           ACCESS PARAMETERS
        ( RECORDS DELIMITED BY NEWLINE
           FIELDS ( employee_number      CHAR( 2),
                    employee_dob         CHAR ( 18 ),
                    employee_last_name   CHAR ( 18 ),
                    employee_first_name  CHAR ( 11 ),
                    employee_middle_name CHAR ( 11 ),
                    employee_hire_date   CHAR ( 10 ) 
                        DATE_FORMAT DATE MASK "dd/mm/yyyy")) 
            LOCATION ('info.dat') );
            

--investigate indexes from data dictionary
SELECT
    *
FROM
    user_indexes;

--investigate sequences from data dictionary
SELECT
    *
FROM
    user_objects
WHERE
    object_type = 'SEQUENCE';
	

/* 
Timestamps

TIMESTAMP WITH TIME ZONE 
stores a time zone value as a displacement 
from Universal Coordinated Time
*/
CREATE TABLE time_example1 (
    first_column TIMESTAMP WITH TIME ZONE );

INSERT INTO time_example1 VALUES ( systimestamp );
--will give: 26-Dec-2018 00.03.25.123456 AM +02:00

/*
TIMESTAMP WITH LOCAL TIME ZONE
when this column is selected in an SQL statement,
the time zone is automatically converted to the 
selecting user's time zone 
*/

CREATE TABLE time_example2 (
    first_column TIMESTAMP WITH TIME ZONE,
    second_column TIMESTAMP WITH LOCAL TIME ZONE );

INSERT INTO time_example2
( first_column, second_column )
VALUES ( systimestamp );
-- first column will keep the value, but the second will show 
--time converted to local time

