DROP TABLE facultate_clienti CASCADE CONSTRAINTS;
DROP TABLE facultate_furnizori CASCADE CONSTRAINTS;
DROP TABLE facultate_produse CASCADE CONSTRAINTS;
DROP TABLE facultate_tranzactii CASCADE CONSTRAINTS;
DROP TABLE facultate_documente CASCADE CONSTRAINTS;
DROP TABLE facultate_proddoc CASCADE CONSTRAINTS;

CREATE TABLE clienti (
    codc    VARCHAR2(5),
    denc    VARCHAR2(30),
    adr     VARCHAR2(30),
    loc     VARCHAR2(20),
    cont    VARCHAR2(11),
    banca   VARCHAR2(15),
    CONSTRAINT pk_codc PRIMARY KEY ( codc )
);

CREATE TABLE furnizori (
    codf    VARCHAR2(5),
    denf    VARCHAR2(30),
    adr     VARCHAR2(30),
    loc     VARCHAR2(11),
	cont	varchar2(11),
    banca   VARCHAR2(15),
    CONSTRAINT pk_codf PRIMARY KEY ( codf )
);

rename clienti to facultate_clienti;
rename furnizori to facultate_furnizori;

create table facultate_produse
(
codp varchar2(5),
denp varchar2(25),
um varchar2(5),
pret number(10),
stoc number(5),
termen date,
constraint pk_codp primary key (codp));

CREATE TABLE facultate_tranzactii (
    codt      VARCHAR2(5),
    dent      VARCHAR2(1)
        CONSTRAINT nn_dent NOT NULL,
    CONSTRAINT ck_dent CHECK ( UPPER(dent) IN (
        'L',
        'R'
    ) ),
    dataora   DATE DEFAULT SYSDATE,
    codf      VARCHAR2(5),
    codc      VARCHAR2(5),
    CONSTRAINT pk_codt PRIMARY KEY ( codt ),
    CONSTRAINT fk_codf FOREIGN KEY ( codf )
        REFERENCES facultate_furnizori ( codf ),
    CONSTRAINT fk_codc FOREIGN KEY ( codc )
        REFERENCES facultate_clienti ( codc )
);

CREATE TABLE facultate_documente (
    codd   		NUMBER(5)
        CONSTRAINT ck_codd CHECK ( codd > 0 ),
    dend   		VARCHAR2(4)
        CONSTRAINT nn_dend NOT NULL,
    CONSTRAINT ck_dend CHECK ( UPPER(dend) IN (
        'FACT',
        'AVIZ',
        'NIR',
        'CHIT'
    ) ),
    datadesc   	DATE DEFAULT SYSDATE,
    codt   		VARCHAR2(5),
	valoare 	NUMBER(5),
    CONSTRAINT pk_codd PRIMARY KEY ( codd ),
    CONSTRAINT fk_codt FOREIGN KEY ( codt )
        REFERENCES facultate_tranzactii ( codt )
);

CREATE TABLE facultate_proddoc (
    codd   NUMBER(5),
    codp   VARCHAR2(5),
    um     VARCHAR2(5),
    cant   NUMBER(5),
    CONSTRAINT pk_coddp PRIMARY KEY ( codd,
                                      codp )
);


INSERT INTO facultate_proddoc (
	codd, 
	codp, 
	um, 
	cant )
VALUES (
	1,
	'35',
	'10',
	250 );

	
ALTER TABLE facultate_proddoc ADD (
	CONSTRAINT ck_cant CHECK ( cant >= 50 ));
	

UPDATE facultate_documente d
SET
    valoare = (
        SELECT
            SUM(cant * pret) valoare
        FROM
            facultate_proddoc pd,
            facultate_produse p
        WHERE
            p.codp = pd.codp AND
            d.codd = pd.codd
        GROUP BY
            d.codd
    );

/*
SELECT codd, valoare FROM documente
WHERE valoare IS NOT NULL;

Rezultatul este:

CODD 		VALOARE
--------- 	-----------------
20123 		2.250E+09
10124 		1.390E+09
20124 		1.255E+09
30122 		550000000
10125 		550000000
30123 		2.400E+09
10126 		2.400E+09
10127 		570000000
20125 		570000000
10123 		2.250E+09
*/
