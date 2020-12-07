USER_* = info about objects that you own, usually because you created them
	USER_TABLES
	USER_INDEXES
	
ALL_* = info about objects that you have privileges to use
	Will include USER_* as a subset
	ALL_TABLES
	ALL_INDEXES
	
DBA_* = info about everything in the database, no matter who owns them
	DBA_TABLES
	DBA_INDEXES


	
DESCRIBE ALL_TABLES


SELECT 
	*
FROM 
	ALL_TABLES;


	
SELECT
    COUNT(8)
FROM
    dict
WHERE
    table_name LIKE 'USER%';
	


SELECT 
	object_name
FROM	
	USER_OBJECTS
WHERE
	object_type = 'FUNCTION';
	

AUTHID CURRENT_USER (invoker's right)
object names are resolved in the invoker's schema




-- 	Which view would you query to see the detailed code of a procedure?
	USER_SOURCE 
	
--	You want to see the names, modes, and data types of the formal parameters 
--  of function MY_FUNC in your schema. How can you do this?
DESCRIBE my_func; 	--or
Query USER_SOURCE