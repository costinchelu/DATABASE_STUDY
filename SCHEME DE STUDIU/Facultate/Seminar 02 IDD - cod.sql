create table REGIUNI
(
  ID_REGIUNE       NUMBER,
  DENUMIRE_REGIUNE VARCHAR2(25)
)
;
alter table REGIUNI
  add constraint ID_REGIUNE_PK primary key (ID_REGIUNE);
alter table REGIUNI
  add constraint ID_REGIUNE_NN
  check ("ID_REGIUNE" IS NOT NULL);


create table TARI
(
  ID_TARA       CHAR(2),
  DENUMIRE_TARA VARCHAR2(40),
  ID_REGIUNE    NUMBER,
  constraint TARA_C_ID_PK primary key (ID_TARA)
)
organization index;
alter table TARI
  add constraint TARA_REG_FK foreign key (ID_REGIUNE)
  references REGIUNI (ID_REGIUNE);
alter table TARI
  add constraint ID_TARA_NN
  check ("ID_TARA" IS NOT NULL);


create table LOCATII
(
  ID_LOCATIE NUMBER(4) not null,
  ADRESA     VARCHAR2(40),
  COD_POSTAL VARCHAR2(12),
  ORAS       VARCHAR2(30),
  ZONA       VARCHAR2(25),
  ID_TARA    CHAR(2)
)
;
alter table LOCATII
  add constraint LOC_ID_PK primary key (ID_LOCATIE);
alter table LOCATII
  add constraint LOC_C_ID_FK foreign key (ID_TARA)
  references TARI (ID_TARA);
alter table LOCATII
  add constraint LOC_ORAS_NN
  check ("ORAS" IS NOT NULL);
create index LOC_ORAS_IX on LOCATII (ORAS);
create index LOC_TARA_IX on LOCATII (ID_TARA);
create index LOC_ZONA_IX on LOCATII (ZONA);


create table DEPARTAMENTE
(
  ID_DEPARTAMENT       NUMBER(4) not null,
  DENUMIRE_DEPARTAMENT VARCHAR2(30),
  ID_MANAGER           NUMBER(6),
  ID_LOCATIE           NUMBER(4)
)
;
alter table DEPARTAMENTE
  add constraint DEPT_ID_PK primary key (ID_DEPARTAMENT);
alter table DEPARTAMENTE
  add constraint DEPT_LOC_FK foreign key (ID_LOCATIE)
  references LOCATII (ID_LOCATIE);

alter table DEPARTAMENTE
  add constraint DEPT_NAME_NN
  check ("DENUMIRE_DEPARTAMENT" IS NOT NULL);
create index DEPT_LOCATION_IX on DEPARTAMENTE (ID_LOCATIE);


create table FUNCTII
(
  ID_FUNCTIE       VARCHAR2(10) not null,
  DENUMIRE_FUNCTIE VARCHAR2(35),
  SALARIU_MIN      NUMBER(6),
  SALARIU_MAX      NUMBER(6)
)
;
alter table FUNCTII
  add constraint ID_FUNCTIE_PK primary key (ID_FUNCTIE);
alter table FUNCTII
  add constraint DEN_FUNCTIE_NN
  check ("DENUMIRE_FUNCTIE" IS NOT NULL);


create table ANGAJATI
(
  ID_ANGAJAT     NUMBER(6) not null,
  PRENUME        VARCHAR2(20),
  NUME           VARCHAR2(25),
  EMAIL          VARCHAR2(25),
  TELEFON        VARCHAR2(20),
  DATA_ANGAJARE  DATE,
  ID_FUNCTIE     VARCHAR2(10),
  SALARIUL       NUMBER(8,2),
  COMISION       NUMBER(2,2),
  ID_MANAGER     NUMBER(6),
  ID_DEPARTAMENT NUMBER(4)
)
;
alter table ANGAJATI
  add constraint ANG_ID_ANGAJAT_PK primary key (ID_ANGAJAT);
alter table ANGAJATI
  add constraint ANG_EMAIL_UK unique (EMAIL);
