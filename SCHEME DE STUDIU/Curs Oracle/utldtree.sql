
CREATE TABLE  "DEPTREE_TEMPTAB" 
   ("OBJECT_ID" NUMBER, 
	"REFERENCED_OBJECT_ID" NUMBER, 
	"NEST_LEVEL" NUMBER, 
	"SEQ#" NUMBER
   );
   
CREATE OR REPLACE FORCE VIEW  "DEPTREE" ("NESTED_LEVEL", "TYPE", "SCHEMA", "NAME", "SEQ#") AS 
	SELECT d.nest_level, o.object_type, o.owner, o.object_name, d.seq#
	FROM deptree_temptab d, all_objects o
	WHERE d.object_id = o.object_id (+);
				
				
CREATE OR REPLACE FORCE VIEW  "IDEPTREE" ("DEPENDENCIES") AS 
	SELECT LPAD(' ',3*(MAX(nested_level))) || MAX(NVL(type, '<no permission>')
        || ' ' || schema || DECODE(type, NULL, '', '.') || name)
    FROM deptree
    GROUP BY seq#;
				
CREATE SEQUENCE   "DEPTREE_SEQ"  
	MINVALUE 1 
	MAXVALUE 9999999999999999999999999999 
	INCREMENT BY 1 
	START WITH 1 
	CACHE 200 
	NOORDER  
	NOCYCLE;

				
CREATE OR REPLACE PROCEDURE deptree_fill (type char, schema char, name char) is
                
	obj_id NUMBER;
    BEGIN
        DELETE FROM deptree_temptab;
        COMMIT;
        SELECT object_id INTO obj_id FROM all_objects
        WHERE owner = UPPER(deptree_fill.schema)
            AND object_name  = UPPER(deptree_fill.name)
            AND object_type  = UPPER(deptree_fill.type);
        INSERT INTO deptree_temptab values (obj_id, 0, 0, 0);
        INSERT INTO deptree_temptab
            SELECT object_id, referenced_object_id, LEVEL, deptree_seq.NEXTVAL
            FROM public_dependency
            CONNECT BY PRIOR object_id = referenced_object_id
            START WITH referenced_object_id = deptree_fill.obj_id;
        EXCEPTION
            WHEN no_data_found THEN raise_application_error(-20000, 'ORU-10013: ' ||
                ''||type||' '||schema||'.'||name||' was not found.');
    END;