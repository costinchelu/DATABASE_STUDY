Multitenant : Startup and Shutdown Container Databases (CDB) and Pluggable Databases (PDB) in Oracle Database 12c Release 1 (12.1)
==================================================================================================================================

The multitenant option introduced in Oracle Database 12c allows a single container database (CDB) to host multiple separate pluggable databases (PDB). This article demonstrates how to startup and shutdown container databases (CDB) and pluggable databases (PDB).

Container Database (CDB)
------------------------

Startup and shutdown of the container database is the same as it has always been for regular instances. The SQL\*Plus `STARTUP` and `SHUTDOWN` commands are available when connected to the CDB as a privileged user. Some typical values are shown below.

    STARTUP [NOMOUNT | MOUNT | RESTRICT | UPGRADE | FORCE | READ ONLY]
    SHUTDOWN [IMMEDIATE | ABORT]

Pluggable Database (PDB)
------------------------

Pluggable databases can be started and stopped using SQL\*Plus commands or the `ALTER PLUGGABLE DATABASE` command.

### SQL\*Plus Commands

The following SQL\*Plus commands are available to start and stop a pluggable database, when connected to that pluggable database as a privileged user.

    STARTUP FORCE;
    STARTUP OPEN READ WRITE [RESTRICT];
    STARTUP OPEN READ ONLY [RESTRICT];
    STARTUP UPGRADE;
    SHUTDOWN [IMMEDIATE];

Some examples are shown below.

    STARTUP FORCE;
    SHUTDOWN IMMEDIATE;

    STARTUP OPEN READ WRITE RESTRICT;
    SHUTDOWN;

    STARTUP;
    SHUTDOWN IMMEDIATE;

### ALTER PLUGGABLE DATABASE

The `ALTER PLUGGABLE DATABASE` command can be used from the CDB or the PDB.

The following commands are available to open and close the current PDB when connected to the PDB as a privileged user.

    ALTER PLUGGABLE DATABASE OPEN READ WRITE [RESTRICTED] [FORCE];
    ALTER PLUGGABLE DATABASE OPEN READ ONLY [RESTRICTED] [FORCE];
    ALTER PLUGGABLE DATABASE OPEN UPGRADE [RESTRICTED];
    ALTER PLUGGABLE DATABASE CLOSE [IMMEDIATE];

Some examples are shown below.

    ALTER PLUGGABLE DATABASE OPEN READ ONLY FORCE;
    ALTER PLUGGABLE DATABASE CLOSE IMMEDIATE;

    ALTER PLUGGABLE DATABASE OPEN READ WRITE;
    ALTER PLUGGABLE DATABASE CLOSE IMMEDIATE;

The following commands are available to open and close one or more PDBs when connected to the CDB as a privileged user.

    ALTER PLUGGABLE DATABASE <pdb-name-clause> OPEN READ WRITE [RESTRICTED] [FORCE];
    ALTER PLUGGABLE DATABASE <pdb-name-clause> OPEN READ ONLY [RESTRICTED] [FORCE];
    ALTER PLUGGABLE DATABASE <pdb-name-clause> OPEN UPGRADE [RESTRICTED];
    ALTER PLUGGABLE DATABASE <pdb-name-clause> CLOSE [IMMEDIATE];

The `<pdb-name-clause>` clause can be any of the following:

-   One or more PDB names, specified as a comma-separated list.
-   The `ALL` keyword to indicate all PDBs.
-   The `ALL EXCEPT` keywords, followed by one or more PDB names in a comma-separate list, to indicate a subset of PDBs.

Some examples are shown below.

    ALTER PLUGGABLE DATABASE pdb1, pdb2 OPEN READ ONLY FORCE;
    ALTER PLUGGABLE DATABASE pdb1, pdb2 CLOSE IMMEDIATE;

    ALTER PLUGGABLE DATABASE ALL OPEN;
    ALTER PLUGGABLE DATABASE ALL CLOSE IMMEDIATE;

    ALTER PLUGGABLE DATABASE ALL EXCEPT pdb1 OPEN;
    ALTER PLUGGABLE DATABASE ALL EXCEPT pdb1 CLOSE IMMEDIATE;

### Pluggable Database (PDB) Automatic Startup

The 12.1.0.2 patchset has introduced the ability to preserve the startup state of PDBs, so you probably shouldn't be implementing a trigger in the manner discussed in this section.

Prior to 12.1.0.2, when the CDB is started, all PDBs remain in mounted mode. There is no default mechanism to automatically start them when the CDB is started. The way to achieve this is to use a system trigger on the CDB to start some or all of the PDBs.

    CREATE OR REPLACE TRIGGER open_pdbs 
      AFTER STARTUP ON DATABASE 
    BEGIN 
       EXECUTE IMMEDIATE 'ALTER PLUGGABLE DATABASE ALL OPEN'; 
    END open_pdbs;
    /

