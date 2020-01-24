----------Character manipulation---------

--character case

LOWER (column_name | expression);
UPPER (column_name | expression);
INITCAP (column_name | expression);

--character manipulation
CONCAT (column_name | expression, column_name | expression)
SUBSTR (column_name | expression, n, m)
LENGTH (column_name | expression)
INSTR (column_name | expression, string literal)
LPAD (column_name | expression, n, character_literal)
RPAD (column_name | expression, n, character_literal)
TRIM ( [leading | trailing | both] char1 FROM char2)
REPLACE (column_name | expression, string_to_be_replaced, replacement_string)

--number functions
ROUND (column_name | expression, n)
TRUNC (column_name | expression, n)
MOD (column_name | expression, column_name | expression)

--date dunctions
ROUND (column_name | expression, n)
TRUNC (column_name | expression, n)

MONTHS_BETWEEN (column_name | expression, column_name | expression)
ADD_MONTHS (column_name | expression, n)
NEXT_DAY (column_name | expression, 'day')
LAST_DAY (column_name | expression)

--conversion functions
TO_CHAR(number, 'format model')
TO_CHAR(date, 'format model')
TO_NUMBER(char_string, 'format model')
TO_DATE(char_string, 'format model')


