ALTER SESSION 
SET 
	"_ORACLE_SCRIPT"=true;



CREATE USER 
	smith 
IDENTIFIED BY 
	password;
	
	
	
	
	
SELECT 
	username, 
	account_status 
FROM 
	dba_users
WHERE 
	username = 'SMITH';
	
	
	
GRANT 
	privilege-type 
ON 
	[TABLE] { table-Name | view-Name } 
TO 
	grantees;
	
	
	
GRANT	
	ALL PRIVILEGES
TO
	smith;
	
	
-- to drop a user (schema) - that has own objects:
DROP USER smith CASCADE;