You can customise the trigger if you don't want all of your PDBs to start.

### Preserve PDB Startup State (12.1.0.2 onward)

The 12.1.0.2 patchset introduced the ability to preserve the startup state of PDBs through a CDB restart. This is done using the `ALTER PLUGGABLE DATABASE` command.

We will start off by looking at the normal result of a CDB restart. Notice the PDBs are in `READ WRITE` mode before the restart, but in `MOUNTED` mode after it.

    SELECT name, open_mode FROM v$pdbs;

    NAME                           OPEN_MODE
    ------------------------------ ----------
    PDB$SEED                       READ ONLY
    PDB1                           READ WRITE
    PDB2                           READ WRITE

    SQL> 


    SHUTDOWN IMMEDIATE;
    STARTUP;


    SELECT name, open_mode FROM v$pdbs;

    NAME                           OPEN_MODE
    ------------------------------ ----------
    PDB$SEED                       READ ONLY
    PDB1                           MOUNTED
    PDB2                           MOUNTED

    SQL>

Next, we open both pluggable databases, but only save the state of PDB1.

    ALTER PLUGGABLE DATABASE pdb1 OPEN;
    ALTER PLUGGABLE DATABASE pdb2 OPEN;
    ALTER PLUGGABLE DATABASE pdb1 SAVE STATE;

The `DBA_PDB_SAVED_STATES` view displays information about the saved state of containers.

    COLUMN con_name FORMAT A20
    COLUMN instance_name FORMAT A20

    SELECT con_name, instance_name, state FROM dba_pdb_saved_states;

    CON_NAME             INSTANCE_NAME        STATE
    -------------------- -------------------- --------------
    PDB1                 cdb1                 OPEN

    SQL>

Restarting the CDB now gives us a different result.

    SELECT name, open_mode FROM v$pdbs;

    NAME                           OPEN_MODE
    ------------------------------ ----------
    PDB$SEED                       READ ONLY
    PDB1                           READ WRITE
    PDB2                           READ WRITE

    SQL> 


    SHUTDOWN IMMEDIATE;
    STARTUP;


    SELECT name, open_mode FROM v$pdbs;

    NAME                           OPEN_MODE
    ------------------------------ ----------
    PDB$SEED                       READ ONLY
    PDB1                           READ WRITE
    PDB2                           MOUNTED

    SQL>

The saved state can be discarded using the following statement.

    ALTER PLUGGABLE DATABASE pdb1 DISCARD STATE;

    COLUMN con_name FORMAT A20
    COLUMN instance_name FORMAT A20

    SELECT con_name, instance_name, state FROM dba_pdb_saved_states;

    no rows selected

    SQL>

Here is a brief list of some of the usage notes explained in the [documentation](http://docs.oracle.com/database/121/ADMIN/cdb_admin.htm#ADMIN14251).

-   The state is only saved and visible in the `DBA_PDB_SAVED_STATES` view if the container is in `READ ONLY` or `READ WRITE` mode. The `ALTER PLUGGABLE DATABASE ... SAVE STATE` command does not error when run against a container in `MOUNTED` mode, but nothing is recorded, as this is the default state after a CDB restart.
-   Like other examples of the `ALTER PLUGGABLE DATABASE` command, PDBs can be identified individually, as a comma separated list, using the `ALL` or `ALL EXCEPT` keywords.
-   The `INSTANCES` clause can be added when used in RAC environments. The clause can identify instances individually, as a comma separated list, using the `ALL` or `ALL EXCEPT` keywords. Regardless of the `INSTANCES` clause, the `SAVE/DISCARD STATE` commands only affect the current instance.

For more information see:

-   [Introduction to the Multitenant Architecture](http://docs.oracle.com/cd/E16655_01/server.121/e17633/cdbovrvw.htm)
-   [Overview of the Multitenant Architecture](http://docs.oracle.com/cd/E16655_01/server.121/e17633/cdblogic.htm)
-   [Managing a Multitenant Environment](http://docs.oracle.com/cd/E16655_01/server.121/e17636/part_cdb.htm)
-   [ALTER PLUGGABLE DATABASE](http://docs.oracle.com/cd/E16655_01/server.121/e17209/statements_2007.htm)
-   [Using the STARTUP SQL\*Plus Command on a PDB](http://docs.oracle.com/cd/E16655_01/server.121/e17636/cdb_pdb_admin.htm#ADMIN14098)
-   [Preserving or Discarding the Open Mode of PDBs When the CDB Restarts](http://docs.oracle.com/database/121/ADMIN/cdb_admin.htm#ADMIN14251)
-   [Multitenant : All Articles](https://oracle-base.com/articles/12c/multitenant-overview-container-database-cdb-12cr1#multitenant-articles)
-   [Multitenant : Startup and Shutdown of CDBs and PDBs **](https://www.youtube.com/watch?v=tu4hu8imQdc)