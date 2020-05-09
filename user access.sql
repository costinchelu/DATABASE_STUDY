---------USER ACCESS---------
/*
+ control DB access
+ give access to specific objects in the DB
+ confirm given & received privileges withinthe Oracle data dictionary
+ create synonyms for DB objects

DB security _ system security
						creating users
						usernames
						passwords
						allocating disk space to users
						granting system privileges that users can perform
									like: creating tables
										  creating views
										  creating sequences
			_ data security
						object privileges 
									like: access to and use of DB objects
						                  actions that users have on objects

PRIVILEGE = right to execute particular	SQL statements

			users require sys privileges to gain access to DB
			users require object privileges to manipulate the content
				of the objects in the DB			
			users can be given the privilege to grant additional 
				privileges to other users (or to roles - which are
				named groups of related privileges)

SCHEMA = collection of objects, such as tables, views and sequences

		 owned by a DB user (also have the same name as that user)
		 
Examples of some system privileges that the DBA will keep:
			CREATE USER
			DROP USER
			CREATE ANY TABLE
			DROP ANY TABLE
			SELECT ANY TABLE
			BACKUP ANY TABLE			
*/
--for a new user: CHELUC_ID with a password stud:
CREATE USER CHELUC_ID
IDENTIFIED BY stud;

--to change password:
ALTER USER CHELUC_ID
IDENTIFIED BY student;

--to allocate system privileges to the user:
GRANT
	create session,		--connect to the database
	create table,		--create tables in the user's schema
	create sequence,	--create sequences in the user's schema
	create view,		--create views in the user's schema
TO CHELUC_ID;


/*
OBJECT PRIVILEGES	TABLE	VIEW	SEQUENCE	PROCEDURE

ALTER				o					o
DELETE				o		 o
EXECUTE												o
INDEX				o		 o
INSERT				o		 o
REFERENCES			o
SELECT				o		 o			o
UPDATE				o		 o	
*/
--example to allocate object privileges to a user:
GRANT UPDATE (salary)
ON employees
TO steven_king;

--example to allow all users on the system to query data
-- from alice's DEPARTMENTS table:
GRANT select
ON alice.departments
TO PUBLIC;
/* without full name of the object, Oracle Server implicitly 
prefixes the object name with the current user's name (or schema)
if current user does not own an object of that name, the system
prefixes the object name with PUBLIC */


--------CREATING AND REVOKING OBJECT PRIVILEGES----------

/*
UPDATE and REFERENCES can be granted on an individual column or table

ROLE = named group of related privileges that can be granted to a user
		(easier to revoke and maintain)
A user can have access to several roles, and users can be assigned the 
same role.
*/
--creating role (named manager):
CREATE ROLE manager;

--grant privileges to role (in this case create tables and views):
GRANT 
	create table,
	create view
TO manager;

--grant role to a user:
GRANT manager
TO jennifer_cho;

--users can have multiple roles granted to them and will receive all 
--privileges associated with them

--example of using and accesing data with GRANT:
GRANT
	select
ON clients
TO PUBLIC;

GRANT 
	update ( first_name,
			 last_name)
ON clients
TO jennifer_cho, manager;

--now, if jennifer_cho wants to acces scott_king's clients table:
SELECT *
FROM scott_king.clients;
--but she can create a synonym and acces without the prefix:
CREATE SYNONYM clients
FOR scott_king.clients;

SELECT *
FROM clients;

--to grant privileges to an object, the object must be in my own
--schema or I must have been granted the privilege using the 
-- WITH GRANT OPTION

GRANT
	select,
	insert
TO scott_king
WITH GRANT OPTION;

--granting access to all users (public)

GRANT
	select
ON jason_tsang.clients
TO PUBLIC;

--revoking object privileges:
REVOKE 
	select,
	insert
ON clients
FROM scott_king;
/*
--if the owner revokes a privilege from a user who granted privileges
--to other users, the revoke statement cascades to all privileges granted

--synonyms can be private or public (CREATE PUBLIC SYNONYM)


ROLES VS PRIVILEGES

PRIVILEGE
	-> right to execute a particular type of SQL statement, or a
			right to access another user's object.
	-> all are defined by Oracle
	
ROLES
	-> are created by users (usually admins) and are used to group
			together privileges or other roles
	-> created to make it easier to manage the granting of multiple
			privileges or roles to users
			

DATABASE LINK = CREATE DATABASE LINK
		pointer that defines a one-way communication path
		from one Oracle DB to another DB. 
		It's defined as an entry in a data dictionary table. 
		To acces the link, we must be connected to the local DB 
		that contains the data dictionary entry.
		Offers access to data on a remote DB.
		The global DB name uniquely identifies a DB server in a distributed system.
		Allow users to access another user's objects in a remote DB
		so that they are bounded by the privilege set of the object's owner.
*/
CREATE PUBLIC SYNONYM HQ_EMP
FOR employers@HQ.ACME.COM;
--establish a synonym to access external DB named HQ.ACME.COM

SELECT *
FROM HQ_EMP;

-- see all users (schemas) from the database
SELECT username AS SCHEMA_NAME
FROM sys.dba_users
ORDER BY username;

-- changing user
CONNECT scott
ALTER SESSION SET CURRENT_SCHEMA = joe;


