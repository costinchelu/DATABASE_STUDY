-------REGULAR EXPRESSIONS--------(brief overview)

--META CHARACTERS

. 
--(dot) matches any character in the supported character set (except NULL)

?
--matches zero or one occurence

*
--matches zero or more occurences

+
--matches one or more occurences

()
--grouping expression, treated as a single sub-expression

\
--escape character

|
--alternation operator for specifying alternative matches

^/$
--matches the start-of-line / end-of-line

[]
--list matching any one of the expressions represented in the list


'a.c' --3 letter word with one char between a and c
'a_c'
--we can use these functions on any data type that holds char data
--such as CHAR, LOB and VARCHAR2
--regular expressions mustbe enclosed in single quotation marks


--example search for a list of employees with a first name Stephen or Steven:
SELECT
    first_name,
    last_name
FROM
    employees
WHERE
    REGEXP_LIKE ( first_name,
                  '^Ste(v|ph)en$' );
-- ^ specifies start of the string that is being searched
-- (starts a sub-expression )finishes the group of choices
-- | specifies an OR
-- $ specifies the end of the string that is being searched

SELECT
    last_name,
    REGEXP_REPLACE(last_name, 'H(a|e|i|o|u)', '**') "Name changed"
FROM
    employees;
--that replaces one string pattern to another

--regexp_COUNT returns the number of times a pattern appears
--in a string
--in this example it searches for the subexpression "ab"
SELECT
    country_name,
    regexp_count(country_name, '(ab)') "Count of 'ab'"
FROM
    wf_countries
WHERE
    regexp_count(country_name, '(ab)') > 0;
	
--example checking to ensure that all email addresses
--include an "@" sign.
ALTER TABLE employees
    ADD CONSTRAINT email_chk 
    CHECK ( REGEXP_LIKE ( email, '@' ) );

--or for a more complex check:
CREATE TABLE my_contacts (
    first_name   VARCHAR2(15),
    last_name    VARCHAR2(15),
    email        VARCHAR2(30) 
    CHECK ( REGEXP_LIKE ( email, '+@.+\..+' ) ) );
/*
where .+ means one or more characters
      @ an @ symbol
      \. a dot (backslash being an escape character)
*/


