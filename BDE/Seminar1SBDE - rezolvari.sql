--1
SELECT nume, prenume, salariul, functie, id_manager
FROM salariati
WHERE salariul > 2000 AND id_manager = 5012;

--2
SELECT cnp, nume, prenume, tip_client, stare_client
FROM clienti
WHERE nivel_venituri BETWEEN 3000 AND 5000 
AND LOWER(tip_client) IN ('platinum', 'gold');

--3
SELECT cl.nume, cl.prenume, co.cont, tr.tip_tranzactie, tr.suma
FROM tranzactii tr 
INNER JOIN conturi co ON tr.id_cont_destinatie = co.id_cont 
INNER JOIN clienti cl ON co.id_client = cl.id_client
ORDER BY cl.nume;

--4
SELECT cl.nume, cl.prenume, cl.tip_client, 
        co.cont, co.valuta, co.data_deschidere, co.stare_cont, 
        p.tip_produs, p.procent_dobanda
FROM conturi co
INNER JOIN clienti cl ON co.id_client = cl.id_client
INNER JOIN produse p ON co.id_produs = p.id_produs
WHERE cl.nume IS NOT NULL
ORDER BY cl.nume;

--5
SELECT ang.nume || ' lucreaza pentru ' || man.nume AS "Angajati si manageri"
FROM salariati ang 
JOIN salariati man ON ang.id_manager = man.marca_salariat;

--6
SELECT nume, prenume, cnp, data_nastere, emitent_act_identitate
FROM salariati
WHERE EXTRACT(YEAR FROM data_nastere) > 1979 
AND EXTRACT(YEAR FROM data_nastere) < 1990
AND REGEXP_LIKE(LOWER(emitent_act_identitate), 'bucuresti');

--7
SELECT d.id_departament, d.den_departament, MIN(s.salariul)
FROM departamente d
LEFT JOIN salariati s ON s.id_departament = d.id_departament
GROUP BY d.id_departament, d.den_departament 
HAVING MIN(salariul) < AVG(salariul)
ORDER BY MIN(salariul);

--8
SELECT nume, prenume, tip_client, stare_client, cont, data_deschidere, stare_cont
FROM clienti 
JOIN conturi ON clienti.id_client = conturi.id_client
WHERE EXTRACT(YEAR FROM data_deschidere) > 2005
AND LOWER(stare_cont) LIKE '%salariu%'
ORDER BY data_deschidere;

--9
SELECT marca_salariat, salariul, id_departament
FROM salariati s
WHERE salariul > 
    (SELECT AVG(salariul) 
    FROM salariati d 
	WHERE s.id_departament = d.id_departament);
	
--10
SELECT d.id_departament, den_departament
FROM departamente d 
JOIN salariati s ON d.id_departament = s.id_departament
GROUP BY d.id_departament, den_departament
HAVING MIN(salariul) > 4500;

--11
SELECT id_user, SUM(suma)
FROM tranzactii 
GROUP BY id_user;

--12
SELECT marca_salariat, nume, functie, salariul
FROM salariati
WHERE salariul > (
                SELECT AVG(salariul) 
                FROM salariati);
				
--13
SELECT nume, prenume, functie, salariul,
CASE functie
    WHEN 'Consilier Agentie' THEN salariul * 1.05
    WHEN 'Sef Agentie' THEN salariul * 1.1
    WHEN 'Director Sucursala' THEN salariul * 1.15
    ELSE salariul * 1.01
END AS "salariul majorat"
FROM salariati;

SELECT nume, prenume, functie, salariul,
DECODE( functie,
    'Consilier Agentie', (salariul * 1.05),
    'Sef Agentie', (salariul * 1.1),
    'Director Sucursala', (salariul * 1.15),
    (salariul * 1.01))
AS "salariul majorat"
FROM salariati;

--14
SELECT id_produs, tip_produs, procent_dobanda,
CASE tip_produs
    WHEN 'depozit' THEN (procent_dobanda * 1.1)
    WHEN 'cont economii' THEN (procent_dobanda * 1.05)
END AS "Procent dobanda modificat"
FROM produse;

--15
SELECT s.id_departament, den_departament, AVG(salariul) salariumediu
FROM departamente d
FULL OUTER JOIN salariati s ON d.id_departament = s.id_departament
GROUP BY (s.id_departament, den_departament)
ORDER BY s.id_departament;

--16
SELECT d.id_departament, den_departament, count(marca_salariat)
FROM departamente d
JOIN salariati s ON s.id_departament = d.id_departament
GROUP BY d.id_departament, den_departament
HAVING COUNT(marca_salariat) > 1

--17
SELECT d.id_departament, den_departament
FROM departamente d
LEFT OUTER JOIN salariati s ON s.id_departament = d.id_departament
GROUP BY d.id_departament, den_departament
HAVING COUNT(marca_salariat) = 0;


---------------------------------------------------------

ALTER TABLE tranzactii
ADD CONSTRAINT fk_tranzactii_curs_schimb FOREIGN KEY(valuta, data_tranzactiei) 
REFERENCES curs_schimb(valuta, data_curs); 
-- nu merge (orphan keys)