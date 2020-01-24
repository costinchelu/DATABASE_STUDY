-- functia DISTINCT (determina randuri neduplicate)
--folosita in expresii cu mai mult de o coloana, returneaza doar combinatii non-duplicat
--in combinatie cu COUNT, numara randuri ne-duplicate
SELECT DISTINCT
    job_id,
    department_id
FROM
    employees;