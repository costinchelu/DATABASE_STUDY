# Oracle Programing: Functions vs Procedures

Oracle Procedures and Functions can be thought of as subprograms where they can be created and saved within the database as database objects. 

The basic idea of a function is that it should only do computations (ex: generateId()), but not to change the DB state (no changing the data in tables). 

And the idea of a procedure is that it is a series of steps to change the DB state. 

Note that both these functions and procedures can be called or referred within the other blocks too.

### IN, OUT and IN OUT parameters  

When you create oracle procedures or functions, just like in other programming languages you can define parameters for them. But in Oracle, there are three types of parameters that can be declared:

**IN** — The parameter can be referenced (read) by the procedure or function. But it can’t be changed or assigned a new value within the procedure or function.

**OUT** — The parameter can not be referenced (read) by the procedure or function, But a new value can be set to it within the procedure or function.

**IN OUT** — The parameter can be referenced (read) by the procedure or function and the value of the parameter can be overwritten by the procedure or function.

Note: Above are not data types of parameters. The data type of oracle function or procedure parameters would be “char, varchar, varchar2, number, blob, ..etc”.

### Basic Differences between a Function and a Procedure

1. An Oracle function always returns a value using the RETURN statement while a procedure may return one or more values through parameters or may not return at all.  
Although OUT parameters can still be used in functions, they are not advisable but there may be rare cases where one might find a need to do so. And note that Using OUT parameter within a function restricts it from being used in a SQL Statement.
So say you have a function called FIND_ELIGIBLE, and has a OUT parameter, then you can’t invoke that function like:
```sql
SELECT *
FROM
    <package>.find_eligible(param1, param2, ...)
FROM DUAL;
```
But if your function did not have an OUT parameter, then you can invoke it as above.
So how to execute a function with a OUT parameter:

```sql
BEGIN
    DECLARE
        outvar VARCHAR2(255);
        retvar INTEGER;
    BEGIN
        retvar := package.find_eligible('user', 'course', outvar);
    END;
END;
```

As shown, then we have to pass a variable for that function’s OUT parameter. In above we have passed OUTVAR as that. And to get the return value of that function, we have to have another variable also (RETVAR). But we have to declare those variables first. So as above, we have to have nested BEGIN, END sections in these kinds of scenarios.

2. As mentioned above although oracle functions can be used in SQL statements like SELECT, INSERT, UPDATE, DELETE and MERGE (of course unless it has an OUT parameter), procedures can’t be used ok invoked within those SQL statements.

There are two ways that we can call or execute procedures. For an example, say we have a procedure called call_rest within the abc schema:

```sql
-- Then we can call within a begin and end section as follows:

BEGIN
    abc.call_rest('aaaa', 'bbbb');
END;

-- We can use the CALL command in Oracle:

CALL package.call_rest('aaaa', 'bbbb');

-- We can use the EXEC command in Oracle:

EXEC package.call_rest('aaaa', 'bbbb');
```

**Note**: Both EXEC and CALL commands are mostly similar. But with EXEC you can call the stored procedure as “exec stored_procedure” directly if it does not have any parameters, but with the CALL command you have to append parenthesis () at the end even if you don’t have parameters.

3. Functions are normally used for computations whereas procedures are normally used for executing business logic.

4. Oracle provides the provision of creating “Function Based Indexes” to improve the performance of the subsequent SQL statement. This applies when performing the function on an indexed column in where clause of a query.

### EXAMPLES:

```sql
CREATE OR REPLACE FUNCTION find_course 
    (name_in IN VARCHAR2)
    RETURN NUMBER IS
    
    c_number NUMBER;
    
    CURSOR c1 IS
        SELECT
            course_number
        FROM
            courses_tbl
        WHERE 
            course_name = name_in;
            
    BEGIN
        
        OPEN c1;
        
        FETCH c1 into c_number;
        IF c1%NOTFOUND THEN
            c_number := 9999;
        END IF;
        
        CLOSE c1;
        
        RETURN c_number;
        
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20001, 'Encountered error - ' || SQLCODE || ' -ERROR- ' || SQLERRM);
        
    END;
```

```sql
CREATE OR REPLACE PROCEDURE update_course 
    (name_in IN VARCHAR2)
    IS
    
    c_number NUMBER;
    
    CURSOR c1 IS
        SELECT
            course_number
        FROM
            courses_tbl
        WHERE 
            course_name = name_in;
            
    BEGIN
        
        OPEN c1;
        
        FETCH c1 into c_number;
        IF c1%NOTFOUND THEN
            c_number := 9999;
        END IF;
        
        INSERT INTO
            student_courses(course_name, course_number)
        VALUES
            (name_in, c_number);
            
        COMMIT;
        
        CLOSE c1;
        
        RETURN c_number;
        
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20001, 'Encountered error - ' || SQLCODE || ' -ERROR- ' || SQLERRM);
        
    END;
```
