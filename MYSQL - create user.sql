-- CREATE SCHEMA
CREATE SCHEMA `schemaname` ;

-- CREATE USER
CREATE USER 'someuser'@'localhost' IDENTIFIED BY 'somepass';
-- CREATE USER 'someuser'@'%' IDENTIFIED BY 'somepass';

-- GRANT
-- ist star is schema, second * is table
GRANT ALL PRIVILEGES ON * . * TO 'someuser'@'localhost';
-- GRANT ALL PRIVILEGES ON * . * TO 'someuser'@'%';

FLUSH PRIVILEGES;

-- USERS info
SELECT * FROM mysql.user;
SELECT CURRENT_USER();
SHOW GRANTS FOR 'someuser'@'localhost';

-- DROP user
DROP USER 'someuser'@'localhost';
DROP USER 'someuser'@'%';