alter table ANGAJATI
  add constraint ANG_DEPT_FK foreign key (ID_DEPARTAMENT)
  references DEPARTAMENTE (ID_DEPARTAMENT);
alter table ANGAJATI
  add constraint ANG_FUNCTIE_FK foreign key (ID_FUNCTIE)
  references FUNCTII (ID_FUNCTIE);
alter table ANGAJATI
  add constraint ANG_MANAGER_FK foreign key (ID_MANAGER)
  references ANGAJATI (ID_ANGAJAT);
alter table ANGAJATI
  add constraint ANG_DATA_ANG_NN
  check ("DATA_ANGAJARE" IS NOT NULL);
alter table ANGAJATI
  add constraint ANG_EMAIL_NN
  check ("EMAIL" IS NOT NULL);
alter table ANGAJATI
  add constraint ANG_FUNCTIE_NN
  check ("ID_FUNCTIE" IS NOT NULL);
alter table ANGAJATI
  add constraint ANG_NUME_NN
  check ("NUME" IS NOT NULL);
alter table ANGAJATI
  add constraint ANG_SALARIUL_MIN
  check (SALARIUL > 0);
create index ANG_DEPARTAMENT_IX on ANGAJATI (ID_DEPARTAMENT);
create index ANG_FUNCTIE_IX on ANGAJATI (ID_FUNCTIE);
create index ANG_MANAGER_IX on ANGAJATI (ID_MANAGER);
create index ANG_NUME_IX on ANGAJATI (NUME, PRENUME);

alter table DEPARTAMENTE
  add constraint DEPT_MGR_FK foreign key (ID_MANAGER)
  references ANGAJATI (ID_ANGAJAT)
  disable;
  

create table CLIENTI
(
  ID_CLIENT      NUMBER(6) not null,
  PRENUME_CLIENT VARCHAR2(20),
  NUME_CLIENT    VARCHAR2(20),
  TELEFON        VARCHAR2(20),
  LIMITA_CREDIT  NUMBER(9,2),
  EMAIL_CLIENT   VARCHAR2(30),
  DATA_NASTERE   DATE,
  STAREA_CIVILA  VARCHAR2(20),
  SEX            VARCHAR2(1),
  NIVEL_VENITURI VARCHAR2(20)
)
;
alter table CLIENTI
  add constraint CLIENTI_ID_CLIENT_PK primary key (ID_CLIENT);
alter table CLIENTI
  add constraint CLIENTI_LIMITA_CREDIT_MAX
  check (LIMITA_CREDIT <= 5000);
alter table CLIENTI
  add constraint CL_NUME_NN
  check ("NUME_CLIENT" IS NOT NULL);
alter table CLIENTI
  add constraint CL_PRENUME_NN
  check ("PRENUME_CLIENT" IS NOT NULL);
create index CLIENTI_NUME_IX on CLIENTI (UPPER(NUME_CLIENT), UPPER(PRENUME_CLIENT));


create table COMENZI
(
  NR_COMANDA    NUMBER(12) not null,
  DATA          TIMESTAMP(6) WITH LOCAL TIME ZONE,
  MODALITATE    VARCHAR2(8),
  ID_CLIENT     NUMBER(6),
  STARE_COMANDA NUMBER(2),
  ID_ANGAJAT    NUMBER(6)
)
;
alter table COMENZI
  add constraint COMENZI_NR_COMANDA_PK primary key (NR_COMANDA);
alter table COMENZI
  add constraint COMENZI_ID_ANGAJAT_FK foreign key (ID_ANGAJAT)
  references ANGAJATI (ID_ANGAJAT) on delete set null;
alter table COMENZI
  add constraint COMENZI_ID_CLIENT_FK foreign key (ID_CLIENT)
  references CLIENTI (ID_CLIENT) on delete set null;
alter table COMENZI
  add constraint COMENZI_DATA_NN
  check ("DATA" IS NOT NULL);
alter table COMENZI
  add constraint COMENZI_ID_CLIENT_NN
  check ("ID_CLIENT" IS NOT NULL);
alter table COMENZI
  add constraint COMENZI_MOD_CK
  check (MODALITATE in ('direct','online'));
