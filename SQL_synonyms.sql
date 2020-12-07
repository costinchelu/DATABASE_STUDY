---------SYNONYMS---------

--a word or expression that is an accepted substitute for another word
--simplify access to objects by creating another name for the object

CREATE SYNONYM amy_emps
FOR amy_copy_employees;

--the object cannot be contained in a package
--to drop a synonym:
DROP SYNONYM amy_emps;

