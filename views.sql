----------VIEWS-------------

-----------define a view:
CREATE VIEW view_employees_100_124 AS
    SELECT
        employee_id   "Employee ID",
        first_name
        || ' '
        || last_name "Name",
        email
    FROM
        employees
    WHERE
        employee_id BETWEEN 100 AND 124;

		
CREATE OR REPLACE VIEW euro_countries AS
    SELECT
        country_id     "ID",
        region_id      "Region",
        country_name   "Country name",
        capitol
    FROM
        wf_countries
    WHERE
        location LIKE '%Europe';
--OR REPLACE option changes the definition of the view without having
--to drop it or re_grant object privileges previously granted on it
		
----------use the defined view:
SELECT
    *
FROM
    view_employees_100_124;
	

SELECT
    *
FROM
    euro_countries
ORDER BY
    "Country name";
--for performance reasons the ORDER BY clause is best specified 
--when you retrieve data from the view

--FORCE option will create the view despite it being invalid.
--NOFORCE option is default when creating a view (but if the table
--does not exists, it will give an error)

--------example of complex views:
CREATE OR REPLACE VIEW view_euro_countries AS
    SELECT
        c.country_id     "ID",
        c.country_name   "Country",
        c.capitol        "Capitol City",
        r.region_name    "Region"
    FROM
        wf_countries c
        JOIN wf_world_regions r USING ( region_id )
    WHERE
        location LIKE '%Europe';


CREATE OR REPLACE VIEW high_pop AS
    SELECT
        region_id   "Region ID",
        MAX(population) "Highest population"
    FROM
        wf_countries
    GROUP BY
        region_id;

		
SELECT
    *
FROM
    view_euro_countries
ORDER BY
    "Region", "Country";


SELECT
    *
FROM
    high_pop;

------------DML operations and VIEWS-------------

--INSERT, UPDATE and DELETE can be performed on simple views
--so these operations can be used to change data in the tables

--options for the CREATE VIEW:

--						WITH CHECK OPTION
CREATE OR REPLACE VIEW view_dept50 AS
    SELECT
        department_id   "DepartmentID",
        employee_id     "Employee ID",
        first_name
        || ' ' || 
        last_name       "Name",
        salary          "Salary"
    FROM
        employees
    WHERE
        department_id = 50
WITH CHECK OPTION CONSTRAINT view_dept50_check;
--ensures that DML operations performed on the view stays
--within the domain of the view (for example: modifying department_id
--of an employee from department 50 to another department will get
--outside the domain without CHECK OPTION)

--						WITH READ ONLY
--any attempt to execute INSERT, UPDATE or DELETE statements
--will result in error
CREATE OR REPLACE VIEW view_dept50 AS
    SELECT
        department_id   "DepartmentID",
        employee_id     "Employee ID",
        first_name
        || ' ' || 
        last_name       "Name",
        salary          "Salary"
    FROM
        employees
    WHERE
        department_id = 50
WITH READ ONLY CONSTRAINT view_dept50_ro;

/*
I) we cannot remove a row from base table if the view contains:
- Group functions
- A GROUP BY clause
- The DISTINCT keyword
- The pseudocolumn ROWNUM keyword

II) we cannot modify data through a view if the view contains:
- Group functions
- A GROUP BY clause
- The DISTINCT keyword
- The pseudocolumn ROWNUM keyword
- Columns defined by expressions

III) we cannot add data through a view if the view:
- Includes group functions
- Includes a GROUP BY clause
- Includes the DISTINCT keyword
- Includes the pseudocolumn ROWNUM keyword
- Includes columns defined by expressions
- Does not include NOT NULL columns in the base tables
*/


---------DELETING A VIEW
--we need DROP ANY VIEW privilege
-- syntax:
DROP VIEW view_name;

------INLINE VIEW
CREATE OR REPLACE VIEW maxsal AS
    SELECT
        e.last_name,
        e.salary,
        e.department_id,
        d.maxsal
    FROM
        employees e,
        (
            SELECT
                department_id,
                MAX(salary) maxsal
            FROM
                employees
            GROUP BY
                department_id
        ) d
    WHERE
        e.department_id = d.department_id
        AND e.salary = d.maxsal;


------TOP-N-ANALYSIS

CREATE OR REPLACE VIEW long_emp AS
    SELECT
        ROWNUM "Longest employed",
		last_name "Last name",
        hire_date "Hire date"
    FROM
        ( SELECT
             last_name,
             hire_date
          FROM
             employees
          ORDER BY
             hire_date )
    WHERE
        ROWNUM <= 5;