create index COMENZI_DATA_IX on COMENZI (DATA);
create index COMENZI_ID_ANGAJAT_IX on COMENZI (ID_ANGAJAT);
create index COMENZI_ID_CLIENT_IX on COMENZI (ID_CLIENT);


create table ISTORIC_FUNCTII
(
  ID_ANGAJAT     NUMBER(6),
  DATA_INCEPUT   DATE,
  DATA_SFARSIT   DATE,
  ID_FUNCTIE     VARCHAR2(10),
  ID_DEPARTAMENT NUMBER(4)
)
;
alter table ISTORIC_FUNCTII
  add constraint IST_ID_ANG_DATA_INC_PK primary key (ID_ANGAJAT, DATA_INCEPUT);
alter table ISTORIC_FUNCTII
  add constraint IST_ANG_FK foreign key (ID_ANGAJAT)
  references ANGAJATI (ID_ANGAJAT);
alter table ISTORIC_FUNCTII
  add constraint IST_DEPT_FK foreign key (ID_DEPARTAMENT)
  references DEPARTAMENTE (ID_DEPARTAMENT);
alter table ISTORIC_FUNCTII
  add constraint IST_FUNCTII_FK foreign key (ID_FUNCTIE)
  references FUNCTII (ID_FUNCTIE);
alter table ISTORIC_FUNCTII
  add constraint IST_DATA_INC_NN
  check ("DATA_INCEPUT" IS NOT NULL);
alter table ISTORIC_FUNCTII
  add constraint IST_DATA_INTERVAL
  check (DATA_SFARSIT > DATA_INCEPUT);
alter table ISTORIC_FUNCTII
  add constraint IST_DATA_SF_NN
  check ("DATA_SFARSIT" IS NOT NULL);
alter table ISTORIC_FUNCTII
  add constraint IST_ID_ANG_NN
  check ("ID_ANGAJAT" IS NOT NULL);
alter table ISTORIC_FUNCTII
  add constraint IST_ID_FUNCTIE_NN
  check ("ID_FUNCTIE" IS NOT NULL);
create index IST_ANGAJAT_IX on ISTORIC_FUNCTII (ID_ANGAJAT);
create index IST_DEPARTAMENT_IX on ISTORIC_FUNCTII (ID_DEPARTAMENT);
create index IST_FUNCTIE_IX on ISTORIC_FUNCTII (ID_FUNCTIE);


create table PRODUSE
(
  ID_PRODUS       NUMBER(6) not null,
  DENUMIRE_PRODUS VARCHAR2(50),
  DESCRIERE       VARCHAR2(2000),
  CATEGORIE       VARCHAR2(40),
  PRET_LISTA      NUMBER(8,2),
  PRET_MIN        NUMBER(8,2)
)
;
alter table PRODUSE
  add constraint PRODUSE_ID_PRODUS_PK primary key (ID_PRODUS);


create table RAND_COMENZI
(
  NR_COMANDA NUMBER(12) not null,
  ID_PRODUS  NUMBER(6) not null,
  PRET       NUMBER(8,2),
  CANTITATE  NUMBER(8)
)
;
alter table RAND_COMENZI
  add constraint PROD_COM_PK primary key (NR_COMANDA, ID_PRODUS);
alter table RAND_COMENZI
  add constraint PROD_COM_ID_PRODUS_FK foreign key (ID_PRODUS)
  references PRODUSE (ID_PRODUS);
alter table RAND_COMENZI
  add constraint PROD_COM_NR_COMANDA_FK foreign key (NR_COMANDA)
  references COMENZI (NR_COMANDA) on delete cascade;
alter table RAND_COMENZI
  add constraint PROD_COM_CANTITATE_CK
  check (CANTITATE>=0);
alter table RAND_COMENZI
  add constraint PROD_COM_PRET_CK
  check (PRET>=0);
create index PROD_COM_ID_PRODUS_IX on RAND_COMENZI (ID_PRODUS);
create index PROD_COM_NR_COMANDA_IX on RAND_COMENZI (NR_COMANDA);