--------DATABASE TRANSACTIONS-----------

--TCL = transaction control language (COMMIT, ROLLBACK, SAVEPOINT)

/*
TRANSACTIONS allow user to make changes to data and then
decide whether to save or discard the work

A TRANSACTION consists of one  of the following:

-> DML statement which constitute one consistent change
    to the data (INSERT, UPDATE, DELETE, MERGE)
-> DDL statement (CREATE, ALTER, RENAME, DROP, TRUNCATE)
-> DCL statement(GRANT, REVOKE)

a transaction either happens completely or not at all

transactions are controlled using the following statements:

COMMIT = point in time where the user hasmade all the changes
        he wants to have logically grouped together, and
        because no mistakes have been made, the user is ready
        to save the work

ROLLBACK = enables the user to discard changes made to the DB

SAVEPOINT = creates a marker ina transaction, which divides
            the transaction into smaller pieces
            
ROLLBACK TO SAVEPOINT = allows the user to roll back the 
            current transaction to a specified savepoint
*/
UPDATE departments
SET manager_id = 101
WHERE department_id = 60;

SAVEPOINT one;		--we can rollback to this savepoint if something is wrong, but before we commit

INSERT INTO departments (
                    department_id,
                    department_name,
                    manager_id,
                    location_id )
VALUES (
        130,
        'Estate Management',
        102,
        1500 );

UPDATE departments
SET department_id = 140;
--a WHERE clause is ommited here

ROLLBACK TO SAVEPOINT one;		--rolling back before the insertion

COMMIT;		--once commited or rollbacked we don't anymore have a
			-- savepoint to return to

/*
A transaction begins with the first DML statement
		(whenever we have an INSERT, UPDATE, DELETE or MERGE)

A transaction ends when:
	-> we COMMIT or ROLLBACK
	-> a DDL (CREATE, ALTER, RENAME, DROP,TRUNCATE) statement is issued
	-> a DCL (GRANT, REVOKE) statement is issued
	-> a user exists normally from Oracle Database utility, causing the current
			transaction to be implicitly commited.
			
Every data change made during a transaction is temporary until the 
transaction is commited.

Read consistency = automatic implementation, permitting multiple 
users to modify DB simultaneously.

Automatic rollback occurs under abnormal termination of the Oracle
Database utility, or when a system failure occurs. This prevents 
any errors in the data.


Oracle locks data to prevent destructive interaction between transactions
accesing the same resource.Implicit locking occurs for all SQL statements
except SELECT. When commit or rollback statement is issued, locks on
the affected rows are released.

*/

