-- STRUCTURI IERARHICE

-- Afisati salariatii companiei subordonati inregistrarii radacina:

SELECT
    marca_salariat, 
	nume, 
	salariul, 
	id_departament, 
	id_manager, 
	level
FROM
    salariati
CONNECT BY PRIOR 
	marca_salariat = id_manager
START WITH 
	id_manager IS NULL;

-- sau ordonare dupa nivelul ierarhic:

SELECT
    marca_salariat, nume, salariul, id_departament, id_manager, level
FROM
    salariati
CONNECT BY PRIOR 
	marca_salariat = id_manager
START WITH 
	id_manager IS NULL
ORDER BY 
	level;

-- Afisati salariatii companiei subordonati inregistrarii radacina sub forma de organigrama:

SELECT 
    level, 
	lpad(' ', level * 2) || nume Angajatul
FROM 
    salariati
CONNECT BY PRIOR 
    marca_salariat = id_manager
START WITH 
    marca_salariat = 5004
ORDER BY 
    level;
	
-- Afisati salariatii companiei subordonati inregistrarii radacina specificand pentru fiecare angajatul radacina, numarul de superiori si toti superiorii sai:

SELECT 
    nume							Nume_angajat, 
    CONNECT_BY_ROOT nume 			Nume_Sef, 
    LEVEL - 1 						Nr_de_sefi, 
    SYS_CONNECT_BY_PATH(nume, '/') 	Nume_Sefi
FROM 
    salariati
CONNECT BY PRIOR 
    marca_salariat = id_manager
START WITH 
    functie = 'Presedinte banca';	
	
/* Sa se selecteze salariatii si gradul de subordonare 
numai pentru cei salariati intre 1 ianuarie 2000 si 30 decembrie 2004 */

SELECT
    nume || ' ' || prenume "Numele angajatului",
    data_angajare,
    id_manager,
    level
FROM
    salariati
WHERE 
    data_angajare BETWEEN 
    TO_DATE('01.01.2000', 'dd.mm.yyyy') AND 
	TO_DATE('30.12.2004', 'dd.mm.yyyy')    
CONNECT BY PRIOR
    marca_salariat = id_manager
START WITH
    functie = 'Presedinte banca'
ORDER BY
    level;
	
-- Sa se afiseze toti superiorii Madalinei Cristea:
SELECT
    marca_salariat,
    nume || ' ' || prenume "Nume angajat",
    id_manager,
    level
FROM
    salariati
CONNECT BY 
    marca_salariat = PRIOR id_manager
START WITH
    nume = 'Cristea' AND 
	prenume = 'Madalina'
ORDER BY
    level;
    
-- Sa se afiseze toti subordonatii angajatului 5002:
SELECT
    marca_salariat,
    nume || ' ' || prenume "Nume angajat",
    id_manager,
    level
FROM
    salariati
CONNECT BY PRIOR 
    marca_salariat = id_manager
START WITH
    marca_salariat = 5002
ORDER BY
    level;
	
-- Sa se afiseze toti subordonatii lui 5018 care sunt in acelasi departament cu acesta:
SELECT
    marca_salariat,
    nume || ' ' || prenume "Nume angajat",
    id_manager,
    level
FROM
    salariati
WHERE
    id_departament = 
        (SELECT
            id_departament
        FROM
            salariati
        WHERE
            marca_salariat = 5018)
CONNECT BY PRIOR 
    marca_salariat = id_manager
START WITH
    marca_salariat = 5018
ORDER BY
    level;
	
/* Să se afișeze numărul total de salariați subordonați 
lui Dumitru Stefan în funcție de departament. */
SELECT
    id_departament      "Departament",
    COUNT(*)            "Nr. subalterni"
FROM
    salariati
CONNECT BY PRIOR
    marca_salariat = id_manager
START WITH
    nume = 'Dumitru' AND
    prenume = 'Stefan'
GROUP  BY (id_departament)
ORDER BY
    id_departament;
    
    
SELECT
    s.id_departament        "ID Departament",
    den_departament         "Departament",
    COUNT(marca_salariat)   "Nr. subalterni"
FROM
    salariati s
    LEFT JOIN departamente d ON s.id_departament = d.id_departament
CONNECT BY PRIOR
    s.marca_salariat = s.id_manager
START WITH
    nume = 'Dumitru' AND
    prenume = 'Stefan'
GROUP  BY (s.id_departament, den_departament)
ORDER BY
    s.id_departament;
	
-- Să se selecteze toți subordonații salariaților cu funcția Director Sucursala 
SELECT
    marca_salariat,
    nume || ' ' || prenume "Nume angajat",
    id_manager,
    level
FROM
    salariati
WHERE
    LOWER(functie) = 'director sucursala'
CONNECT BY PRIOR
    marca_salariat = id_manager
START WITH  
    marca_salariat = 5004;
	
-- Să se afișeze marca, numele, prenumele, id-ul managerului și nivelul ierarhic pentru toți superiorii lui Dumitru Stefan
SELECT
    marca_salariat,
    nume || ' ' || prenume "Nume angajat",
    id_manager,
    level
FROM
    salariati
CONNECT BY
    marca_salariat = PRIOR id_manager
START WITH
    nume = 'Dumitru' AND
    prenume = 'Stefan';
	
	
-- FUNCŢII ANALITICE SQL IMPLEMENTATE ÎN ORACLE DATABASE

/*
salariul mediu al celor angajati in aceeasi perioada (ORDER BY) 
cu cel curent, din acelasi departament (PARTITION BY): 
*/
SELECT
    id_departament,
    marca_salariat,
    nume,
    data_angajare,
    salariul,
    AVG(salariul)
    OVER(PARTITION BY id_departament
        ORDER BY
            data_angajare
        ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
    ) "Salariu mediu -1R +1R"
FROM
    salariati;
	
--salariul mediul al celor angajati inaintea celui curent, din acelasi departament:
SELECT
    id_departament,
    data_angajare,
    marca_salariat,
    nume,
    salariul,
    AVG(salariul)
    OVER(PARTITION BY 
			id_departament
        ORDER BY
            data_angajare
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) "Salariu mediu <data_angajare"
FROM
    salariati
ORDER BY
    id_departament,
    data_angajare;
	
/*
salariul mediu al angajatilor din acelasi departament 
intre care exista o diferenta de salariu de +/-1000 fata de cel curent:
*/
SELECT
    id_departament,
    nume,
    salariul,
    AVG(salariul)
    OVER(PARTITION BY 
			id_departament
        ORDER BY 
            salariul
        RANGE BETWEEN 1000 PRECEDING AND 1000 FOLLOWING
    ) "Salariul mediu -1000um +1000um"
FROM
    salariati
ORDER BY
    id_departament,
    salariul;
	
/*
numărul de salariați 
ce au salariul cu o diferenta de salariu de +/-1000 fata de cel curent (inclusiv):
*/
SELECT
    marca_salariat,
    nume,
    salariul,
    COUNT(marca_salariat) 
    OVER(ORDER BY
                salariul
         RANGE BETWEEN 1000 PRECEDING AND 1000 FOLLOWING
    ) "Nr. salariati -1000um +1000um"
FROM
    salariati
ORDER BY
    salariul;


/*
numărul de salariați 
ce au salariul cu o diferenta de salariu de +/-1000 fata de cel curent (fara randul curent)
(in coloane diferite):
*/
SELECT
    marca_salariat,
    nume || ' ' || prenume "Salariat",
    salariul,
    COUNT(marca_salariat)
    OVER(ORDER BY
            salariul
         RANGE 1000 PRECEDING) - 1 "Nr. salariati -1000um",
    COUNT(marca_salariat)
    OVER(ORDER BY
            salariul
         RANGE BETWEEN CURRENT ROW AND 1000 FOLLOWING) - 1 " Nr. salariati +1000um" 
FROM
    salariati
ORDER BY
    salariul;


/*
salariul minim, respectiv maxim al salariatilor din acelasi departament, 
cu salarii mai mici sau egale cu cel curent:
*/
SELECT
    marca_salariat,
    nume || ' ' || prenume "Angajat",
    id_departament,
    salariul,
    MIN(salariul)
    OVER(PARTITION BY
                id_departament
         ORDER BY
                salariul
         ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) "Min. salariu in dept.",
    MAX(salariul)
    OVER(PARTITION BY
                id_departament
         ORDER BY
                salariul
         ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) "Max. salariu in dept."
FROM
    salariati
ORDER BY
    id_departament, 
    salariul;
	

/*
numarul total de salariati si suma salariilor, 
pe fiecare manager (PARTITION BY), care castiga cu +/-200 fata de cel curent 
(daca se utilizeaza 2 functii analitice in aceeasi interogare 
se precizeaza pt fiecare clauza fereastra):
*/
SELECT
    marca_salariat,
    id_manager,
    id_departament,
    nume || ' ' || prenume "Angajat",
    salariul,
    COUNT(marca_salariat)
    OVER(PARTITION BY
                id_manager
         ORDER BY
                salariul
         RANGE BETWEEN 200 PRECEDING AND 200 FOLLOWING) -1 "Nr. salariati +-200",
    SUM(salariul)
    OVER(PARTITION BY
                id_manager
         ORDER BY
                salariul
         RANGE BETWEEN 200 PRECEDING AND 200 FOLLOWING) "Suma salariilor +-200"
FROM
    salariati
ORDER BY
    id_manager;
	
-- Sa se afiseze salariatii pe departamente, in ordinea salariilor :
-- In plus, selecteaza doar departamentele cu > 1 angajat
SELECT
    nume || ' ' || prenume "Angajat",
    id_departament,
    salariul,
    RANK()
    OVER(PARTITION BY
                id_departament
         ORDER BY
                salariul DESC) "Ordine / departament"
FROM
    salariati
WHERE
    id_departament IN (
            SELECT 
                id_departament 
            FROM 
                salariati 
            GROUP BY 
                id_departament
            HAVING 
                COUNT(*) > 1)
ORDER BY
    id_departament;
	
/* 
Să se afișeze angajații care sunt cel mai bine platiți/mai slab 
platiți din fiecare department.
*/
SELECT
    nume || ' ' || prenume "Angajat",
    id_departament,
    salariul,
    FIRST_VALUE(nume || ' ' || prenume)
    OVER(PARTITION BY
                id_departament
          ORDER BY
                salariul DESC
          RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) "Salariu max",
    LAST_VALUE(nume || ' ' || prenume)
    OVER(PARTITION BY
                id_departament
         ORDER BY
                salariul DESC
         RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) "Salariu min"
FROM
    salariati
ORDER BY
    id_departament;
	
--sau
SELECT
    DISTINCT id_departament,
    FIRST_VALUE(nume || ' ' || prenume)
    OVER(PARTITION BY
                id_departament
          ORDER BY
                salariul DESC
          RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) "Salariu max",
    LAST_VALUE(nume || ' ' || prenume)
    OVER(PARTITION BY
                id_departament
         ORDER BY
                salariul DESC
         RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) "Salariu min"
FROM
    salariati
ORDER BY
    id_departament;	

-- afişează valorile curente şi precedente ale sumelor tranzactionate de fiecare utilizator:
SELECT
    id_user,
    data_tranzactiei,
    suma,
    LAG(suma)
    OVER(PARTITION BY
                id_user
         ORDER BY
                data_tranzactiei) "Suma anterioara"
FROM
    tranzactii;
	
/*
Sa se afiseze numele salariatilor, 
nr de angajati din departamentul lor, 
numele managerilor si 
numarul de angajati avuti in subordine de catre acestia:
*/
SELECT
    a.marca_salariat,
    a.id_departament,
    a.id_manager,
    a.nume || ' ' || a.prenume "Angajat",
    COUNT(a.marca_salariat)
    OVER(PARTITION BY
                a.id_departament) "Nr. angajati in departament",
    COUNT(a.marca_salariat)
    OVER(PARTITION BY
                a.id_manager) "Nr. angajati in subordine"
FROM
    salariati a
    JOIN salariati s ON a.id_manager = s.marca_salariat;
	

 -- GROUP BY ROLLUP/CUBE

/*
1.	Sa se afiseze nr de departamente din fiecare judet, 
din fiecare oras precum si numarul total de departamente.
*/
SELECT
    l.judet,
    l.denumire_localitate,
    COUNT(*) "nr. localitati"
FROM
    localitati l
    JOIN departamente d ON l.cod_localitate = d.cod_loc_sediu
GROUP BY
    ROLLUP(l.judet, l.denumire_localitate)
ORDER BY
    l.judet;
    
/*
extensia CUBE genereaza subtotaluri pentru toate combinatiile 
de grupare ale coloanelor
*/
SELECT
    l.judet,
    l.denumire_localitate,
    count(*) "nr. localitati"
FROM
    localitati l
    JOIN departamente d ON l.cod_localitate = d.cod_loc_sediu
GROUP BY
    CUBE(l.judet, l.denumire_localitate)
ORDER BY
    l.judet;
	

-- sa se afiseze prin subtotaluri nr de angajati aferenti fiecarui departament si functie
SELECT
    den_departament,
    functie,
    COUNT(marca_salariat) "Nr. angajati"
FROM
    salariati a
    JOIN departamente d ON a.id_departament = d.id_departament
GROUP BY 
    CUBE(den_departament, functie)
ORDER BY
    den_departament;
	
	

	-- UNION
	
/*
info despre salariatii care au salariul mai mare decat 5300 
precum si acei salariati care au ca manager salariatul nr 5002:
*/
SELECT
    nume || ' ' || prenume "Salariat",
    id_manager,
    salariul
FROM 
    salariati 
WHERE 
    salariul > 5300
UNION
SELECT
    nume || ' ' || prenume "Salariat",
    id_manager,
    salariul
FROM 
    salariati 
WHERE 
    id_manager = 5002
ORDER BY
    id_manager;
/*
In cazul UNION ALL, Cosmescu Cristian apare de două ori deoarece 
intrarea îndeplinește ambele condiții (salariu și manager)
*/   

