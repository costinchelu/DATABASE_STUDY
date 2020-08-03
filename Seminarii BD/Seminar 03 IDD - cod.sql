-- set feedback off
-- set define off
-- prompt Disabling triggers for REGIUNI...
alter table REGIUNI disable all triggers;
-- prompt Disabling triggers for TARI...
alter table TARI disable all triggers;
-- prompt Disabling triggers for LOCATII...
alter table LOCATII disable all triggers;
-- prompt Disabling triggers for ANGAJATI...
alter table ANGAJATI disable all triggers;
-- prompt Disabling triggers for DEPARTAMENTE...
alter table DEPARTAMENTE disable all triggers;
-- prompt Disabling triggers for FUNCTII...
alter table FUNCTII disable all triggers;
-- prompt Disabling triggers for CLIENTI...
alter table CLIENTI disable all triggers;
-- prompt Disabling triggers for COMENZI...
alter table COMENZI disable all triggers;
-- prompt Disabling triggers for ISTORIC_FUNCTII...
alter table ISTORIC_FUNCTII disable all triggers;
-- prompt Disabling triggers for PRODUSE...
alter table PRODUSE disable all triggers;
-- prompt Disabling triggers for RAND_COMENZI...
alter table RAND_COMENZI disable all triggers;
-- prompt Disabling foreign key constraints for TARI...
alter table TARI disable constraint TARA_REG_FK;
-- prompt Disabling foreign key constraints for LOCATII...
alter table LOCATII disable constraint LOC_C_ID_FK;
-- prompt Disabling foreign key constraints for ANGAJATI...
alter table ANGAJATI disable constraint ANG_DEPT_FK;
alter table ANGAJATI disable constraint ANG_FUNCTIE_FK;
alter table ANGAJATI disable constraint ANG_MANAGER_FK;
-- prompt Disabling foreign key constraints for DEPARTAMENTE...
alter table DEPARTAMENTE disable constraint DEPT_LOC_FK;
-- prompt Disabling foreign key constraints for COMENZI...
alter table COMENZI disable constraint COMENZI_ID_ANGAJAT_FK;
alter table COMENZI disable constraint COMENZI_ID_CLIENT_FK;
-- prompt Disabling foreign key constraints for ISTORIC_FUNCTII...
alter table ISTORIC_FUNCTII disable constraint IST_ANG_FK;
alter table ISTORIC_FUNCTII disable constraint IST_DEPT_FK;
alter table ISTORIC_FUNCTII disable constraint IST_FUNCTII_FK;
-- prompt Disabling foreign key constraints for RAND_COMENZI...
alter table RAND_COMENZI disable constraint PROD_COM_ID_PRODUS_FK;
alter table RAND_COMENZI disable constraint PROD_COM_NR_COMANDA_FK;
-- prompt Deleting RAND_COMENZI...
delete from RAND_COMENZI;
commit;
-- prompt Deleting PRODUSE...
delete from PRODUSE;
commit;
-- prompt Deleting ISTORIC_FUNCTII...
delete from ISTORIC_FUNCTII;
commit;
-- prompt Deleting COMENZI...
delete from COMENZI;
commit;
-- prompt Deleting CLIENTI...
delete from CLIENTI;
commit;
-- prompt Deleting FUNCTII...
delete from FUNCTII;
commit;
-- prompt Deleting DEPARTAMENTE...
delete from DEPARTAMENTE;
commit;
-- prompt Deleting ANGAJATI...
delete from ANGAJATI;
commit;
-- prompt Deleting LOCATII...
delete from LOCATII;
commit;
-- prompt Deleting TARI...
delete from TARI;
commit;
-- prompt Deleting REGIUNI...
delete from REGIUNI;
commit;
-- prompt Loading REGIUNI...
insert into REGIUNI (ID_REGIUNE, DENUMIRE_REGIUNE)
values (1, 'Europe');
insert into REGIUNI (ID_REGIUNE, DENUMIRE_REGIUNE)
values (2, 'Americas');
insert into REGIUNI (ID_REGIUNE, DENUMIRE_REGIUNE)
values (3, 'Asia');
insert into REGIUNI (ID_REGIUNE, DENUMIRE_REGIUNE)
values (4, 'Middle East and Africa');
commit;
-- prompt 4 records loaded
-- prompt Loading TARI...
insert into TARI (ID_TARA, DENUMIRE_TARA, ID_REGIUNE)
values ('AR', 'Argentina', 2);
insert into TARI (ID_TARA, DENUMIRE_TARA, ID_REGIUNE)
values ('AU', 'Australia', 3);
insert into TARI (ID_TARA, DENUMIRE_TARA, ID_REGIUNE)
values ('BE', 'Belgium', 1);
insert into TARI (ID_TARA, DENUMIRE_TARA, ID_REGIUNE)
values ('BR', 'Brazil', 2);
insert into TARI (ID_TARA, DENUMIRE_TARA, ID_REGIUNE)
values ('CA', 'Canada', 2);
insert into TARI (ID_TARA, DENUMIRE_TARA, ID_REGIUNE)
values ('CH', 'Switzerland', 1);
insert into TARI (ID_TARA, DENUMIRE_TARA, ID_REGIUNE)
values ('CN', 'China', 3);
insert into TARI (ID_TARA, DENUMIRE_TARA, ID_REGIUNE)
values ('DE', 'Germany', 1);
insert into TARI (ID_TARA, DENUMIRE_TARA, ID_REGIUNE)
values ('DK', 'Denmark', 1);
insert into TARI (ID_TARA, DENUMIRE_TARA, ID_REGIUNE)
values ('EG', 'Egypt', 4);
insert into TARI (ID_TARA, DENUMIRE_TARA, ID_REGIUNE)
values ('FR', 'France', 1);
insert into TARI (ID_TARA, DENUMIRE_TARA, ID_REGIUNE)
values ('HK', 'HongKong', 3);
insert into TARI (ID_TARA, DENUMIRE_TARA, ID_REGIUNE)
values ('IL', 'Israel', 4);
insert into TARI (ID_TARA, DENUMIRE_TARA, ID_REGIUNE)
values ('IN', 'India', 3);
insert into TARI (ID_TARA, DENUMIRE_TARA, ID_REGIUNE)
values ('IT', 'Italy', 1);
insert into TARI (ID_TARA, DENUMIRE_TARA, ID_REGIUNE)
values ('JP', 'Japan', 3);
insert into TARI (ID_TARA, DENUMIRE_TARA, ID_REGIUNE)
values ('KW', 'Kuwait', 4);
insert into TARI (ID_TARA, DENUMIRE_TARA, ID_REGIUNE)
values ('MX', 'Mexico', 2);
insert into TARI (ID_TARA, DENUMIRE_TARA, ID_REGIUNE)
values ('NG', 'Nigeria', 4);
insert into TARI (ID_TARA, DENUMIRE_TARA, ID_REGIUNE)
values ('NL', 'Netherlands', 1);
insert into TARI (ID_TARA, DENUMIRE_TARA, ID_REGIUNE)
values ('SG', 'Singapore', 3);
insert into TARI (ID_TARA, DENUMIRE_TARA, ID_REGIUNE)
values ('UK', 'United Kingdom', 1);
insert into TARI (ID_TARA, DENUMIRE_TARA, ID_REGIUNE)
values ('US', 'United States of America', 2);
insert into TARI (ID_TARA, DENUMIRE_TARA, ID_REGIUNE)
values ('ZM', 'Zambia', 4);
insert into TARI (ID_TARA, DENUMIRE_TARA, ID_REGIUNE)
values ('ZW', 'Zimbabwe', 4);
commit;
-- prompt 25 records loaded
-- prompt Loading LOCATII...
insert into LOCATII (ID_LOCATIE, ADRESA, COD_POSTAL, ORAS, ZONA, ID_TARA)
values (1000, '1297 Via Cola di Rie', '00989', 'Roma', null, 'IT');
insert into LOCATII (ID_LOCATIE, ADRESA, COD_POSTAL, ORAS, ZONA, ID_TARA)
values (1100, '93091 Calle della Testa', '10934', 'Venice', null, 'IT');
insert into LOCATII (ID_LOCATIE, ADRESA, COD_POSTAL, ORAS, ZONA, ID_TARA)
values (1200, '2017 Shinjuku-ku', '1689', 'Tokyo', 'Tokyo Prefecture', 'JP');
insert into LOCATII (ID_LOCATIE, ADRESA, COD_POSTAL, ORAS, ZONA, ID_TARA)
values (1300, '9450 Kamiya-cho', '6823', 'Hiroshima', null, 'JP');
insert into LOCATII (ID_LOCATIE, ADRESA, COD_POSTAL, ORAS, ZONA, ID_TARA)
values (1400, '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US');
insert into LOCATII (ID_LOCATIE, ADRESA, COD_POSTAL, ORAS, ZONA, ID_TARA)
values (1500, '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US');
insert into LOCATII (ID_LOCATIE, ADRESA, COD_POSTAL, ORAS, ZONA, ID_TARA)
values (1600, '2007 Zagora St', '50090', 'South Brunswick', 'New Jersey', 'US');
insert into LOCATII (ID_LOCATIE, ADRESA, COD_POSTAL, ORAS, ZONA, ID_TARA)
values (1700, '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US');
insert into LOCATII (ID_LOCATIE, ADRESA, COD_POSTAL, ORAS, ZONA, ID_TARA)
values (1800, '147 Spadina Ave', 'M5V 2L7', 'Toronto', 'Ontario', 'CA');
insert into LOCATII (ID_LOCATIE, ADRESA, COD_POSTAL, ORAS, ZONA, ID_TARA)
values (1900, '6092 Boxwood St', 'YSW 9T2', 'Whitehorse', 'Yukon', 'CA');
insert into LOCATII (ID_LOCATIE, ADRESA, COD_POSTAL, ORAS, ZONA, ID_TARA)
values (2000, '40-5-12 Laogianggen', '190518', 'Beijing', null, 'CN');
insert into LOCATII (ID_LOCATIE, ADRESA, COD_POSTAL, ORAS, ZONA, ID_TARA)
values (2100, '1298 Vileparle (E)', '490231', 'Bombay', 'Maharashtra', 'IN');
insert into LOCATII (ID_LOCATIE, ADRESA, COD_POSTAL, ORAS, ZONA, ID_TARA)
values (2200, '12-98 Victoria Street', '2901', 'Sydney', 'New South Wales', 'AU');
insert into LOCATII (ID_LOCATIE, ADRESA, COD_POSTAL, ORAS, ZONA, ID_TARA)
values (2300, '198 Clementi North', '540198', 'Singapore', null, 'SG');
insert into LOCATII (ID_LOCATIE, ADRESA, COD_POSTAL, ORAS, ZONA, ID_TARA)
values (2400, '8204 Arthur St', null, 'London', null, 'UK');
insert into LOCATII (ID_LOCATIE, ADRESA, COD_POSTAL, ORAS, ZONA, ID_TARA)
values (2500, 'Magdalen Centre, The Oxford Science Park', 'OX9 9ZB', 'Oxford', 'Oxford', 'UK');
insert into LOCATII (ID_LOCATIE, ADRESA, COD_POSTAL, ORAS, ZONA, ID_TARA)
values (2600, '9702 Chester Road', '09629850293', 'Stretford', 'Manchester', 'UK');
insert into LOCATII (ID_LOCATIE, ADRESA, COD_POSTAL, ORAS, ZONA, ID_TARA)
values (2700, 'Schwanthalerstr. 7031', '80925', 'Munich', 'Bavaria', 'DE');
insert into LOCATII (ID_LOCATIE, ADRESA, COD_POSTAL, ORAS, ZONA, ID_TARA)
values (2800, 'Rua Frei Caneca 1360 ', '01307-002', 'Sao Paulo', 'Sao Paulo', 'BR');
insert into LOCATII (ID_LOCATIE, ADRESA, COD_POSTAL, ORAS, ZONA, ID_TARA)
values (2900, '20 Rue des Corps-Saints', '1730', 'Geneva', 'Geneve', 'CH');
insert into LOCATII (ID_LOCATIE, ADRESA, COD_POSTAL, ORAS, ZONA, ID_TARA)
values (3000, 'Murtenstrasse 921', '3095', 'Bern', 'BE', 'CH');
insert into LOCATII (ID_LOCATIE, ADRESA, COD_POSTAL, ORAS, ZONA, ID_TARA)
values (3100, 'Pieter Breughelstraat 837', '3029SK', 'Utrecht', 'Utrecht', 'NL');
insert into LOCATII (ID_LOCATIE, ADRESA, COD_POSTAL, ORAS, ZONA, ID_TARA)
values (3200, 'Mariano Escobedo 9991', '11932', 'Mexico City', 'Distrito Federal,', 'MX');
commit;
-- prompt 23 records loaded
-- prompt Loading ANGAJATI...
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (100, 'Steven', 'King', 'SKING', '515.123.4567', to_date('17-06-1987', 'dd-mm-yyyy'), 'AD_PRES', 24000, null, null, 90);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', to_date('21-09-1989', 'dd-mm-yyyy'), 'AD_VP', 17000, null, 100, 90);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (102, 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', to_date('13-01-1993', 'dd-mm-yyyy'), 'AD_VP', 17000, null, 100, 90);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', to_date('03-01-1990', 'dd-mm-yyyy'), 'IT_PROG', 9000, null, 102, 60);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568', to_date('21-05-1991', 'dd-mm-yyyy'), 'IT_PROG', 6000, null, 103, 60);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (105, 'David', 'Austin', 'DAUSTIN', '590.423.4569', to_date('25-06-1997', 'dd-mm-yyyy'), 'IT_PROG', 4800, null, 103, 60);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (106, 'Valli', 'Pataballa', 'VPATABAL', '590.423.4560', to_date('05-02-1998', 'dd-mm-yyyy'), 'IT_PROG', 4800, null, 103, 60);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (107, 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', to_date('07-02-1999', 'dd-mm-yyyy'), 'IT_PROG', 4200, null, 103, 60);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (108, 'Nancy', 'Greenberg', 'NGREENBE', '515.124.4569', to_date('17-08-1994', 'dd-mm-yyyy'), 'FI_MGR', 12000, null, 101, 100);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (109, 'Daniel', 'Faviet', 'DFAVIET', '515.124.4169', to_date('16-08-1994', 'dd-mm-yyyy'), 'FI_ACCOUNT', 9000, null, 108, 100);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (110, 'John', 'Chen', 'JCHEN', '515.124.4269', to_date('28-09-1997', 'dd-mm-yyyy'), 'FI_ACCOUNT', 8200, null, 108, 100);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (111, 'Ismael', 'Sciarra', 'ISCIARRA', '515.124.4369', to_date('30-09-1997', 'dd-mm-yyyy'), 'FI_ACCOUNT', 7700, null, 108, 100);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (112, 'Jose Manuel', 'Urman', 'JMURMAN', '515.124.4469', to_date('07-03-1998', 'dd-mm-yyyy'), 'FI_ACCOUNT', 7800, null, 108, 100);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (113, 'Luis', 'Popp', 'LPOPP', '515.124.4567', to_date('07-12-1999', 'dd-mm-yyyy'), 'FI_ACCOUNT', 6900, null, 108, 100);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (114, 'Den', 'Raphaely', 'DRAPHEAL', '515.127.4561', to_date('07-12-1994', 'dd-mm-yyyy'), 'PU_MAN', 11000, null, 100, 30);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (115, 'Alexander', 'Khoo', 'AKHOO', '515.127.4562', to_date('18-05-1995', 'dd-mm-yyyy'), 'PU_CLERK', 3100, null, 114, 30);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (116, 'Shelli', 'Baida', 'SBAIDA', '515.127.4563', to_date('24-12-1997', 'dd-mm-yyyy'), 'PU_CLERK', 2900, null, 114, 30);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (117, 'Sigal', 'Tobias', 'STOBIAS', '515.127.4564', to_date('24-07-1997', 'dd-mm-yyyy'), 'PU_CLERK', 2800, null, 114, 30);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (118, 'Guy', 'Himuro', 'GHIMURO', '515.127.4565', to_date('15-11-1998', 'dd-mm-yyyy'), 'PU_CLERK', 2600, null, 114, 30);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (119, 'Karen', 'Colmenares', 'KCOLMENA', '515.127.4566', to_date('10-08-1999', 'dd-mm-yyyy'), 'PU_CLERK', 2500, null, 114, 30);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (120, 'Matthew', 'Weiss', 'MWEISS', '650.123.1234', to_date('18-07-1996', 'dd-mm-yyyy'), 'ST_MAN', 8000, null, 100, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (121, 'Adam', 'Fripp', 'AFRIPP', '650.123.2234', to_date('10-04-1997', 'dd-mm-yyyy'), 'ST_MAN', 8200, null, 100, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (122, 'Payam', 'Kaufling', 'PKAUFLIN', '650.123.3234', to_date('01-05-1995', 'dd-mm-yyyy'), 'ST_MAN', 7900, null, 100, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (123, 'Shanta', 'Vollman', 'SVOLLMAN', '650.123.4234', to_date('10-10-1997', 'dd-mm-yyyy'), 'ST_MAN', 6500, null, 100, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (124, 'Kevin', 'Mourgos', 'KMOURGOS', '650.123.5234', to_date('16-11-1999', 'dd-mm-yyyy'), 'ST_MAN', 5800, null, 100, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (125, 'Julia', 'Nayer', 'JNAYER', '650.124.1214', to_date('16-07-1997', 'dd-mm-yyyy'), 'ST_CLERK', 3200, null, 120, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (126, 'Irene', 'Mikkilineni', 'IMIKKILI', '650.124.1224', to_date('28-09-1998', 'dd-mm-yyyy'), 'ST_CLERK', 2700, null, 120, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (127, 'James', 'Landry', 'JLANDRY', '650.124.1334', to_date('14-01-1999', 'dd-mm-yyyy'), 'ST_CLERK', 2400, null, 120, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (128, 'Steven', 'Markle', 'SMARKLE', '650.124.1434', to_date('08-03-2000', 'dd-mm-yyyy'), 'ST_CLERK', 2200, null, 120, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (129, 'Laura', 'Bissot', 'LBISSOT', '650.124.5234', to_date('20-08-1997', 'dd-mm-yyyy'), 'ST_CLERK', 3300, null, 121, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (130, 'Mozhe', 'Atkinson', 'MATKINSO', '650.124.6234', to_date('30-10-1997', 'dd-mm-yyyy'), 'ST_CLERK', 2800, null, 121, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (131, 'James', 'Marlow', 'JAMRLOW', '650.124.7234', to_date('16-02-1997', 'dd-mm-yyyy'), 'ST_CLERK', 2500, null, 121, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (132, 'TJ', 'Olson', 'TJOLSON', '650.124.8234', to_date('10-04-1999', 'dd-mm-yyyy'), 'ST_CLERK', 2100, null, 121, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (133, 'Jason', 'Mallin', 'JMALLIN', '650.127.1934', to_date('14-06-1996', 'dd-mm-yyyy'), 'ST_CLERK', 3300, null, 122, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (134, 'Michael', 'Rogers', 'MROGERS', '650.127.1834', to_date('26-08-1998', 'dd-mm-yyyy'), 'ST_CLERK', 2900, null, 122, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (135, 'Ki', 'Gee', 'KGEE', '650.127.1734', to_date('12-12-1999', 'dd-mm-yyyy'), 'ST_CLERK', 2400, null, 122, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (136, 'Hazel', 'Philtanker', 'HPHILTAN', '650.127.1634', to_date('06-02-2000', 'dd-mm-yyyy'), 'ST_CLERK', 2200, null, 122, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (137, 'Renske', 'Ladwig', 'RLADWIG', '650.121.1234', to_date('14-07-1995', 'dd-mm-yyyy'), 'ST_CLERK', 3600, null, 123, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (138, 'Stephen', 'Stiles', 'SSTILES', '650.121.2034', to_date('26-10-1997', 'dd-mm-yyyy'), 'ST_CLERK', 3200, null, 123, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (139, 'John', 'Seo', 'JSEO', '650.121.2019', to_date('12-02-1998', 'dd-mm-yyyy'), 'ST_CLERK', 2700, null, 123, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (140, 'Joshua', 'Patel', 'JPATEL', '650.121.1834', to_date('06-04-1998', 'dd-mm-yyyy'), 'ST_CLERK', 2500, null, 123, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (141, 'Trenna', 'Rajs', 'TRAJS', '650.121.8009', to_date('17-10-1995', 'dd-mm-yyyy'), 'ST_CLERK', 3500, null, 124, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (142, 'Curtis', 'Davies', 'CDAVIES', '650.121.2994', to_date('29-01-1997', 'dd-mm-yyyy'), 'ST_CLERK', 3100, null, 124, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (143, 'Randall', 'Matos', 'RMATOS', '650.121.2874', to_date('15-03-1998', 'dd-mm-yyyy'), 'ST_CLERK', 2600, null, 124, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (144, 'Peter', 'Vargas', 'PVARGAS', '650.121.2004', to_date('09-07-1998', 'dd-mm-yyyy'), 'ST_CLERK', 2500, null, 124, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (145, 'John', 'Russell', 'JRUSSEL', '011.44.1344.429268', to_date('01-10-1996', 'dd-mm-yyyy'), 'SA_MAN', 14000, .4, 100, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (146, 'Karen', 'Partners', 'KPARTNER', '011.44.1344.467268', to_date('05-01-1997', 'dd-mm-yyyy'), 'SA_MAN', 13500, .3, 100, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (147, 'Alberto', 'Errazuriz', 'AERRAZUR', '011.44.1344.429278', to_date('10-03-1997', 'dd-mm-yyyy'), 'SA_MAN', 12000, .3, 100, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (148, 'Gerald', 'Cambrault', 'GCAMBRAU', '011.44.1344.619268', to_date('15-10-1999', 'dd-mm-yyyy'), 'SA_MAN', 11000, .3, 100, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (149, 'Eleni', 'Zlotkey', 'EZLOTKEY', '011.44.1344.429018', to_date('29-01-2000', 'dd-mm-yyyy'), 'SA_MAN', 10500, .2, 100, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (150, 'Peter', 'Tucker', 'PTUCKER', '011.44.1344.129268', to_date('30-01-1997', 'dd-mm-yyyy'), 'SA_REP', 10000, .3, 145, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (151, 'David', 'Bernstein', 'DBERNSTE', '011.44.1344.345268', to_date('24-03-1997', 'dd-mm-yyyy'), 'SA_REP', 9500, .25, 145, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (152, 'Peter', 'Hall', 'PHALL', '011.44.1344.478968', to_date('20-08-1997', 'dd-mm-yyyy'), 'SA_REP', 9000, .25, 145, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (153, 'Christopher', 'Olsen', 'COLSEN', '011.44.1344.498718', to_date('30-03-1998', 'dd-mm-yyyy'), 'SA_REP', 8000, .2, 145, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (154, 'Nanette', 'Cambrault', 'NCAMBRAU', '011.44.1344.987668', to_date('09-12-1998', 'dd-mm-yyyy'), 'SA_REP', 7500, .2, 145, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (155, 'Oliver', 'Tuvault', 'OTUVAULT', '011.44.1344.486508', to_date('23-11-1999', 'dd-mm-yyyy'), 'SA_REP', 7000, .15, 145, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (156, 'Janette', 'King', 'JKING', '011.44.1345.429268', to_date('30-01-1996', 'dd-mm-yyyy'), 'SA_REP', 10000, .35, 146, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (157, 'Patrick', 'Sully', 'PSULLY', '011.44.1345.929268', to_date('04-03-1996', 'dd-mm-yyyy'), 'SA_REP', 9500, .35, 146, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (158, 'Allan', 'McEwen', 'AMCEWEN', '011.44.1345.829268', to_date('01-08-1996', 'dd-mm-yyyy'), 'SA_REP', 9000, .35, 146, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (159, 'Lindsey', 'Smith', 'LSMITH', '011.44.1345.729268', to_date('10-03-1997', 'dd-mm-yyyy'), 'SA_REP', 8000, .3, 146, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (160, 'Louise', 'Doran', 'LDORAN', '011.44.1345.629268', to_date('15-12-1997', 'dd-mm-yyyy'), 'SA_REP', 7500, .3, 146, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (161, 'Sarath', 'Sewall', 'SSEWALL', '011.44.1345.529268', to_date('03-11-1998', 'dd-mm-yyyy'), 'SA_REP', 7000, .25, 146, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (162, 'Clara', 'Vishney', 'CVISHNEY', '011.44.1346.129268', to_date('11-11-1997', 'dd-mm-yyyy'), 'SA_REP', 10500, .25, 147, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (163, 'Danielle', 'Greene', 'DGREENE', '011.44.1346.229268', to_date('19-03-1999', 'dd-mm-yyyy'), 'SA_REP', 9500, .15, 147, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (164, 'Mattea', 'Marvins', 'MMARVINS', '011.44.1346.329268', to_date('24-01-2000', 'dd-mm-yyyy'), 'SA_REP', 7200, .1, 147, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (165, 'David', 'Lee', 'DLEE', '011.44.1346.529268', to_date('23-02-2000', 'dd-mm-yyyy'), 'SA_REP', 6800, .1, 147, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (166, 'Sundar', 'Ande', 'SANDE', '011.44.1346.629268', to_date('24-03-2000', 'dd-mm-yyyy'), 'SA_REP', 6400, .1, 147, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (167, 'Amit', 'Banda', 'ABANDA', '011.44.1346.729268', to_date('21-04-2000', 'dd-mm-yyyy'), 'SA_REP', 6200, .1, 147, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (168, 'Lisa', 'Ozer', 'LOZER', '011.44.1343.929268', to_date('11-03-1997', 'dd-mm-yyyy'), 'SA_REP', 11500, .25, 148, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (169, 'Harrison', 'Bloom', 'HBLOOM', '011.44.1343.829268', to_date('23-03-1998', 'dd-mm-yyyy'), 'SA_REP', 10000, .2, 148, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (170, 'Tayler', 'Fox', 'TFOX', '011.44.1343.729268', to_date('24-01-1998', 'dd-mm-yyyy'), 'SA_REP', 9600, .2, 148, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (171, 'William', 'Smith', 'WSMITH', '011.44.1343.629268', to_date('23-02-1999', 'dd-mm-yyyy'), 'SA_REP', 7400, .15, 148, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (172, 'Elizabeth', 'Bates', 'EBATES', '011.44.1343.529268', to_date('24-03-1999', 'dd-mm-yyyy'), 'SA_REP', 7300, .15, 148, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (173, 'Sundita', 'Kumar', 'SKUMAR', '011.44.1343.329268', to_date('21-04-2000', 'dd-mm-yyyy'), 'SA_REP', 6100, .1, 148, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (174, 'Ellen', 'Abel', 'EABEL', '011.44.1644.429267', to_date('11-05-1996', 'dd-mm-yyyy'), 'SA_REP', 11000, .3, 149, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (175, 'Alyssa', 'Hutton', 'AHUTTON', '011.44.1644.429266', to_date('19-03-1997', 'dd-mm-yyyy'), 'SA_REP', 8800, .25, 149, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (176, 'Jonathon', 'Taylor', 'JTAYLOR', '011.44.1644.429265', to_date('24-03-1998', 'dd-mm-yyyy'), 'SA_REP', 8600, .2, 149, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (177, 'Jack', 'Livingston', 'JLIVINGS', '011.44.1644.429264', to_date('23-04-1998', 'dd-mm-yyyy'), 'SA_REP', 8400, .2, 149, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (178, 'Kimberely', 'Grant', 'KGRANT', '011.44.1644.429263', to_date('24-05-1999', 'dd-mm-yyyy'), 'SA_REP', 7000, .15, 149, null);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (179, 'Charles', 'Johnson', 'CJOHNSON', '011.44.1644.429262', to_date('04-01-2000', 'dd-mm-yyyy'), 'SA_REP', 6200, .1, 149, 80);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (180, 'Winston', 'Taylor', 'WTAYLOR', '650.507.9876', to_date('24-01-1998', 'dd-mm-yyyy'), 'SH_CLERK', 3200, null, 120, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (181, 'Jean', 'Fleaur', 'JFLEAUR', '650.507.9877', to_date('23-02-1998', 'dd-mm-yyyy'), 'SH_CLERK', 3100, null, 120, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (182, 'Martha', 'Sullivan', 'MSULLIVA', '650.507.9878', to_date('21-06-1999', 'dd-mm-yyyy'), 'SH_CLERK', 2500, null, 120, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (183, 'Girard', 'Geoni', 'GGEONI', '650.507.9879', to_date('03-02-2000', 'dd-mm-yyyy'), 'SH_CLERK', 2800, null, 120, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (184, 'Nandita', 'Sarchand', 'NSARCHAN', '650.509.1876', to_date('27-01-1996', 'dd-mm-yyyy'), 'SH_CLERK', 4200, null, 121, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (185, 'Alexis', 'Bull', 'ABULL', '650.509.2876', to_date('20-02-1997', 'dd-mm-yyyy'), 'SH_CLERK', 4100, null, 121, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (186, 'Julia', 'Dellinger', 'JDELLING', '650.509.3876', to_date('24-06-1998', 'dd-mm-yyyy'), 'SH_CLERK', 3400, null, 121, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (187, 'Anthony', 'Cabrio', 'ACABRIO', '650.509.4876', to_date('07-02-1999', 'dd-mm-yyyy'), 'SH_CLERK', 3000, null, 121, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (188, 'Kelly', 'Chung', 'KCHUNG', '650.505.1876', to_date('14-06-1997', 'dd-mm-yyyy'), 'SH_CLERK', 3800, null, 122, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (189, 'Jennifer', 'Dilly', 'JDILLY', '650.505.2876', to_date('13-08-1997', 'dd-mm-yyyy'), 'SH_CLERK', 3600, null, 122, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (190, 'Timothy', 'Gates', 'TGATES', '650.505.3876', to_date('11-07-1998', 'dd-mm-yyyy'), 'SH_CLERK', 2900, null, 122, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (191, 'Randall', 'Perkins', 'RPERKINS', '650.505.4876', to_date('19-12-1999', 'dd-mm-yyyy'), 'SH_CLERK', 2500, null, 122, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (192, 'Sarah', 'Bell', 'SBELL', '650.501.1876', to_date('04-02-1996', 'dd-mm-yyyy'), 'SH_CLERK', 4000, null, 123, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (193, 'Britney', 'Everett', 'BEVERETT', '650.501.2876', to_date('03-03-1997', 'dd-mm-yyyy'), 'SH_CLERK', 3900, null, 123, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (194, 'Samuel', 'McCain', 'SMCCAIN', '650.501.3876', to_date('01-07-1998', 'dd-mm-yyyy'), 'SH_CLERK', 3200, null, 123, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (195, 'Vance', 'Jones', 'VJONES', '650.501.4876', to_date('17-03-1999', 'dd-mm-yyyy'), 'SH_CLERK', 2800, null, 123, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (196, 'Alana', 'Walsh', 'AWALSH', '650.507.9811', to_date('24-04-1998', 'dd-mm-yyyy'), 'SH_CLERK', 3100, null, 124, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (197, 'Kevin', 'Feeney', 'KFEENEY', '650.507.9822', to_date('23-05-1998', 'dd-mm-yyyy'), 'SH_CLERK', 3000, null, 124, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (198, 'Donald', 'OConnell', 'DOCONNEL', '650.507.9833', to_date('21-06-1999', 'dd-mm-yyyy'), 'SH_CLERK', 2600, null, 124, 50);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (199, 'Douglas', 'Grant', 'DGRANT', '650.507.9844', to_date('13-01-2000', 'dd-mm-yyyy'), 'SH_CLERK', 2600, null, 124, 50);
commit;
-- prompt 100 records committed...
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (200, 'Jennifer', 'Whalen', 'JWHALEN', '515.123.4444', to_date('17-09-1987', 'dd-mm-yyyy'), 'AD_ASST', 4400, null, 101, 10);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (201, 'Michael', 'Hartstein', 'MHARTSTE', '515.123.5555', to_date('17-02-1996', 'dd-mm-yyyy'), 'MK_MAN', 13000, null, 100, 20);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (202, 'Pat', 'Fay', 'PFAY', '603.123.6666', to_date('17-08-1997', 'dd-mm-yyyy'), 'MK_REP', 6000, null, 201, 20);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (203, 'Susan', 'Mavris', 'SMAVRIS', '515.123.7777', to_date('07-06-1994', 'dd-mm-yyyy'), 'HR_REP', 6500, null, 101, 40);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (204, 'Hermann', 'Baer', 'HBAER', '515.123.8888', to_date('07-06-1994', 'dd-mm-yyyy'), 'PR_REP', 10000, null, 101, 70);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (205, 'Shelley', 'Higgins', 'SHIGGINS', '515.123.8080', to_date('07-06-1994', 'dd-mm-yyyy'), 'AC_MGR', 12000, null, 101, 110);
insert into ANGAJATI (ID_ANGAJAT, PRENUME, NUME, EMAIL, TELEFON, DATA_ANGAJARE, ID_FUNCTIE, SALARIUL, COMISION, ID_MANAGER, ID_DEPARTAMENT)
values (206, 'William', 'Gietz', 'WGIETZ', '515.123.8181', to_date('07-06-1994', 'dd-mm-yyyy'), 'AC_ACCOUNT', 8300, null, 205, 110);
commit;
-- prompt 107 records loaded
-- prompt Loading DEPARTAMENTE...
insert into DEPARTAMENTE (ID_DEPARTAMENT, DENUMIRE_DEPARTAMENT, ID_MANAGER, ID_LOCATIE)
values (10, 'Administration', 200, 1700);
insert into DEPARTAMENTE (ID_DEPARTAMENT, DENUMIRE_DEPARTAMENT, ID_MANAGER, ID_LOCATIE)
values (20, 'Marketing', 201, 1800);
insert into DEPARTAMENTE (ID_DEPARTAMENT, DENUMIRE_DEPARTAMENT, ID_MANAGER, ID_LOCATIE)
values (30, 'Purchasing', 114, 1700);
insert into DEPARTAMENTE (ID_DEPARTAMENT, DENUMIRE_DEPARTAMENT, ID_MANAGER, ID_LOCATIE)
values (40, 'Human Resources', 203, 2400);
insert into DEPARTAMENTE (ID_DEPARTAMENT, DENUMIRE_DEPARTAMENT, ID_MANAGER, ID_LOCATIE)
values (50, 'Shipping', 121, 1500);
insert into DEPARTAMENTE (ID_DEPARTAMENT, DENUMIRE_DEPARTAMENT, ID_MANAGER, ID_LOCATIE)
values (60, 'IT', 103, 1400);
insert into DEPARTAMENTE (ID_DEPARTAMENT, DENUMIRE_DEPARTAMENT, ID_MANAGER, ID_LOCATIE)
values (70, 'Public Relations', 204, 2700);
insert into DEPARTAMENTE (ID_DEPARTAMENT, DENUMIRE_DEPARTAMENT, ID_MANAGER, ID_LOCATIE)
values (80, 'Sales', 145, 2500);
insert into DEPARTAMENTE (ID_DEPARTAMENT, DENUMIRE_DEPARTAMENT, ID_MANAGER, ID_LOCATIE)
values (90, 'Executive', 100, 1700);
insert into DEPARTAMENTE (ID_DEPARTAMENT, DENUMIRE_DEPARTAMENT, ID_MANAGER, ID_LOCATIE)
values (100, 'Finance', 108, 1700);
insert into DEPARTAMENTE (ID_DEPARTAMENT, DENUMIRE_DEPARTAMENT, ID_MANAGER, ID_LOCATIE)
values (110, 'Accounting', 205, 1700);
insert into DEPARTAMENTE (ID_DEPARTAMENT, DENUMIRE_DEPARTAMENT, ID_MANAGER, ID_LOCATIE)
values (120, 'Treasury', null, 1700);
insert into DEPARTAMENTE (ID_DEPARTAMENT, DENUMIRE_DEPARTAMENT, ID_MANAGER, ID_LOCATIE)
values (130, 'Corporate Tax', null, 1700);
insert into DEPARTAMENTE (ID_DEPARTAMENT, DENUMIRE_DEPARTAMENT, ID_MANAGER, ID_LOCATIE)
values (140, 'Control And Credit', null, 1700);
insert into DEPARTAMENTE (ID_DEPARTAMENT, DENUMIRE_DEPARTAMENT, ID_MANAGER, ID_LOCATIE)
values (150, 'Shareholder Services', null, 1700);
insert into DEPARTAMENTE (ID_DEPARTAMENT, DENUMIRE_DEPARTAMENT, ID_MANAGER, ID_LOCATIE)
values (160, 'Benefits', null, 1700);
insert into DEPARTAMENTE (ID_DEPARTAMENT, DENUMIRE_DEPARTAMENT, ID_MANAGER, ID_LOCATIE)
values (170, 'Manufacturing', null, 1700);
insert into DEPARTAMENTE (ID_DEPARTAMENT, DENUMIRE_DEPARTAMENT, ID_MANAGER, ID_LOCATIE)
values (180, 'Construction', null, 1700);
insert into DEPARTAMENTE (ID_DEPARTAMENT, DENUMIRE_DEPARTAMENT, ID_MANAGER, ID_LOCATIE)
values (190, 'Contracting', null, 1700);
insert into DEPARTAMENTE (ID_DEPARTAMENT, DENUMIRE_DEPARTAMENT, ID_MANAGER, ID_LOCATIE)
values (200, 'Operations', null, 1700);
insert into DEPARTAMENTE (ID_DEPARTAMENT, DENUMIRE_DEPARTAMENT, ID_MANAGER, ID_LOCATIE)
values (210, 'IT Support', null, 1700);
insert into DEPARTAMENTE (ID_DEPARTAMENT, DENUMIRE_DEPARTAMENT, ID_MANAGER, ID_LOCATIE)
values (220, 'NOC', null, 1700);
insert into DEPARTAMENTE (ID_DEPARTAMENT, DENUMIRE_DEPARTAMENT, ID_MANAGER, ID_LOCATIE)
values (230, 'IT Helpdesk', null, 1700);
insert into DEPARTAMENTE (ID_DEPARTAMENT, DENUMIRE_DEPARTAMENT, ID_MANAGER, ID_LOCATIE)
values (240, 'Government Sales', null, 1700);
insert into DEPARTAMENTE (ID_DEPARTAMENT, DENUMIRE_DEPARTAMENT, ID_MANAGER, ID_LOCATIE)
values (250, 'Retail Sales', null, 1700);
insert into DEPARTAMENTE (ID_DEPARTAMENT, DENUMIRE_DEPARTAMENT, ID_MANAGER, ID_LOCATIE)
values (260, 'Recruiting', null, 1700);
insert into DEPARTAMENTE (ID_DEPARTAMENT, DENUMIRE_DEPARTAMENT, ID_MANAGER, ID_LOCATIE)
values (270, 'Payroll', null, 1700);
commit;
-- prompt 27 records loaded
-- prompt Loading FUNCTII...
insert into FUNCTII (ID_FUNCTIE, DENUMIRE_FUNCTIE, SALARIU_MIN, SALARIU_MAX)
values ('AD_PRES', 'President', 20000, 40000);
insert into FUNCTII (ID_FUNCTIE, DENUMIRE_FUNCTIE, SALARIU_MIN, SALARIU_MAX)
values ('AD_VP', 'Administration Vice President', 15000, 30000);
insert into FUNCTII (ID_FUNCTIE, DENUMIRE_FUNCTIE, SALARIU_MIN, SALARIU_MAX)
values ('AD_ASST', 'Administration Assistant', 3000, 6000);
insert into FUNCTII (ID_FUNCTIE, DENUMIRE_FUNCTIE, SALARIU_MIN, SALARIU_MAX)
values ('FI_MGR', 'Finance Manager', 8200, 16000);
insert into FUNCTII (ID_FUNCTIE, DENUMIRE_FUNCTIE, SALARIU_MIN, SALARIU_MAX)
values ('FI_ACCOUNT', 'Accountant', 4200, 9000);
insert into FUNCTII (ID_FUNCTIE, DENUMIRE_FUNCTIE, SALARIU_MIN, SALARIU_MAX)
values ('AC_MGR', 'Accounting Manager', 8200, 16000);
insert into FUNCTII (ID_FUNCTIE, DENUMIRE_FUNCTIE, SALARIU_MIN, SALARIU_MAX)
values ('AC_ACCOUNT', 'Public Accountant', 4200, 9000);
insert into FUNCTII (ID_FUNCTIE, DENUMIRE_FUNCTIE, SALARIU_MIN, SALARIU_MAX)
values ('SA_MAN', 'Sales Manager', 10000, 20000);
insert into FUNCTII (ID_FUNCTIE, DENUMIRE_FUNCTIE, SALARIU_MIN, SALARIU_MAX)
values ('SA_REP', 'Sales Representative', 6000, 12000);
insert into FUNCTII (ID_FUNCTIE, DENUMIRE_FUNCTIE, SALARIU_MIN, SALARIU_MAX)
values ('PU_MAN', 'Purchasing Manager', 8000, 15000);
insert into FUNCTII (ID_FUNCTIE, DENUMIRE_FUNCTIE, SALARIU_MIN, SALARIU_MAX)
values ('PU_CLERK', 'Purchasing Clerk', 2500, 5500);
insert into FUNCTII (ID_FUNCTIE, DENUMIRE_FUNCTIE, SALARIU_MIN, SALARIU_MAX)
values ('ST_MAN', 'Stock Manager', 5500, 8500);
insert into FUNCTII (ID_FUNCTIE, DENUMIRE_FUNCTIE, SALARIU_MIN, SALARIU_MAX)
values ('ST_CLERK', 'Stock Clerk', 2000, 5000);
insert into FUNCTII (ID_FUNCTIE, DENUMIRE_FUNCTIE, SALARIU_MIN, SALARIU_MAX)
values ('SH_CLERK', 'Shipping Clerk', 2500, 5500);
insert into FUNCTII (ID_FUNCTIE, DENUMIRE_FUNCTIE, SALARIU_MIN, SALARIU_MAX)
values ('IT_PROG', 'Programmer', 4000, 10000);
insert into FUNCTII (ID_FUNCTIE, DENUMIRE_FUNCTIE, SALARIU_MIN, SALARIU_MAX)
values ('MK_MAN', 'Marketing Manager', 9000, 15000);
insert into FUNCTII (ID_FUNCTIE, DENUMIRE_FUNCTIE, SALARIU_MIN, SALARIU_MAX)
values ('MK_REP', 'Marketing Representative', 4000, 9000);
insert into FUNCTII (ID_FUNCTIE, DENUMIRE_FUNCTIE, SALARIU_MIN, SALARIU_MAX)
values ('HR_REP', 'Human Resources Representative', 4000, 9000);
insert into FUNCTII (ID_FUNCTIE, DENUMIRE_FUNCTIE, SALARIU_MIN, SALARIU_MAX)
values ('PR_REP', 'Public Relations Representative', 4500, 10500);
commit;
-- prompt 19 records loaded
-- prompt Loading CLIENTI...
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (147, 'Ishwarya', 'Roberts', null, 600, 'Ishwarya.Roberts@LAPWING.COM', to_date('21-03-2044', 'dd-mm-yyyy'), 'single', 'F', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (148, 'Gustav', 'Steenburgen', null, 600, 'Gustav.Steenburgen@PINTAIL.COM', to_date('10-04-1950', 'dd-mm-yyyy'), 'married', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (149, 'Markus', 'Rampling', null, 600, 'Markus.Rampling@PUFFIN.COM', to_date('20-04-2041', 'dd-mm-yyyy'), 'single', 'M', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (150, 'Goldie', 'Slater', null, 700, 'Goldie.Slater@PYRRHULOXIA.COM', to_date('11-05-1951', 'dd-mm-yyyy'), 'married', 'M', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (151, 'Divine', 'Aykroyd', null, 700, 'Divine.Aykroyd@REDSTART.COM', to_date('20-05-1976', 'dd-mm-yyyy'), 'single', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (152, 'Dieter', 'Matthau', null, 700, 'Dieter.Matthau@VERDIN.COM', to_date('09-06-2022', 'dd-mm-yyyy'), 'married', 'M', 'A: Below 30,000');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (153, 'Divine', 'Sheen', null, 700, 'Divine.Sheen@COWBIRD.COM', to_date('20-06-1967', 'dd-mm-yyyy'), 'single', 'M', 'I: 170,000 - 189,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (154, 'Frederic', 'Grodin', null, 700, 'Frederic.Grodin@CREEPER.COM', to_date('29-06-1965', 'dd-mm-yyyy'), 'single', 'F', 'L: 300,000 and above');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (155, 'Frederico', 'Romero', null, 700, 'Frederico.Romero@CURLEW.COM', to_date('09-07-2042', 'dd-mm-yyyy'), 'married', 'M', 'E: 90,000 - 109,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (156, 'Goldie', 'Montand', null, 700, 'Goldie.Montand@DIPPER.COM', to_date('09-08-1955', 'dd-mm-yyyy'), 'married', 'F', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (157, 'Sidney', 'Capshaw', null, 700, 'Sidney.Capshaw@DUNLIN.COM', to_date('18-08-1969', 'dd-mm-yyyy'), 'single', 'M', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (158, 'Frederico', 'Lyon', null, 700, 'Frederico.Lyon@FLICKER.COM', to_date('07-09-1970', 'dd-mm-yyyy'), 'married', 'M', 'J: 190,000 - 249,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (159, 'Eddie', 'Boyer', null, 700, 'Eddie.Boyer@GALLINULE.COM', to_date('07-10-1953', 'dd-mm-yyyy'), 'married', 'M', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (160, 'Eddie', 'Stern', null, 700, 'Eddie.Stern@GODWIT.COM', to_date('06-11-1950', 'dd-mm-yyyy'), 'married', 'M', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (161, 'Ernest', 'Weaver', null, 900, 'Ernest.Weaver@GROSBEAK.COM', to_date('16-11-2042', 'dd-mm-yyyy'), 'single', 'M', 'B: 30,000 - 49,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (162, 'Ernest', 'George', null, 900, 'Ernest.George@LAPWING.COM', to_date('07-12-1975', 'dd-mm-yyyy'), 'married', 'M', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (163, 'Ernest', 'Chandar', null, 900, 'Ernest.Chandar@LIMPKIN.COM', to_date('16-12-1962', 'dd-mm-yyyy'), 'single', 'M', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (164, 'Charlotte', 'Kazan', null, 1200, 'Charlotte.Kazan@MERGANSER.COM', to_date('05-01-1954', 'dd-mm-yyyy'), 'married', 'M', 'I: 170,000 - 189,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (165, 'Charlotte', 'Fonda', null, 1200, 'Charlotte.Fonda@MOORHEN.COM', to_date('05-02-1956', 'dd-mm-yyyy'), 'married', 'M', 'J: 190,000 - 249,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (166, 'Dheeraj', 'Alexander', null, 1200, 'Dheeraj.Alexander@NUTHATCH.COM', to_date('14-02-1950', 'dd-mm-yyyy'), 'single', 'F', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (167, 'Gerard', 'Hershey', null, 1200, 'Gerard.Hershey@PARULA.COM', to_date('06-03-2048', 'dd-mm-yyyy'), 'married', 'M', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (169, 'Dheeraj', 'Davis', null, 1200, 'Dheeraj.Davis@PIPIT.COM', to_date('05-04-1981', 'dd-mm-yyyy'), 'married', 'F', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (170, 'Harry Dean', 'Fonda', null, 1200, 'HarryDean.Fonda@PLOVER.COM', to_date('15-04-1988', 'dd-mm-yyyy'), 'single', 'M', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (171, 'Hema', 'Powell', null, 1200, 'Hema.Powell@SANDERLING.COM', to_date('05-05-1953', 'dd-mm-yyyy'), 'married', 'M', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (173, 'Kathleen', 'Walken', null, 1200, 'Kathleen.Walken@VIREO.COM', to_date('04-06-1973', 'dd-mm-yyyy'), 'married', 'F', 'E: 90,000 - 109,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (174, 'Blake', 'Seignier', null, 1200, 'Blake.Seignier@GALLINULE.COM', to_date('14-06-1988', 'dd-mm-yyyy'), 'single', 'M', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (175, 'Claude', 'Powell', null, 1200, 'Claude.Powell@GODWIT.COM', to_date('04-07-2046', 'dd-mm-yyyy'), 'married', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (176, 'Faye', 'Glenn', null, 1200, 'Faye.Glenn@GREBE.COM', to_date('14-07-2047', 'dd-mm-yyyy'), 'single', 'F', 'B: 30,000 - 49,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (178, 'Grace', 'Belushi', null, 1200, 'Grace.Belushi@KILLDEER.COM', to_date('02-09-1986', 'dd-mm-yyyy'), 'married', 'M', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (179, 'Harry dean', 'Forrest', null, 1200, 'Harrydean.Forrest@KISKADEE.COM', to_date('12-09-1974', 'dd-mm-yyyy'), 'single', 'M', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (180, 'Harry dean', 'Cage', null, 1200, 'Harrydean.Cage@LAPWING.COM', to_date('02-10-1975', 'dd-mm-yyyy'), 'married', 'F', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (182, 'Lauren', 'Dench', null, 1200, 'Lauren.Dench@LONGSPUR.COM', to_date('22-10-1975', 'dd-mm-yyyy'), 'single', 'M', 'K: 250,000 - 299,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (183, 'Lauren', 'Altman', null, 1200, 'Lauren.Altman@MERGANSER.COM', to_date('01-11-1968', 'dd-mm-yyyy'), 'married', 'F', 'C: 50,000 - 69,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (184, 'Mary Beth', 'Roberts', null, 1200, 'MaryBeth.Roberts@NUTHATCH.COM', to_date('11-11-2027', 'dd-mm-yyyy'), 'single', 'M', 'A: Below 30,000');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (185, 'Matthew', 'Wright', null, 1200, 'Matthew.Wright@OVENBIRD.COM', to_date('01-12-1959', 'dd-mm-yyyy'), 'married', 'F', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (187, 'Grace', 'Dvrrie', null, 1200, 'Grace.Dvrrie@PHOEBE.COM', to_date('31-12-2048', 'dd-mm-yyyy'), 'married', 'F', 'E: 90,000 - 109,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (188, 'Charlotte', 'Buckley', null, 1200, 'Charlotte.Buckley@PINTAIL.COM', to_date('10-01-2049', 'dd-mm-yyyy'), 'single', 'F', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (189, 'Gena', 'Harris', null, 1200, 'Gena.Harris@PIPIT.COM', to_date('30-01-1955', 'dd-mm-yyyy'), 'married', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (191, 'Maureen', 'Sanders', null, 1200, 'Maureen.Sanders@PUFFIN.COM', to_date('29-02-2024', 'dd-mm-yyyy'), 'married', 'M', 'A: Below 30,000');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (192, 'Sean', 'Stockwell', null, 1200, 'Sean.Stockwell@PYRRHULOXIA.COM', to_date('30-03-1956', 'dd-mm-yyyy'), 'married', 'M', 'I: 170,000 - 189,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (193, 'Harry dean', 'Kinski', null, 1200, 'Harrydean.Kinski@REDPOLL.COM', to_date('30-04-1955', 'dd-mm-yyyy'), 'married', 'M', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (194, 'Kathleen', 'Garcia', null, 1200, 'Kathleen.Garcia@REDSTART.COM', to_date('30-05-1971', 'dd-mm-yyyy'), 'married', 'F', 'I: 170,000 - 189,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (195, 'Sean', 'Olin', null, 1200, 'Sean.Olin@SCAUP.COM', to_date('09-06-1986', 'dd-mm-yyyy'), 'single', 'F', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (196, 'Gerard', 'Dench', null, 1200, 'Gerard.Dench@SCOTER.COM', to_date('29-06-1953', 'dd-mm-yyyy'), 'married', 'F', 'E: 90,000 - 109,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (197, 'Gerard', 'Altman', null, 1200, 'Gerard.Altman@SHRIKE.COM', to_date('08-07-1984', 'dd-mm-yyyy'), 'single', 'F', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (198, 'Maureen', 'de Funes', null, 1200, 'Maureen.deFunes@SISKIN.COM', to_date('29-07-2049', 'dd-mm-yyyy'), 'married', 'F', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (199, 'Clint', 'Chapman', null, 1400, 'Clint.Chapman@SNIPE.COM', to_date('07-08-1952', 'dd-mm-yyyy'), 'single', 'F', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (200, 'Clint', 'Gielgud', null, 1400, 'Clint.Gielgud@STILT.COM', to_date('28-08-1978', 'dd-mm-yyyy'), 'married', 'F', 'E: 90,000 - 109,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (201, 'Eric', 'Prashant', null, 1400, 'Eric.Prashant@TATTLER.COM', to_date('27-09-2043', 'dd-mm-yyyy'), 'married', 'F', 'C: 50,000 - 69,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (202, 'Ingrid', 'Welles', null, 1400, 'Ingrid.Welles@TEAL.COM', to_date('27-10-2039', 'dd-mm-yyyy'), 'married', 'M', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (203, 'Ingrid', 'Rampling', null, 1400, 'Ingrid.Rampling@WIGEON.COM', to_date('05-11-2048', 'dd-mm-yyyy'), 'single', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (204, 'Cliff', 'Puri', null, 1400, 'Cliff.Puri@CORMORANT.COM', to_date('26-11-1961', 'dd-mm-yyyy'), 'married', 'M', 'J: 190,000 - 249,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (205, 'Emily', 'Pollack', null, 1400, 'Emily.Pollack@DIPPER.COM', to_date('06-12-1955', 'dd-mm-yyyy'), 'single', 'M', 'L: 300,000 and above');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (206, 'Fritz', 'Hackman', null, 1400, 'Fritz.Hackman@DUNLIN.COM', to_date('26-12-1983', 'dd-mm-yyyy'), 'married', 'F', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (207, 'Cybill', 'Laughton', null, 1400, 'Cybill.Laughton@EIDER.COM', to_date('04-01-1989', 'dd-mm-yyyy'), 'single', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (208, 'Cyndi', 'Griem', null, 1400, 'Cyndi.Griem@GALLINULE.COM', to_date('25-01-1956', 'dd-mm-yyyy'), 'married', 'M', 'E: 90,000 - 109,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (209, 'Cyndi', 'Collins', null, 1400, 'Cyndi.Collins@GODWIT.COM', to_date('04-02-2046', 'dd-mm-yyyy'), 'single', 'M', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (210, 'Cybill', 'Clapton', null, 1400, 'Cybill.Clapton@GOLDENEYE.COM', to_date('24-02-1974', 'dd-mm-yyyy'), 'married', 'F', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (211, 'Luchino', 'Jordan', null, 1500, 'Luchino.Jordan@GREBE.COM', to_date('06-03-1983', 'dd-mm-yyyy'), 'single', 'F', 'A: Below 30,000');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (212, 'Luchino', 'Falk', null, 1500, 'Luchino.Falk@OVENBIRD.COM', to_date('25-03-1972', 'dd-mm-yyyy'), 'married', 'M', 'L: 300,000 and above');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (214, 'Robin', 'Danson', null, 1500, 'Robin.Danson@PHAINOPEPLA.COM', to_date('05-05-2046', 'dd-mm-yyyy'), 'single', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (215, 'Orson', 'Perkins', null, 1900, 'Orson.Perkins@PINTAIL.COM', to_date('24-05-1985', 'dd-mm-yyyy'), 'married', 'M', 'E: 90,000 - 109,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (216, 'Orson', 'Koirala', null, 1900, 'Orson.Koirala@PIPIT.COM', to_date('04-06-1979', 'dd-mm-yyyy'), 'single', 'F', 'J: 190,000 - 249,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (218, 'Bryan', 'Dvrrie', null, 2300, 'Bryan.Dvrrie@REDPOLL.COM', to_date('04-07-1966', 'dd-mm-yyyy'), 'single', 'F', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (219, 'Ajay', 'Sen', null, 2300, 'Ajay.Sen@TROGON.COM', to_date('13-07-1977', 'dd-mm-yyyy'), 'single', 'M', 'K: 250,000 - 299,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (220, 'Carol', 'Jordan', null, 2300, 'Carol.Jordan@TURNSTONE.COM', to_date('23-07-1976', 'dd-mm-yyyy'), 'married', 'M', 'I: 170,000 - 189,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (221, 'Carol', 'Bradford', null, 2300, 'Carol.Bradford@VERDIN.COM', to_date('02-08-1953', 'dd-mm-yyyy'), 'single', 'M', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (223, 'Cary', 'Olin', null, 2300, 'Cary.Olin@WATERTHRUSH.COM', to_date('02-09-2035', 'dd-mm-yyyy'), 'single', 'M', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (224, 'Clara', 'Krige', null, 2300, 'Clara.Krige@WHIMBREL.COM', to_date('22-09-1959', 'dd-mm-yyyy'), 'married', 'M', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (225, 'Clara', 'Ganesan', null, 2300, 'Clara.Ganesan@WIGEON.COM', to_date('02-10-1959', 'dd-mm-yyyy'), 'single', 'F', 'I: 170,000 - 189,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (227, 'Kathy', 'Prashant', null, 2400, 'Kathy.Prashant@ANI.COM', to_date('01-11-1983', 'dd-mm-yyyy'), 'single', 'M', 'J: 190,000 - 249,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (228, 'Graham', 'Neeson', null, 2400, 'Graham.Neeson@AUKLET.COM', to_date('20-11-2041', 'dd-mm-yyyy'), 'married', 'M', 'E: 90,000 - 109,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (229, 'Ian', 'Chapman', null, 2400, 'Ian.Chapman@AVOCET.COM', to_date('30-11-1965', 'dd-mm-yyyy'), 'single', 'M', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (230, 'Danny', 'Wright', null, 2400, 'Danny.Wright@BITTERN.COM', to_date('20-12-2048', 'dd-mm-yyyy'), 'married', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (232, 'Donald', 'Hunter', null, 2400, 'Donald.Hunter@CHACHALACA.COM', to_date('20-01-1960', 'dd-mm-yyyy'), 'married', 'M', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (233, 'Graham', 'Spielberg', null, 2400, 'Graham.Spielberg@CHUKAR.COM', to_date('29-01-1970', 'dd-mm-yyyy'), 'single', 'M', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (234, 'Dan', 'Roberts', null, 2400, 'Dan.Roberts@NUTHATCH.COM', to_date('18-02-1973', 'dd-mm-yyyy'), 'married', 'M', 'I: 170,000 - 189,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (235, 'Edward', 'Oates', null, 2400, 'Edward.Oates@OVENBIRD.COM', to_date('21-03-1955', 'dd-mm-yyyy'), 'married', 'M', 'E: 90,000 - 109,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (237, 'Farrah', 'Quinlan', null, 2400, 'Farrah.Quinlan@PHAINOPEPLA.COM', to_date('19-04-2048', 'dd-mm-yyyy'), 'married', 'M', 'A: Below 30,000');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (478, 'Rosanne', 'Baldwin', null, 300, 'Rosanne.Baldwin@AUKLET.COM', to_date('29-08-1967', 'dd-mm-yyyy'), 'married', 'F', 'A: Below 30,000');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (480, 'Roxanne', 'Michalkow', null, 1200, 'Roxanne.Michalkow@EIDER.COM', to_date('18-09-1973', 'dd-mm-yyyy'), 'single', 'M', 'L: 300,000 and above');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (481, 'Roy', 'Hulce', null, 5000, 'Roy.Hulce@SISKIN.COM', to_date('28-09-1967', 'dd-mm-yyyy'), 'married', 'F', 'E: 90,000 - 109,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (482, 'Roy', 'Dunaway', null, 5000, 'Roy.Dunaway@WHIMBREL.COM', to_date('28-10-1955', 'dd-mm-yyyy'), 'married', 'F', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (487, 'Rufus', 'Dvrrie', null, 1900, 'Rufus.Dvrrie@PLOVER.COM', to_date('26-11-1960', 'dd-mm-yyyy'), 'married', 'M', 'J: 190,000 - 249,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (488, 'Rufus', 'Belushi', null, 1900, 'Rufus.Belushi@PUFFIN.COM', to_date('26-12-1952', 'dd-mm-yyyy'), 'married', 'M', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (492, 'Sally', 'Edwards', null, 2500, 'Sally.Edwards@TURNSTONE.COM', to_date('06-01-1980', 'dd-mm-yyyy'), 'married', 'F', 'K: 250,000 - 299,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (101, 'Constantin', 'Welles', null, 100, 'Constantin.Welles@ANHINGA.COM', to_date('20-02-1972', 'dd-mm-yyyy'), 'married', 'M', 'B: 30,000 - 49,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (102, 'Harrison', 'Pacino', null, 100, 'Harrison.Pacino@ANI.COM', to_date('02-03-1953', 'dd-mm-yyyy'), 'single', 'M', 'I: 170,000 - 189,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (103, 'Manisha', 'Taylor', null, 100, 'Manisha.Taylor@AUKLET.COM', to_date('22-03-1983', 'dd-mm-yyyy'), 'married', 'F', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (104, 'Harrison', 'Sutherland', null, 100, 'Harrison.Sutherland@GODWIT.COM', to_date('31-03-1972', 'dd-mm-yyyy'), 'single', 'F', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (105, 'Matthias', 'MacGraw', null, 100, 'Matthias.MacGraw@GOLDENEYE.COM', to_date('21-04-1969', 'dd-mm-yyyy'), 'married', 'F', 'C: 50,000 - 69,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (106, 'Matthias', 'Hannah', null, 100, 'Matthias.Hannah@GREBE.COM', to_date('30-04-1960', 'dd-mm-yyyy'), 'single', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (107, 'Matthias', 'Cruise', null, 100, 'Matthias.Cruise@GROSBEAK.COM', to_date('21-05-1969', 'dd-mm-yyyy'), 'married', 'F', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (108, 'Meenakshi', 'Mason', null, 100, 'Meenakshi.Mason@JACANA.COM', to_date('20-06-1957', 'dd-mm-yyyy'), 'married', 'M', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (109, 'Christian', 'Cage', null, 100, 'Christian.Cage@KINGLET.COM', to_date('30-06-2038', 'dd-mm-yyyy'), 'single', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (110, 'Charlie', 'Sutherland', null, 200, 'Charlie.Sutherland@LIMPKIN.COM', to_date('20-07-1951', 'dd-mm-yyyy'), 'married', 'M', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (111, 'Charlie', 'Pacino', null, 200, 'Charlie.Pacino@LONGSPUR.COM', to_date('29-07-2048', 'dd-mm-yyyy'), 'single', 'M', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (112, 'Guillaume', 'Jackson', null, 200, 'Guillaume.Jackson@MOORHEN.COM', to_date('19-08-1954', 'dd-mm-yyyy'), 'married', 'M', 'I: 170,000 - 189,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (113, 'Daniel', 'Costner', null, 200, 'Daniel.Costner@PARULA.COM', to_date('29-08-1977', 'dd-mm-yyyy'), 'single', 'M', 'I: 170,000 - 189,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (114, 'Dianne', 'Derek', null, 200, 'Dianne.Derek@SAW-WHET.COM', to_date('17-09-2048', 'dd-mm-yyyy'), 'married', 'M', 'H: 150,000 - 169,999');
commit;
-- prompt 100 records committed...
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (115, 'Geraldine', 'Schneider', null, 200, 'Geraldine.Schneider@SCAUP.COM', to_date('18-10-2031', 'dd-mm-yyyy'), 'married', 'M', 'B: 30,000 - 49,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (116, 'Geraldine', 'Martin', null, 200, 'Geraldine.Martin@SCOTER.COM', to_date('28-10-2027', 'dd-mm-yyyy'), 'single', 'M', 'A: Below 30,000');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (117, 'Guillaume', 'Edwards', null, 200, 'Guillaume.Edwards@SHRIKE.COM', to_date('16-11-1952', 'dd-mm-yyyy'), 'married', 'M', 'E: 90,000 - 109,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (118, 'Maurice', 'Mahoney', null, 200, 'Maurice.Mahoney@SNIPE.COM', to_date('27-11-1966', 'dd-mm-yyyy'), 'single', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (120, 'Diane', 'Higgins', null, 200, 'Diane.Higgins@TANAGER.COM', to_date('26-12-1984', 'dd-mm-yyyy'), 'single', 'M', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (121, 'Dianne', 'Sen', null, 200, 'Dianne.Sen@TATTLER.COM', to_date('15-01-1953', 'dd-mm-yyyy'), 'married', 'M', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (122, 'Maurice', 'Daltrey', null, 200, 'Maurice.Daltrey@TEAL.COM', to_date('15-02-2043', 'dd-mm-yyyy'), 'married', 'M', 'A: Below 30,000');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (123, 'Elizabeth', 'Brown', null, 200, 'Elizabeth.Brown@THRASHER.COM', to_date('24-02-2049', 'dd-mm-yyyy'), 'single', 'F', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (125, 'Dianne', 'Andrews', null, 200, 'Dianne.Andrews@TURNSTONE.COM', to_date('27-03-1959', 'dd-mm-yyyy'), 'single', 'F', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (126, 'Charles', 'Field', null, 300, 'Charles.Field@BECARD.COM', to_date('16-04-2046', 'dd-mm-yyyy'), 'married', 'F', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (127, 'Charles', 'Broderick', null, 300, 'Charles.Broderick@BITTERN.COM', to_date('26-04-2043', 'dd-mm-yyyy'), 'single', 'F', 'B: 30,000 - 49,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (129, 'Louis', 'Jackson', null, 400, 'Louis.Jackson@CARACARA.COM', to_date('26-05-2039', 'dd-mm-yyyy'), 'single', 'M', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (130, 'Louis', 'Edwards', null, 400, 'Louis.Edwards@CHACHALACA.COM', to_date('14-06-2044', 'dd-mm-yyyy'), 'married', 'M', 'C: 50,000 - 69,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (131, 'Doris', 'Dutt', null, 400, 'Doris.Dutt@CHUKAR.COM', to_date('14-07-1976', 'dd-mm-yyyy'), 'married', 'F', 'C: 50,000 - 69,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (132, 'Doris', 'Spacek', null, 400, 'Doris.Spacek@FLICKER.COM', to_date('25-07-1987', 'dd-mm-yyyy'), 'single', 'M', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (134, 'Sissy', 'Puri', null, 400, 'Sissy.Puri@GREBE.COM', to_date('12-09-1972', 'dd-mm-yyyy'), 'married', 'F', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (135, 'Doris', 'Bel Geddes', null, 400, 'Doris.BelGeddes@GROSBEAK.COM', to_date('22-09-1980', 'dd-mm-yyyy'), 'single', 'F', 'B: 30,000 - 49,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (136, 'Sissy', 'Warden', null, 400, 'Sissy.Warden@JACANA.COM', to_date('12-10-2044', 'dd-mm-yyyy'), 'married', 'F', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (138, 'Mani', 'Fonda', null, 500, 'Mani.Fonda@KINGLET.COM', to_date('11-11-1977', 'dd-mm-yyyy'), 'married', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (139, 'Placido', 'Kubrick', null, 500, 'Placido.Kubrick@SCOTER.COM', to_date('22-11-2042', 'dd-mm-yyyy'), 'single', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (140, 'Claudia', 'Kurosawa', null, 500, 'Claudia.Kurosawa@CHUKAR.COM', to_date('11-12-1981', 'dd-mm-yyyy'), 'married', 'M', 'E: 90,000 - 109,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (141, 'Maximilian', 'Henner', null, 500, 'Maximilian.Henner@DUNLIN.COM', to_date('21-12-1973', 'dd-mm-yyyy'), 'single', 'M', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (143, 'Sachin', 'Neeson', null, 500, 'Sachin.Neeson@GALLINULE.COM', to_date('20-01-1962', 'dd-mm-yyyy'), 'single', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (144, 'Sivaji', 'Landis', null, 500, 'Sivaji.Landis@GOLDENEYE.COM', to_date('09-02-1970', 'dd-mm-yyyy'), 'married', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (145, 'Mammutti', 'Pacino', null, 500, 'Mammutti.Pacino@GREBE.COM', to_date('19-02-2046', 'dd-mm-yyyy'), 'single', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (496, 'Scott', 'Jordan', null, 5000, 'Scott.Jordan@WILLET.COM', to_date('25-01-2045', 'dd-mm-yyyy'), 'married', 'F', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (605, 'Shammi', 'Pacino', null, 500, 'Shammi.Pacino@BITTERN.COM', to_date('05-02-1959', 'dd-mm-yyyy'), 'single', 'F', 'B: 30,000 - 49,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (606, 'Sharmila', 'Kazan', null, 500, 'Sharmila.Kazan@BRANT.COM', to_date('25-02-2038', 'dd-mm-yyyy'), 'married', 'F', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (607, 'Sharmila', 'Fonda', null, 500, 'Sharmila.Fonda@BUFFLEHEAD.COM', to_date('06-03-2049', 'dd-mm-yyyy'), 'single', 'F', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (609, 'Shelley', 'Taylor', null, 3700, 'Shelley.Taylor@CURLEW.COM', to_date('26-03-1957', 'dd-mm-yyyy'), 'married', 'F', 'I: 170,000 - 189,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (615, 'Shyam', 'Plummer', null, 2500, 'Shyam.Plummer@VEERY.COM', to_date('25-04-1969', 'dd-mm-yyyy'), 'married', 'M', 'J: 190,000 - 249,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (621, 'Silk', 'Kurosawa', null, 1500, 'Silk.Kurosawa@NUTHATCH.COM', to_date('05-05-1984', 'dd-mm-yyyy'), 'single', 'F', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (627, 'Sivaji', 'Gielgud', null, 500, 'Sivaji.Gielgud@BULBUL.COM', to_date('25-05-2049', 'dd-mm-yyyy'), 'married', 'F', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (712, 'M. Emmet', 'Stockwell', null, 3700, 'M.Emmet.Stockwell@COOT.COM', to_date('05-06-1983', 'dd-mm-yyyy'), 'single', 'M', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (713, 'M. Emmet', 'Olin', null, 3700, 'M.Emmet.Olin@CORMORANT.COM', to_date('24-06-2048', 'dd-mm-yyyy'), 'married', 'F', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (715, 'Malcolm', 'Field', null, 2400, 'Malcolm.Field@DOWITCHER.COM', to_date('05-07-1951', 'dd-mm-yyyy'), 'single', 'F', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (717, 'Mammutti', 'Sutherland', null, 500, 'Mammutti.Sutherland@TOWHEE.COM', to_date('25-07-1974', 'dd-mm-yyyy'), 'married', 'M', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (719, 'Mani', 'Kazan', null, 500, 'Mani.Kazan@TROGON.COM', to_date('04-08-1962', 'dd-mm-yyyy'), 'single', 'M', 'I: 170,000 - 189,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (721, 'Mani', 'Buckley', null, 500, 'Mani.Buckley@TURNSTONE.COM', to_date('23-08-2044', 'dd-mm-yyyy'), 'married', 'M', 'E: 90,000 - 109,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (727, 'Margaret', 'Ustinov', null, 1200, 'Margaret.Ustinov@ANHINGA.COM', to_date('02-09-2049', 'dd-mm-yyyy'), 'single', 'M', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (729, 'Margaux', 'Krige', null, 2400, 'Margaux.Krige@DUNLIN.COM', to_date('23-09-2042', 'dd-mm-yyyy'), 'married', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (754, 'Kevin', 'Goodman', null, 700, 'Kevin.Goodman@WIGEON.COM', to_date('22-10-2048', 'dd-mm-yyyy'), 'married', 'M', 'E: 90,000 - 109,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (755, 'Kevin', 'Cleveland', null, 700, 'Kevin.Cleveland@WILLET.COM', to_date('21-11-1981', 'dd-mm-yyyy'), 'married', 'M', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (756, 'Kevin', 'Wilder', null, 700, 'Kevin.Wilder@AUKLET.COM', to_date('02-12-1986', 'dd-mm-yyyy'), 'single', 'M', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (766, 'Klaus', 'Young', null, 600, 'Klaus.Young@OVENBIRD.COM', to_date('01-01-1955', 'dd-mm-yyyy'), 'single', 'M', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (767, 'Klaus Maria', 'Russell', null, 100, 'KlausMaria.Russell@COOT.COM', to_date('20-01-1970', 'dd-mm-yyyy'), 'married', 'M', 'C: 50,000 - 69,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (768, 'Klaus Maria', 'MacLaine', null, 100, 'KlausMaria.MacLaine@CHUKAR.COM', to_date('31-01-1980', 'dd-mm-yyyy'), 'single', 'M', 'A: Below 30,000');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (770, 'Kris', 'Curtis', null, 400, 'Kris.Curtis@DOWITCHER.COM', to_date('02-03-1955', 'dd-mm-yyyy'), 'single', 'M', 'K: 250,000 - 299,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (771, 'Kris', 'de Niro', null, 400, 'Kris.deNiro@DUNLIN.COM', to_date('21-03-1977', 'dd-mm-yyyy'), 'married', 'M', 'E: 90,000 - 109,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (782, 'Laurence', 'Seignier', null, 1200, 'Laurence.Seignier@CREEPER.COM', to_date('21-04-1983', 'dd-mm-yyyy'), 'married', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (825, 'Alain', 'Dreyfuss', null, 500, 'Alain.Dreyfuss@VEERY.COM', to_date('30-04-1976', 'dd-mm-yyyy'), 'single', 'M', 'J: 190,000 - 249,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (826, 'Alain', 'Barkin', null, 500, 'Alain.Barkin@VERDIN.COM', to_date('20-05-1969', 'dd-mm-yyyy'), 'married', 'M', 'A: Below 30,000');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (828, 'Alan', 'Minnelli', null, 2300, 'Alan.Minnelli@TANAGER.COM', to_date('20-07-1955', 'dd-mm-yyyy'), 'married', 'M', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (829, 'Alan', 'Hunter', null, 2300, 'Alan.Hunter@TATTLER.COM', to_date('19-08-1959', 'dd-mm-yyyy'), 'married', 'M', 'I: 170,000 - 189,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (830, 'Albert', 'Dutt', null, 3500, 'Albert.Dutt@CURLEW.COM', to_date('29-08-2047', 'dd-mm-yyyy'), 'single', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (832, 'Albert', 'Spacek', null, 3500, 'Albert.Spacek@DOWITCHER.COM', to_date('27-09-1976', 'dd-mm-yyyy'), 'single', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (833, 'Alec', 'Moranis', null, 3500, 'Alec.Moranis@DUNLIN.COM', to_date('17-10-2034', 'dd-mm-yyyy'), 'married', 'M', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (834, 'Alec', 'Idle', null, 3500, 'Alec.Idle@EIDER.COM', to_date('27-10-1964', 'dd-mm-yyyy'), 'single', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (836, 'Alexander', 'Berenger', null, 1200, 'Alexander.Berenger@BECARD.COM', to_date('16-12-1952', 'dd-mm-yyyy'), 'married', 'F', 'C: 50,000 - 69,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (837, 'Alexander', 'Stanton', null, 1200, 'Alexander.Stanton@AUKLET.COM', to_date('15-01-1965', 'dd-mm-yyyy'), 'married', 'F', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (838, 'Alfred', 'Nicholson', null, 3500, 'Alfred.Nicholson@CREEPER.COM', to_date('25-01-1985', 'dd-mm-yyyy'), 'single', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (840, 'Ali', 'Elliott', null, 1400, 'Ali.Elliott@ANHINGA.COM', to_date('16-03-1951', 'dd-mm-yyyy'), 'married', 'M', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (841, 'Ali', 'Boyer', null, 1400, 'Ali.Boyer@WILLET.COM', to_date('26-03-1951', 'dd-mm-yyyy'), 'single', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (842, 'Ali', 'Stern', null, 1400, 'Ali.Stern@YELLOWTHROAT.COM', to_date('15-04-1977', 'dd-mm-yyyy'), 'married', 'M', 'E: 90,000 - 109,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (844, 'Alice', 'Julius', null, 700, 'Alice.Julius@BITTERN.COM', to_date('15-05-2044', 'dd-mm-yyyy'), 'married', 'F', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (845, 'Ally', 'Fawcett', null, 5000, 'Ally.Fawcett@PLOVER.COM', to_date('25-05-2044', 'dd-mm-yyyy'), 'single', 'F', 'A: Below 30,000');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (847, 'Ally', 'Streep', null, 5000, 'Ally.Streep@PIPIT.COM', to_date('14-07-2042', 'dd-mm-yyyy'), 'married', 'M', 'A: Below 30,000');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (848, 'Alonso', 'Olmos', null, 1800, 'Alonso.Olmos@PHALAROPE.COM', to_date('24-07-2048', 'dd-mm-yyyy'), 'single', 'F', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (849, 'Alonso', 'Kaurusmdki', null, 1800, 'Alonso.Kaurusmdki@PHOEBE.COM', to_date('13-08-1980', 'dd-mm-yyyy'), 'married', 'F', 'E: 90,000 - 109,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (850, 'Amanda', 'Finney', null, 2300, 'Amanda.Finney@STILT.COM', to_date('23-08-1991', 'dd-mm-yyyy'), 'single', 'M', 'J: 190,000 - 249,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (851, 'Amanda', 'Brown', null, 2300, 'Amanda.Brown@THRASHER.COM', to_date('12-09-1951', 'dd-mm-yyyy'), 'married', 'F', 'B: 30,000 - 49,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (852, 'Amanda', 'Tanner', null, 2300, 'Amanda.Tanner@TEAL.COM', to_date('22-09-1953', 'dd-mm-yyyy'), 'single', 'F', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (853, 'Amrish', 'Palin', null, 400, 'Amrish.Palin@EIDER.COM', to_date('12-10-1977', 'dd-mm-yyyy'), 'married', 'F', 'I: 170,000 - 189,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (905, 'Billy', 'Hershey', null, 1400, 'Billy.Hershey@BULBUL.COM', to_date('22-10-1987', 'dd-mm-yyyy'), 'single', 'F', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (906, 'Billy', 'Dench', null, 1400, 'Billy.Dench@CARACARA.COM', to_date('11-11-1958', 'dd-mm-yyyy'), 'married', 'M', 'I: 170,000 - 189,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (909, 'Blake', 'Mastroianni', null, 1200, 'Blake.Mastroianni@FLICKER.COM', to_date('21-11-2049', 'dd-mm-yyyy'), 'single', 'M', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (911, 'Bo', 'Dickinson', null, 5000, 'Bo.Dickinson@TANAGER.COM', to_date('11-12-1981', 'dd-mm-yyyy'), 'married', 'M', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (912, 'Bo', 'Ashby', null, 5000, 'Bo.Ashby@TATTLER.COM', to_date('21-12-1956', 'dd-mm-yyyy'), 'single', 'M', 'I: 170,000 - 189,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (913, 'Bob', 'Sharif', null, 5000, 'Bob.Sharif@TEAL.COM', to_date('10-01-1985', 'dd-mm-yyyy'), 'married', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (916, 'Brian', 'Douglas', null, 500, 'Brian.Douglas@AVOCET.COM', to_date('20-01-1978', 'dd-mm-yyyy'), 'single', 'M', 'J: 190,000 - 249,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (917, 'Brian', 'Baldwin', null, 500, 'Brian.Baldwin@BECARD.COM', to_date('09-02-1975', 'dd-mm-yyyy'), 'married', 'M', 'E: 90,000 - 109,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (919, 'Brooke', 'Michalkow', null, 3500, 'Brooke.Michalkow@GROSBEAK.COM', to_date('19-02-1962', 'dd-mm-yyyy'), 'single', 'M', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (920, 'Bruce', 'Hulce', null, 3500, 'Bruce.Hulce@JACANA.COM', to_date('10-03-1972', 'dd-mm-yyyy'), 'married', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (921, 'Bruce', 'Dunaway', null, 3500, 'Bruce.Dunaway@JUNCO.COM', to_date('20-03-2048', 'dd-mm-yyyy'), 'single', 'F', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (923, 'Bruno', 'Slater', null, 5000, 'Bruno.Slater@THRASHER.COM', to_date('09-04-1960', 'dd-mm-yyyy'), 'married', 'F', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (924, 'Bruno', 'Montand', null, 5000, 'Bruno.Montand@TOWHEE.COM', to_date('20-04-2034', 'dd-mm-yyyy'), 'single', 'F', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (928, 'Burt', 'Spielberg', null, 5000, 'Burt.Spielberg@TROGON.COM', to_date('09-06-1954', 'dd-mm-yyyy'), 'married', 'M', 'E: 90,000 - 109,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (929, 'Burt', 'Neeson', null, 5000, 'Burt.Neeson@TURNSTONE.COM', to_date('19-06-1978', 'dd-mm-yyyy'), 'single', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (930, 'Buster', 'Jackson', null, 900, 'Buster.Jackson@KILLDEER.COM', to_date('08-07-2024', 'dd-mm-yyyy'), 'married', 'M', 'A: Below 30,000');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (932, 'Buster', 'Bogart', null, 900, 'Buster.Bogart@KISKADEE.COM', to_date('17-08-1952', 'dd-mm-yyyy'), 'single', 'M', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (934, 'C. Thomas', 'Nolte', null, 600, 'C.Thomas.Nolte@PHOEBE.COM', to_date('07-09-1959', 'dd-mm-yyyy'), 'married', 'M', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (980, 'Daniel', 'Loren', null, 200, 'Daniel.Loren@REDSTART.COM', to_date('17-09-1970', 'dd-mm-yyyy'), 'single', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (119, 'Maurice', 'Hasan', null, 200, 'Maurice.Hasan@STILT.COM', to_date('17-12-1965', 'dd-mm-yyyy'), 'married', 'M', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (124, 'Diane', 'Mason', null, 200, 'Diane.Mason@TROGON.COM', to_date('16-03-1981', 'dd-mm-yyyy'), 'married', 'F', 'K: 250,000 - 299,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (128, 'Isabella', 'Reed', null, 300, 'Isabella.Reed@BRANT.COM', to_date('16-05-1954', 'dd-mm-yyyy'), 'married', 'F', 'J: 190,000 - 249,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (133, 'Kristin', 'Malden', null, 400, 'Kristin.Malden@GODWIT.COM', to_date('14-08-1950', 'dd-mm-yyyy'), 'married', 'F', 'C: 50,000 - 69,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (137, 'Elia', 'Brando', null, 500, 'Elia.Brando@JUNCO.COM', to_date('23-10-1951', 'dd-mm-yyyy'), 'single', 'M', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (142, 'Sachin', 'Spielberg', null, 500, 'Sachin.Spielberg@GADWALL.COM', to_date('11-01-1971', 'dd-mm-yyyy'), 'married', 'M', 'C: 50,000 - 69,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (146, 'Elia', 'Fawcett', null, 500, 'Elia.Fawcett@JACANA.COM', to_date('12-03-1963', 'dd-mm-yyyy'), 'married', 'F', 'L: 300,000 and above');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (168, 'Hema', 'Voight', null, 1200, 'Hema.Voight@PHALAROPE.COM', to_date('16-03-1950', 'dd-mm-yyyy'), 'single', 'M', 'H: 150,000 - 169,999');
commit;
-- prompt 200 records committed...
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (172, 'Harry Mean', 'Peckinpah', null, 1200, 'HarryMean.Peckinpah@VERDIN.COM', to_date('15-05-1959', 'dd-mm-yyyy'), 'single', 'M', 'I: 170,000 - 189,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (177, 'Gerhard', 'Seignier', null, 1200, 'Gerhard.Seignier@JACANA.COM', to_date('03-08-1978', 'dd-mm-yyyy'), 'married', 'M', 'E: 90,000 - 109,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (181, 'Lauren', 'Hershey', null, 1200, 'Lauren.Hershey@LIMPKIN.COM', to_date('12-10-1965', 'dd-mm-yyyy'), 'single', 'F', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (186, 'Meena', 'Alexander', null, 1200, 'Meena.Alexander@PARULA.COM', to_date('11-12-1961', 'dd-mm-yyyy'), 'single', 'F', 'K: 250,000 - 299,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (190, 'Gena', 'Curtis', null, 1200, 'Gena.Curtis@PLOVER.COM', to_date('09-02-1982', 'dd-mm-yyyy'), 'single', 'M', 'J: 190,000 - 249,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (213, 'Luchino', 'Bradford', null, 1500, 'Luchino.Bradford@PARULA.COM', to_date('24-04-1976', 'dd-mm-yyyy'), 'married', 'M', 'A: Below 30,000');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (217, 'Bryan', 'Huston', null, 2300, 'Bryan.Huston@PYRRHULOXIA.COM', to_date('23-06-1973', 'dd-mm-yyyy'), 'married', 'F', 'B: 30,000 - 49,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (222, 'Cary', 'Stockwell', null, 2300, 'Cary.Stockwell@VIREO.COM', to_date('23-08-1963', 'dd-mm-yyyy'), 'married', 'M', 'I: 170,000 - 189,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (226, 'Ajay', 'Andrews', null, 2300, 'Ajay.Andrews@YELLOWTHROAT.COM', to_date('21-10-1956', 'dd-mm-yyyy'), 'married', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (231, 'Danny', 'Rourke', null, 2400, 'Danny.Rourke@BRANT.COM', to_date('31-12-2047', 'dd-mm-yyyy'), 'single', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (236, 'Edward', 'Julius', null, 2400, 'Edward.Julius@PARULA.COM', to_date('30-03-1986', 'dd-mm-yyyy'), 'single', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (261, 'Emmet', 'Garcia', null, 3600, 'Emmet.Garcia@VIREO.COM', to_date('13-06-1961', 'dd-mm-yyyy'), 'married', 'M', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (266, 'Prem', 'Cardinale', null, 3700, 'Prem.Cardinale@BITTERN.COM', to_date('01-09-1970', 'dd-mm-yyyy'), 'single', 'M', 'L: 300,000 and above');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (270, 'Meg', 'Derek', null, 3700, 'Meg.Derek@FLICKER.COM', to_date('10-11-1971', 'dd-mm-yyyy'), 'married', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (275, 'Dom', 'McQueen', null, 5000, 'Dom.McQueen@AUKLET.COM', to_date('08-02-1984', 'dd-mm-yyyy'), 'married', 'F', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (279, 'Holly', 'Kurosawa', null, 5000, 'Holly.Kurosawa@CARACARA.COM', to_date('19-04-1961', 'dd-mm-yyyy'), 'single', 'M', 'I: 170,000 - 189,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (283, 'Kurt', 'Heard', null, 5000, 'Kurt.Heard@CURLEW.COM', to_date('18-06-1994', 'dd-mm-yyyy'), 'single', 'M', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (352, 'Kenneth', 'Redford', null, 3600, 'Kenneth.Redford@REDSTART.COM', to_date('13-07-1971', 'dd-mm-yyyy'), 'single', 'F', 'B: 30,000 - 49,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (378, 'Meg', 'Sen', null, 3700, 'Meg.Sen@COWBIRD.COM', to_date('30-09-1953', 'dd-mm-yyyy'), 'married', 'M', 'C: 50,000 - 69,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (448, 'Richard', 'Winters', null, 500, 'Richard.Winters@SNIPE.COM', to_date('30-11-1954', 'dd-mm-yyyy'), 'married', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (452, 'Ridley', 'Coyote', null, 700, 'Ridley.Coyote@ANI.COM', to_date('31-01-2049', 'dd-mm-yyyy'), 'married', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (463, 'Robin', 'Adjani', null, 1500, 'Robin.Adjani@MOORHEN.COM', to_date('01-04-2049', 'dd-mm-yyyy'), 'married', 'F', 'C: 50,000 - 69,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (468, 'Rodolfo', 'Altman', null, 5000, 'Rodolfo.Altman@SHRIKE.COM', to_date('11-05-1983', 'dd-mm-yyyy'), 'single', 'F', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (475, 'Romy', 'McCarthy', null, 5000, 'Romy.McCarthy@STILT.COM', to_date('10-07-2033', 'dd-mm-yyyy'), 'single', 'F', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (479, 'Roxanne', 'Shepherd', null, 1200, 'Roxanne.Shepherd@DUNLIN.COM', to_date('08-09-1963', 'dd-mm-yyyy'), 'single', 'F', 'I: 170,000 - 189,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (483, 'Roy', 'Bates', null, 5000, 'Roy.Bates@WIGEON.COM', to_date('07-11-2042', 'dd-mm-yyyy'), 'single', 'M', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (731, 'Margaux', 'Capshaw', null, 2400, 'Margaux.Capshaw@EIDER.COM', to_date('02-10-2033', 'dd-mm-yyyy'), 'single', 'M', 'B: 30,000 - 49,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (757, 'Kiefer', 'Reynolds', null, 700, 'Kiefer.Reynolds@AVOCET.COM', to_date('21-12-1953', 'dd-mm-yyyy'), 'married', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (769, 'Kris', 'Harris', null, 400, 'Kris.Harris@DIPPER.COM', to_date('19-02-2049', 'dd-mm-yyyy'), 'married', 'M', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (772, 'Kristin', 'Savage', null, 400, 'Kristin.Savage@CURLEW.COM', to_date('01-04-2043', 'dd-mm-yyyy'), 'single', 'F', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (827, 'Alain', 'Siegel', null, 500, 'Alain.Siegel@VIREO.COM', to_date('19-06-1973', 'dd-mm-yyyy'), 'married', 'F', 'I: 170,000 - 189,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (831, 'Albert', 'Bel Geddes', null, 3500, 'Albert.BelGeddes@DIPPER.COM', to_date('17-09-1952', 'dd-mm-yyyy'), 'married', 'M', 'E: 90,000 - 109,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (835, 'Alexander', 'Eastwood', null, 1200, 'Alexander.Eastwood@AVOCET.COM', to_date('16-11-2042', 'dd-mm-yyyy'), 'married', 'F', 'E: 90,000 - 109,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (839, 'Alfred', 'Johnson', null, 3500, 'Alfred.Johnson@FLICKER.COM', to_date('14-02-1957', 'dd-mm-yyyy'), 'married', 'M', 'J: 190,000 - 249,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (843, 'Alice', 'Oates', null, 700, 'Alice.Oates@BECARD.COM', to_date('25-04-1959', 'dd-mm-yyyy'), 'single', 'F', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (846, 'Ally', 'Brando', null, 5000, 'Ally.Brando@PINTAIL.COM', to_date('14-06-1962', 'dd-mm-yyyy'), 'married', 'F', 'L: 300,000 and above');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (927, 'Bryan', 'Belushi', null, 2300, 'Bryan.Belushi@TOWHEE.COM', to_date('10-05-1961', 'dd-mm-yyyy'), 'married', 'M', 'I: 170,000 - 189,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (931, 'Buster', 'Edwards', null, 900, 'Buster.Edwards@KINGLET.COM', to_date('08-08-2047', 'dd-mm-yyyy'), 'married', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (981, 'Daniel', 'Gueney', null, 200, 'Daniel.Gueney@REDPOLL.COM', to_date('07-10-1973', 'dd-mm-yyyy'), 'married', 'M', 'K: 250,000 - 299,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (238, 'Farrah', 'Lange', null, 2400, 'Farrah.Lange@PHALAROPE.COM', to_date('19-05-1981', 'dd-mm-yyyy'), 'married', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (239, 'Hal', 'Stockwell', null, 2400, 'Hal.Stockwell@PHOEBE.COM', to_date('29-05-1966', 'dd-mm-yyyy'), 'single', 'M', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (240, 'Malcolm', 'Kanth', null, 2400, 'Malcolm.Kanth@PIPIT.COM', to_date('19-06-1955', 'dd-mm-yyyy'), 'married', 'F', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (241, 'Malcolm', 'Broderick', null, 2400, 'Malcolm.Broderick@PLOVER.COM', to_date('28-06-1952', 'dd-mm-yyyy'), 'single', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (242, 'Mary', 'Lemmon', null, 2400, 'Mary.Lemmon@PUFFIN.COM', to_date('18-07-1962', 'dd-mm-yyyy'), 'married', 'M', 'K: 250,000 - 299,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (243, 'Mary', 'Collins', null, 2400, 'Mary.Collins@PYRRHULOXIA.COM', to_date('18-08-1955', 'dd-mm-yyyy'), 'married', 'F', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (244, 'Matt', 'Gueney', null, 2400, 'Matt.Gueney@REDPOLL.COM', to_date('27-08-1952', 'dd-mm-yyyy'), 'single', 'M', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (245, 'Max', 'von Sydow', null, 2400, 'Max.vonSydow@REDSTART.COM', to_date('07-09-1967', 'dd-mm-yyyy'), 'single', 'M', 'K: 250,000 - 299,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (246, 'Max', 'Schell', null, 2400, 'Max.Schell@SANDERLING.COM', to_date('16-09-1984', 'dd-mm-yyyy'), 'married', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (247, 'Cynda', 'Whitcraft', null, 2400, 'Cynda.Whitcraft@SANDPIPER.COM', to_date('16-10-1954', 'dd-mm-yyyy'), 'married', 'M', 'B: 30,000 - 49,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (248, 'Donald', 'Minnelli', null, 2400, 'Donald.Minnelli@SCAUP.COM', to_date('26-10-1953', 'dd-mm-yyyy'), 'single', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (249, 'Hannah', 'Broderick', null, 2400, 'Hannah.Broderick@SHRIKE.COM', to_date('16-11-1975', 'dd-mm-yyyy'), 'married', 'M', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (250, 'Dan', 'Williams', null, 2400, 'Dan.Williams@SISKIN.COM', to_date('25-11-1984', 'dd-mm-yyyy'), 'single', 'M', 'A: Below 30,000');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (251, 'Raul', 'Wilder', null, 2500, 'Raul.Wilder@STILT.COM', to_date('15-12-2045', 'dd-mm-yyyy'), 'married', 'M', 'E: 90,000 - 109,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (252, 'Shah Rukh', 'Field', null, 2500, 'ShahRukh.Field@WHIMBREL.COM', to_date('25-12-1957', 'dd-mm-yyyy'), 'single', 'M', 'I: 170,000 - 189,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (253, 'Sally', 'Bogart', null, 2500, 'Sally.Bogart@WILLET.COM', to_date('14-01-1985', 'dd-mm-yyyy'), 'married', 'M', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (254, 'Bruce', 'Bates', null, 3500, 'Bruce.Bates@COWBIRD.COM', to_date('25-01-2040', 'dd-mm-yyyy'), 'single', 'M', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (255, 'Brooke', 'Shepherd', null, 3500, 'Brooke.Shepherd@KILLDEER.COM', to_date('13-02-1985', 'dd-mm-yyyy'), 'married', 'M', 'C: 50,000 - 69,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (256, 'Ben', 'de Niro', null, 3500, 'Ben.deNiro@KINGLET.COM', to_date('24-02-1980', 'dd-mm-yyyy'), 'single', 'M', 'I: 170,000 - 189,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (257, 'Emmet', 'Walken', null, 3600, 'Emmet.Walken@LIMPKIN.COM', to_date('15-03-1975', 'dd-mm-yyyy'), 'married', 'M', 'B: 30,000 - 49,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (258, 'Ellen', 'Palin', null, 3600, 'Ellen.Palin@LONGSPUR.COM', to_date('14-04-1977', 'dd-mm-yyyy'), 'married', 'M', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (259, 'Denholm', 'von Sydow', null, 3600, 'Denholm.vonSydow@MERGANSER.COM', to_date('24-04-2043', 'dd-mm-yyyy'), 'single', 'F', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (260, 'Ellen', 'Khan', null, 3600, 'Ellen.Khan@VERDIN.COM', to_date('14-05-1962', 'dd-mm-yyyy'), 'married', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (262, 'Fred', 'Reynolds', null, 3600, 'Fred.Reynolds@WATERTHRUSH.COM', to_date('13-07-1958', 'dd-mm-yyyy'), 'married', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (263, 'Fred', 'Lithgow', null, 3600, 'Fred.Lithgow@WHIMBREL.COM', to_date('23-07-1979', 'dd-mm-yyyy'), 'single', 'M', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (264, 'George', 'Adjani', null, 3600, 'George.Adjani@WILLET.COM', to_date('12-08-2047', 'dd-mm-yyyy'), 'married', 'F', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (265, 'Irene', 'Laughton', null, 3600, 'Irene.Laughton@ANHINGA.COM', to_date('22-08-1973', 'dd-mm-yyyy'), 'single', 'F', 'J: 190,000 - 249,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (267, 'Prem', 'Walken', null, 3700, 'Prem.Walken@BRANT.COM', to_date('11-09-1953', 'dd-mm-yyyy'), 'married', 'F', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (268, 'Kyle', 'Schneider', null, 3700, 'Kyle.Schneider@DUNLIN.COM', to_date('21-09-1952', 'dd-mm-yyyy'), 'single', 'F', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (269, 'Kyle', 'Martin', null, 3700, 'Kyle.Martin@EIDER.COM', to_date('11-10-1958', 'dd-mm-yyyy'), 'married', 'F', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (271, 'Shelley', 'Peckinpah', null, 3700, 'Shelley.Peckinpah@GODWIT.COM', to_date('20-11-1987', 'dd-mm-yyyy'), 'single', 'F', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (272, 'Prem', 'Garcia', null, 3700, 'Prem.Garcia@JACANA.COM', to_date('10-12-1960', 'dd-mm-yyyy'), 'married', 'M', 'I: 170,000 - 189,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (273, 'Bo', 'Hitchcock', null, 5000, 'Bo.Hitchcock@ANHINGA.COM', to_date('09-01-1954', 'dd-mm-yyyy'), 'married', 'M', 'E: 90,000 - 109,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (274, 'Bob', 'McCarthy', null, 5000, 'Bob.McCarthy@ANI.COM', to_date('19-01-2046', 'dd-mm-yyyy'), 'single', 'M', 'A: Below 30,000');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (276, 'Dom', 'Hoskins', null, 5000, 'Dom.Hoskins@AVOCET.COM', to_date('10-03-1951', 'dd-mm-yyyy'), 'married', 'M', 'E: 90,000 - 109,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (277, 'Don', 'Siegel', null, 5000, 'Don.Siegel@BITTERN.COM', to_date('20-03-1950', 'dd-mm-yyyy'), 'single', 'M', 'B: 30,000 - 49,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (278, 'Gvtz', 'Bradford', null, 5000, 'Gvtz.Bradford@BULBUL.COM', to_date('08-04-1964', 'dd-mm-yyyy'), 'married', 'M', 'K: 250,000 - 299,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (280, 'Rob', 'MacLaine', null, 5000, 'Rob.MacLaine@COOT.COM', to_date('09-05-2049', 'dd-mm-yyyy'), 'married', 'M', 'B: 30,000 - 49,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (281, 'Don', 'Barkin', null, 5000, 'Don.Barkin@CORMORANT.COM', to_date('18-05-1956', 'dd-mm-yyyy'), 'single', 'M', 'I: 170,000 - 189,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (282, 'Kurt', 'Danson', null, 5000, 'Kurt.Danson@COWBIRD.COM', to_date('07-06-1988', 'dd-mm-yyyy'), 'married', 'M', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (308, 'Glenda', 'Dunaway', null, 1200, 'Glenda.Dunaway@DOWITCHER.COM', to_date('08-07-1957', 'dd-mm-yyyy'), 'married', 'M', 'C: 50,000 - 69,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (309, 'Glenda', 'Bates', null, 1200, 'Glenda.Bates@DIPPER.COM', to_date('18-07-1955', 'dd-mm-yyyy'), 'single', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (323, 'Goetz', 'Falk', null, 5000, 'Goetz.Falk@VEERY.COM', to_date('06-08-1980', 'dd-mm-yyyy'), 'married', 'F', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (326, 'Hal', 'Olin', null, 2400, 'Hal.Olin@FLICKER.COM', to_date('06-09-1959', 'dd-mm-yyyy'), 'married', 'F', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (327, 'Hannah', 'Kanth', null, 2400, 'Hannah.Kanth@GADWALL.COM', to_date('15-09-1956', 'dd-mm-yyyy'), 'single', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (328, 'Hannah', 'Field', null, 2400, 'Hannah.Field@GALLINULE.COM', to_date('06-10-1985', 'dd-mm-yyyy'), 'married', 'F', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (333, 'Margret', 'Powell', null, 1200, 'Margret.Powell@ANI.COM', to_date('16-10-1953', 'dd-mm-yyyy'), 'single', 'M', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (334, 'Harry Mean', 'Taylor', null, 1200, 'HarryMean.Taylor@REDPOLL.COM', to_date('15-11-1981', 'dd-mm-yyyy'), 'single', 'M', 'I: 170,000 - 189,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (335, 'Margrit', 'Garner', null, 500, 'Margrit.Garner@STILT.COM', to_date('05-12-1982', 'dd-mm-yyyy'), 'married', 'F', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (337, 'Maria', 'Warden', null, 500, 'Maria.Warden@TANAGER.COM', to_date('03-01-1973', 'dd-mm-yyyy'), 'married', 'F', 'B: 30,000 - 49,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (339, 'Marilou', 'Landis', null, 500, 'Marilou.Landis@TATTLER.COM', to_date('13-01-2033', 'dd-mm-yyyy'), 'single', 'M', 'A: Below 30,000');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (361, 'Marilou', 'Chapman', null, 500, 'Marilou.Chapman@TEAL.COM', to_date('11-08-1989', 'dd-mm-yyyy'), 'single', 'F', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (363, 'Kathy', 'Lambert', null, 2400, 'Kathy.Lambert@COOT.COM', to_date('31-08-1956', 'dd-mm-yyyy'), 'married', 'M', 'C: 50,000 - 69,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (360, 'Helmut', 'Capshaw', null, 3600, 'Helmut.Capshaw@TROGON.COM', to_date('01-08-1977', 'dd-mm-yyyy'), 'married', 'M', 'J: 190,000 - 249,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (341, 'Keir', 'George', null, 700, 'Keir.George@VIREO.COM', to_date('03-02-1963', 'dd-mm-yyyy'), 'married', 'F', 'E: 90,000 - 109,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (342, 'Marlon', 'Laughton', null, 2400, 'Marlon.Laughton@CORMORANT.COM', to_date('13-02-2047', 'dd-mm-yyyy'), 'single', 'F', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (343, 'Keir', 'Chandar', null, 700, 'Keir.Chandar@WATERTHRUSH.COM', to_date('04-03-1960', 'dd-mm-yyyy'), 'married', 'M', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (344, 'Marlon', 'Godard', null, 2400, 'Marlon.Godard@MOORHEN.COM', to_date('14-03-1960', 'dd-mm-yyyy'), 'single', 'M', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (345, 'Keir', 'Weaver', null, 700, 'Keir.Weaver@WHIMBREL.COM', to_date('04-04-1962', 'dd-mm-yyyy'), 'married', 'M', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (346, 'Marlon', 'Clapton', null, 2400, 'Marlon.Clapton@COWBIRD.COM', to_date('13-04-1988', 'dd-mm-yyyy'), 'married', 'M', 'K: 250,000 - 299,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (347, 'Kelly', 'Quinlan', null, 3600, 'Kelly.Quinlan@PYRRHULOXIA.COM', to_date('03-05-2029', 'dd-mm-yyyy'), 'married', 'F', 'A: Below 30,000');
commit;
-- prompt 300 records committed...
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (348, 'Kelly', 'Lange', null, 3600, 'Kelly.Lange@SANDPIPER.COM', to_date('14-05-1971', 'dd-mm-yyyy'), 'single', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (349, 'Ken', 'Glenn', null, 3600, 'Ken.Glenn@SAW-WHET.COM', to_date('03-06-1967', 'dd-mm-yyyy'), 'married', 'M', 'K: 250,000 - 299,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (350, 'Ken', 'Chopra', null, 3600, 'Ken.Chopra@SCAUP.COM', to_date('13-06-1951', 'dd-mm-yyyy'), 'single', 'F', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (351, 'Ken', 'Wenders', null, 3600, 'Ken.Wenders@REDPOLL.COM', to_date('03-07-1962', 'dd-mm-yyyy'), 'married', 'F', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (380, 'Meryl', 'Holden', null, 3700, 'Meryl.Holden@DIPPER.COM', to_date('10-10-1961', 'dd-mm-yyyy'), 'single', 'F', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (447, 'Richard', 'Coppola', null, 500, 'Richard.Coppola@SISKIN.COM', to_date('30-10-1981', 'dd-mm-yyyy'), 'married', 'F', 'C: 50,000 - 69,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (449, 'Rick', 'Romero', null, 1500, 'Rick.Romero@LONGSPUR.COM', to_date('10-12-1951', 'dd-mm-yyyy'), 'single', 'F', 'B: 30,000 - 49,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (450, 'Rick', 'Lyon', null, 1500, 'Rick.Lyon@MERGANSER.COM', to_date('01-01-2041', 'dd-mm-yyyy'), 'married', 'F', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (451, 'Ridley', 'Hackman', null, 700, 'Ridley.Hackman@ANHINGA.COM', to_date('11-01-1950', 'dd-mm-yyyy'), 'single', 'F', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (453, 'Ridley', 'Young', null, 700, 'Ridley.Young@CHUKAR.COM', to_date('10-02-2045', 'dd-mm-yyyy'), 'single', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (454, 'Rob', 'Russell', null, 5000, 'Rob.Russell@VERDIN.COM', to_date('02-03-1977', 'dd-mm-yyyy'), 'married', 'M', 'E: 90,000 - 109,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (458, 'Robert', 'de Niro', null, 3700, 'Robert.deNiro@DOWITCHER.COM', to_date('12-03-1986', 'dd-mm-yyyy'), 'single', 'F', 'H: 150,000 - 169,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (466, 'Rodolfo', 'Hershey', null, 5000, 'Rodolfo.Hershey@VIREO.COM', to_date('11-04-2047', 'dd-mm-yyyy'), 'single', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (467, 'Rodolfo', 'Dench', null, 5000, 'Rodolfo.Dench@SCOTER.COM', to_date('01-05-1971', 'dd-mm-yyyy'), 'married', 'F', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (470, 'Roger', 'Mastroianni', null, 3700, 'Roger.Mastroianni@CREEPER.COM', to_date('31-05-1967', 'dd-mm-yyyy'), 'married', 'M', 'L: 300,000 and above');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (473, 'Rolf', 'Ashby', null, 5000, 'Rolf.Ashby@WATERTHRUSH.COM', to_date('10-06-2049', 'dd-mm-yyyy'), 'single', 'M', 'G: 130,000 - 149,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (474, 'Romy', 'Sharif', null, 5000, 'Romy.Sharif@SNIPE.COM', to_date('29-06-1976', 'dd-mm-yyyy'), 'married', 'M', 'F: 110,000 - 129,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (476, 'Rosanne', 'Hopkins', null, 300, 'Rosanne.Hopkins@ANI.COM', to_date('30-07-1979', 'dd-mm-yyyy'), 'married', 'M', 'D: 70,000 - 89,999');
insert into CLIENTI (ID_CLIENT, PRENUME_CLIENT, NUME_CLIENT, TELEFON, LIMITA_CREDIT, EMAIL_CLIENT, DATA_NASTERE, STAREA_CIVILA, SEX, NIVEL_VENITURI)
values (477, 'Rosanne', 'Douglas', null, 300, 'Rosanne.Douglas@ANHINGA.COM', to_date('09-08-1970', 'dd-mm-yyyy'), 'single', 'F', 'F: 110,000 - 129,999');
commit;
-- prompt 319 records loaded
-- prompt Loading COMENZI...
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2458, to_timestamp('17-08-1999 01:34:12.234359', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 101, 0, 153);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2397, to_timestamp('20-11-1999 02:41:54.696211', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 102, 1, 154);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2454, to_timestamp('03-10-1999 03:49:34.678340', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 103, 1, 154);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2354, to_timestamp('15-07-2000 04:18:23.234567', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 104, 0, 155);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2358, to_timestamp('09-01-2000 05:03:12.654278', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 105, 2, 155);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2381, to_timestamp('15-05-2000 06:59:08.843679', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 106, 3, 156);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2440, to_timestamp('01-09-1999 07:53:06.008765', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 107, 3, 156);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2357, to_timestamp('09-01-1998 08:19:44.123456', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 108, 5, 158);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2394, to_timestamp('11-02-2000 09:22:35.564789', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 109, 5, 158);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2435, to_timestamp('03-09-1999 09:22:53.134567', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 144, 6, 159);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2455, to_timestamp('20-09-1999 21:34:11.456789', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 145, 7, 160);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2379, to_timestamp('16-05-1999 12:22:24.234567', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 146, 8, 161);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2396, to_timestamp('02-02-1998 13:34:56.345678', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 147, 8, 161);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2406, to_timestamp('29-06-1999 14:41:20.098765', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 148, 8, 161);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2434, to_timestamp('13-09-1999 15:49:30.647893', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 149, 8, 161);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2436, to_timestamp('02-09-1999 16:18:04.378034', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 116, 8, 161);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2446, to_timestamp('27-07-1999 17:03:08.302945', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 117, 8, 161);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2447, to_timestamp('27-07-2000 18:59:10.223344', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 101, 8, 161);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2432, to_timestamp('14-09-1999 19:53:40.223345', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 102, 10, 163);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2433, to_timestamp('13-09-1999 20:19:00.654279', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 103, 10, 163);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2355, to_timestamp('26-01-1998 21:22:51.962632', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 104, 8, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2356, to_timestamp('26-01-2000 21:22:41.934562', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 105, 5, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2359, to_timestamp('09-01-1998 09:34:13.112233', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 106, 9, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2360, to_timestamp('15-11-1999 00:22:31.223344', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 107, 4, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2361, to_timestamp('14-11-1999 01:34:21.986210', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 108, 8, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2362, to_timestamp('14-11-1999 02:41:10.619477', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 109, 4, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2363, to_timestamp('24-10-1999 03:49:56.346122', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 144, 0, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2364, to_timestamp('29-08-1999 04:18:45.942399', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 145, 4, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2365, to_timestamp('29-08-1999 05:03:34.003399', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 146, 9, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2366, to_timestamp('29-08-1999 06:59:23.144778', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 147, 5, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2367, to_timestamp('28-06-2000 07:53:32.335522', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 148, 10, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2368, to_timestamp('27-06-2000 08:19:43.190089', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 149, 10, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2369, to_timestamp('27-06-1999 09:22:54.009932', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 116, 0, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2370, to_timestamp('27-06-2000 10:22:11.647398', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 117, 4, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2371, to_timestamp('16-05-1999 11:34:56.113356', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 118, 6, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2372, to_timestamp('27-02-1999 12:22:33.356789', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 119, 9, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2373, to_timestamp('27-02-2000 13:34:51.220065', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 120, 4, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2374, to_timestamp('27-02-2000 14:41:45.109654', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 121, 0, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2375, to_timestamp('26-02-1999 15:49:50.459233', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 122, 2, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2376, to_timestamp('07-06-1999 16:18:08.883310', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 123, 6, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2377, to_timestamp('07-06-1999 17:03:01.001100', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 141, 5, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2378, to_timestamp('24-05-1999 18:59:10.010101', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 142, 5, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2380, to_timestamp('16-05-1999 19:53:02.909090', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 143, 3, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2382, to_timestamp('14-05-2000 20:19:03.828321', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 144, 8, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2383, to_timestamp('12-05-2000 21:22:30.545103', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 145, 8, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2384, to_timestamp('12-05-2000 22:22:34.525972', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 146, 3, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2385, to_timestamp('08-12-1999 23:34:11.331392', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 147, 4, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2386, to_timestamp('07-12-1999 00:22:34.225609', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 148, 10, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2387, to_timestamp('12-03-1999 01:34:56.536966', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 149, 5, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2388, to_timestamp('05-06-1999 02:41:12.554435', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 150, 4, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2389, to_timestamp('05-06-2000 03:49:43.546954', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 151, 4, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2390, to_timestamp('19-11-1999 04:18:50.546851', 'dd-mm-yyyy hh24:mi:ss.ff'), 'online', 152, 9, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2391, to_timestamp('28-02-1998 05:03:03.828330', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 153, 2, 156);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2392, to_timestamp('22-07-1999 06:59:57.571057', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 154, 9, 161);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2393, to_timestamp('11-02-2000 07:53:19.528202', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 155, 4, 161);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2395, to_timestamp('03-02-1998 08:19:11.227550', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 156, 3, 163);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2398, to_timestamp('20-11-1999 09:22:53.224175', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 157, 9, 163);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2399, to_timestamp('20-11-1999 10:22:38.340990', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 158, 0, 161);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2400, to_timestamp('10-07-1999 11:34:29.559387', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 159, 2, 161);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2401, to_timestamp('10-07-1999 12:22:53.554822', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 160, 3, 163);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2402, to_timestamp('02-07-1999 13:34:44.665170', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 161, 8, 154);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2403, to_timestamp('02-07-1999 02:49:13.615512', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 162, 0, 154);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2404, to_timestamp('02-07-1999 02:49:13.664085', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 163, 6, 158);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2405, to_timestamp('02-07-1999 02:49:13.678123', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 164, 5, 159);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2407, to_timestamp('29-06-1999 17:03:21.526005', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 165, 9, 155);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2408, to_timestamp('29-06-1999 18:59:31.333617', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 166, 1, 158);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2409, to_timestamp('29-06-1999 19:53:41.984501', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 167, 2, 154);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2410, to_timestamp('24-05-2000 20:19:51.985501', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 168, 6, 156);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2411, to_timestamp('24-05-1999 21:22:10.548639', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 169, 8, 156);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2412, to_timestamp('29-03-1998 22:22:09.509801', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 170, 9, 158);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2413, to_timestamp('29-03-2000 23:34:04.525934', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 101, 5, 161);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2414, to_timestamp('30-03-1999 00:22:40.536996', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 102, 8, 153);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2415, to_timestamp('30-03-1997 01:34:50.545196', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 103, 6, 161);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2416, to_timestamp('30-03-1999 02:41:20.945676', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 104, 6, 160);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2417, to_timestamp('21-03-1999 03:49:10.974352', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 105, 5, 163);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2418, to_timestamp('21-03-1996 04:18:21.862632', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 106, 4, 163);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2419, to_timestamp('21-03-1999 05:03:32.764632', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 107, 3, 160);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2420, to_timestamp('14-03-1999 06:59:43.666320', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 108, 2, 160);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2421, to_timestamp('13-03-1999 07:53:54.562432', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 109, 1, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2422, to_timestamp('17-12-1999 08:19:55.462332', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 144, 2, 153);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2423, to_timestamp('21-11-1999 22:22:33.362632', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 145, 3, 160);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2424, to_timestamp('21-11-1999 22:22:33.263332', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 146, 4, 153);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2425, to_timestamp('17-11-1998 11:34:22.162552', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 147, 5, 163);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2426, to_timestamp('17-11-1998 12:22:11.262552', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 148, 6, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2427, to_timestamp('10-11-1999 13:34:22.362124', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 149, 7, 163);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2428, to_timestamp('10-11-1999 14:41:34.463567', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 116, 8, null);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2429, to_timestamp('10-11-1999 15:49:25.526321', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 117, 9, 154);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2430, to_timestamp('02-10-1999 16:18:36.663332', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 101, 8, 159);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2431, to_timestamp('14-09-1998 17:03:04.763452', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 102, 1, 163);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2437, to_timestamp('01-09-1998 18:59:15.826132', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 103, 4, 163);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2438, to_timestamp('01-09-1999 19:53:26.934626', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 104, 0, 154);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2439, to_timestamp('31-08-1999 20:19:37.811132', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 105, 1, 159);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2441, to_timestamp('01-08-2000 21:22:48.734526', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 106, 5, 160);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2442, to_timestamp('27-07-1990 22:22:59.662632', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 107, 9, 154);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2443, to_timestamp('27-07-1990 23:34:16.562632', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 108, 0, 154);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2444, to_timestamp('28-07-1999 00:22:27.462632', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 109, 1, 155);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2445, to_timestamp('28-07-1990 01:34:38.362632', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 144, 8, 158);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2448, to_timestamp('19-06-1999 02:41:49.262632', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 145, 5, 158);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2449, to_timestamp('14-06-1999 03:49:07.162632', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 146, 6, 155);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2450, to_timestamp('12-04-1999 04:18:10.362632', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 147, 3, 159);
commit;
-- prompt 100 records committed...
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2451, to_timestamp('18-12-1999 05:03:52.562632', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 148, 7, 154);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2452, to_timestamp('07-10-1999 06:59:43.462632', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 149, 5, 159);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2453, to_timestamp('05-10-1999 07:53:34.362632', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 116, 0, 153);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2456, to_timestamp('08-11-1998 07:53:25.989889', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 117, 0, 163);
insert into COMENZI (NR_COMANDA, DATA, MODALITATE, ID_CLIENT, STARE_COMANDA, ID_ANGAJAT)
values (2457, to_timestamp('01-11-1999 09:22:16.162632', 'dd-mm-yyyy hh24:mi:ss.ff'), 'direct', 118, 5, 159);
commit;
-- prompt 105 records loaded
-- prompt Loading ISTORIC_FUNCTII...
insert into ISTORIC_FUNCTII (ID_ANGAJAT, DATA_INCEPUT, DATA_SFARSIT, ID_FUNCTIE, ID_DEPARTAMENT)
values (102, to_date('13-01-1993', 'dd-mm-yyyy'), to_date('24-07-1998', 'dd-mm-yyyy'), 'IT_PROG', 60);
insert into ISTORIC_FUNCTII (ID_ANGAJAT, DATA_INCEPUT, DATA_SFARSIT, ID_FUNCTIE, ID_DEPARTAMENT)
values (101, to_date('21-09-1989', 'dd-mm-yyyy'), to_date('27-10-1993', 'dd-mm-yyyy'), 'AC_ACCOUNT', 110);
insert into ISTORIC_FUNCTII (ID_ANGAJAT, DATA_INCEPUT, DATA_SFARSIT, ID_FUNCTIE, ID_DEPARTAMENT)
values (101, to_date('28-10-1993', 'dd-mm-yyyy'), to_date('15-03-1997', 'dd-mm-yyyy'), 'AC_MGR', 110);
insert into ISTORIC_FUNCTII (ID_ANGAJAT, DATA_INCEPUT, DATA_SFARSIT, ID_FUNCTIE, ID_DEPARTAMENT)
values (201, to_date('17-02-1996', 'dd-mm-yyyy'), to_date('19-12-1999', 'dd-mm-yyyy'), 'MK_REP', 20);
insert into ISTORIC_FUNCTII (ID_ANGAJAT, DATA_INCEPUT, DATA_SFARSIT, ID_FUNCTIE, ID_DEPARTAMENT)
values (114, to_date('24-03-1998', 'dd-mm-yyyy'), to_date('31-12-1999', 'dd-mm-yyyy'), 'ST_CLERK', 50);
insert into ISTORIC_FUNCTII (ID_ANGAJAT, DATA_INCEPUT, DATA_SFARSIT, ID_FUNCTIE, ID_DEPARTAMENT)
values (122, to_date('01-01-1999', 'dd-mm-yyyy'), to_date('31-12-1999', 'dd-mm-yyyy'), 'ST_CLERK', 50);
insert into ISTORIC_FUNCTII (ID_ANGAJAT, DATA_INCEPUT, DATA_SFARSIT, ID_FUNCTIE, ID_DEPARTAMENT)
values (200, to_date('17-09-1987', 'dd-mm-yyyy'), to_date('17-06-1993', 'dd-mm-yyyy'), 'AD_ASST', 90);
insert into ISTORIC_FUNCTII (ID_ANGAJAT, DATA_INCEPUT, DATA_SFARSIT, ID_FUNCTIE, ID_DEPARTAMENT)
values (176, to_date('24-03-1998', 'dd-mm-yyyy'), to_date('31-12-1998', 'dd-mm-yyyy'), 'SA_REP', 80);
insert into ISTORIC_FUNCTII (ID_ANGAJAT, DATA_INCEPUT, DATA_SFARSIT, ID_FUNCTIE, ID_DEPARTAMENT)
values (176, to_date('01-01-1999', 'dd-mm-yyyy'), to_date('31-12-1999', 'dd-mm-yyyy'), 'SA_MAN', 80);
insert into ISTORIC_FUNCTII (ID_ANGAJAT, DATA_INCEPUT, DATA_SFARSIT, ID_FUNCTIE, ID_DEPARTAMENT)
values (200, to_date('01-07-1994', 'dd-mm-yyyy'), to_date('31-12-1998', 'dd-mm-yyyy'), 'AC_ACCOUNT', 90);
commit;
-- prompt 10 records loaded
-- prompt Loading PRODUSE...
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1797, 'Inkjet C/8/HQ', 'Inkjet printer, color, 8 pages per minute, high resolution (photo quality). Memory: 16MB. Dimensions (HxWxD): 7.3 x 17.5 x 14 inch. Paper size: A4, US Letter, envelopes. Interface: Centronics parallel, IEEE 1284 compliant.', 'hardware2', 349, 288);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2459, 'LaserPro 1200/8/BW', 'Professional black and white laserprinter, resolution 1200 dpi, 8 pages per second. Dimensions (HxWxD): 22.37 x 19.86 x 21.92 inch. Software: Enhanced driver support for SPNIX v4.0; MS-DOS Built-in printer drivers: ZoomSmart scaling technology, billboard, handout, mirror, watermark, print preview, quick sets, emulate laserprinter margins.', 'hardware2', 699, 568);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3127, 'LaserPro 600/6/BW', 'Standard black and white laserprinter, resolution 600 dpi, 6 pages per second. Interface: Centronics parallel, IEEE 1284 compliant. Memory: 8MB 96KB receiver buffer. MS-DOS ToolBox utilities for SPNIX AutoCAM v.17 compatible driver.', 'hardware2', 498, 444);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2254, 'HD 10GB /I', '10GB capacity hard disk drive (internal). These drives are intended for use in today''s demanding, data-critical enterprise environments and are ideal for use in RAID applications. Universal option kits are configured and pre-mounted in the appropriate hot plug tray for immediate installation into your corporate server or storage system.', 'hardware3', 453, 371);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3353, 'HD 10GB /R', '10GB Removable hard disk drive for 10GB Removable HD drive. Supra7 disk drives provide the latest technology to improve enterprise performance, increasing the maximum data transfer rate up to 160MB/s.', 'hardware3', 489, 413);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3069, 'HD 10GB /S', '10GB hard disk drive for Standard Mount. Backward compatible with Supra5 systems, users are free to deploy and re-deploy these drives to quickly deliver increased storage capacity. Supra drives eliminate the risk of firmware incompatibility.', 'hardware3', 436, 350);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2253, 'HD 10GB @5400 /SE', '10GB capacity hard disk drive (external) SCSI interface, 5400 RPM. Universal option kits are configured and pre-mounted in the appropriate hot plug tray for immediate installation into your corporate server or storage system. Supra drives eliminate the risk of firmware incompatibility.', 'hardware3', 399, 322);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3354, 'HD 12GB /I', '12GB capacity harddisk drive (internal). Supra drives eliminate the risk of firmware incompatibility. Backward compatibility: You can mix or match Supra2 and Supra3 devices for optimized solutions and future growth.', 'hardware3', 543, 478);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3072, 'HD 12GB /N', '12GB hard disk drive for Narrow Mount. Supra9 hot pluggable hard disk drives provide the ability to install or remove drives on-line. Our hot pluggable hard disk drives are required to meet our rigorous standards for reliability and performance.', 'hardware3', 567, 507);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3334, 'HD 12GB /R', '12GB Removable hard disk drive. With compatibility across many enterprise platforms, you are free to deploy and re-deploy this drive to quickly deliver increased storage capacity. Supra7 Universal disk drives are the second generation of high performance hot plug drives sharing compatibility across corporate servers and external storage enclosures.', 'hardware3', 612, 512);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3071, 'HD 12GB /S', '12GB hard disk drive for Standard Mount. Supra9 hot pluggable hard disk drives provide the ability to install or remove drives on-line. Our hot pluggable hard disk drives are required to meet our rigorous standards for reliability and performance.', 'hardware3', 633, 553);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2255, 'HD 12GB @7200 /SE', '12GB capacity hard disk drive (external) SCSI, 7200 RPM. These drives are intended for use in today''s demanding, data-critical enterprise environments and can be used in RAID applications. Universal option kits are configured and pre-mounted in the appropriate hot plug tray for immediate installation into your corporate server or storage system.', 'hardware3', 775, 628);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1743, 'HD 18.2GB @10000 /E', 'External hard drive disk - 18.2 GB, rated up to 10,000 RPM. These drives are intended for use in today''s demanding, data-critical enterprise environments and are ideal for use in RAID applications.', 'hardware3', 800, 661);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2382, 'HD 18.2GB@10000 /I', '18.2 GB SCSI hard disk @ 10000 RPM (internal). Supra7 Universal disk drives provide an unequaled level of investment protection and simplification for customers by enabling drive compatibility across many enterprise platforms.', 'hardware3', 850, 731);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3399, 'HD 18GB /SE', '18GB SCSI external hard disk drive. Supra5 Universal hard disk drives provide the ability to hot plug between various servers, RAID arrays, and external storage shelves.', 'hardware3', 815, 706);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3073, 'HD 6GB /I', '6GB capacity hard disk drive (internal). Supra drives eliminate the risk of firmware incompatibility.', 'hardware3', 224, 197);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1768, 'HD 8.2GB @5400', 'Hard drive disk - 8.2 GB, rated up to 5,400 RPM. Supra drives eliminate the risk of firmware incompatibility. Standard serial RS-232 interface.', 'hardware3', 345, 306);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2410, 'HD 8.4GB @5400', '8.4 GB hard disk @ 5400 RPM. Reduced cost of ownership: Drives can be utilized across enterprise platforms. This hot pluggable hard disk drive is required to meet your rigorous standards for reliability and performance.', 'hardware3', 357, 319);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2257, 'HD 8GB /I', '8GB capacity hard disk drive (internal). Supra9 hot pluggable hard disk drives provide the ability to install or remove drives on-line. Backward compatibility: You can mix Supra2 and Supra3 devices for optimized solutions and future growth.', 'hardware3', 399, 338);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3400, 'HD 8GB /SE', '8GB capacity SCSI hard disk drive (external). Supra7 disk drives provide the latest technology to improve enterprise performance, increasing the maximum data transfer rate up to 255MB/s.', 'hardware3', 389, 337);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3355, 'HD 8GB /SI', '8GB SCSI hard disk drive, internal. With compatibility across many enterprise platforms, you are free to deploy and re-deploy this drive to quickly deliver increased storage capacity. ', 'hardware3', null, null);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1772, 'HD 9.1GB @10000', 'Hard disk drive - 9.1 GB, rated up to 10,000 RPM. These drives are intended for use in data-critical enterprise environments. Ease of doing business: you can easily select the drives you need regardless of the application in which they will be deployed.', 'hardware3', 456, 393);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2414, 'HD 9.1GB @10000 /I', '9.1 GB SCSI hard disk @ 10000 RPM (internal). Supra7 disk drives are available in 10,000 RPM spindle speeds and capacities of 18GB and 9.1 GB. SCSI and RS-232 interfaces.', 'hardware3', 454, 399);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2415, 'HD 9.1GB @7200', '9.1 GB hard disk @ 7200 RPM. Universal option kits are configured and pre-mounted in the appropriate hot plug tray for immediate installation into your corporate server or storage system.', 'hardware3', 359, 309);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2395, '32MB Cache /M', '32MB Mirrored cache memory (100-MHz Registered SDRAM)', 'hardware4', 123, 109);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1755, '32MB Cache /NM', '32MB Non-Mirrored cache memory', 'hardware4', 121, 99);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2406, '64MB Cache /M', '64MB Mirrored cache memory', 'hardware4', 223, 178);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2404, '64MB Cache /NM', '64 MB Non-mirrored cache memory. FPM memory chips are implemented on 5 volt SIMMs, but are also available on 3.3 volt DIMMs.', 'hardware4', 221, 180);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1770, '8MB Cache /NM', '8MB Non-Mirrored Cache Memory (100-MHz Registered SDRAM)', 'hardware4', null, 73);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2496, 'WSP DA-130', 'Wide storage processor DA-130 for storage subunits.', 'hardware5', 299, 244);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2497, 'WSP DA-290', 'Wide storage processor (model DA-290).', 'hardware5', 399, 355);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3106, 'KB 101/EN', 'Standard PC/AT Enhanced Keyboard (101/102-Key). Input locale: English (US).', 'hardware6', 48, 41);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2289, 'KB 101/ES', 'Standard PC/AT Enhanced Keyboard (101/102-Key). Input locale: Spanish.', 'hardware6', 48, 38);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3110, 'KB 101/FR', 'Standard PC/AT Enhanced Keyboard (101/102-Key). Input locale: French.', 'hardware6', 48, 39);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3108, 'KB E/EN', 'Ergonomic Keyboard with two separate key areas, detachable numeric pad. Key layout: English (US).', 'hardware6', 78, 63);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2058, 'Mouse +WP', 'Combination of a mouse and a wrist pad for more comfortable typing and mouse operation.', 'hardware6', 23, 19);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2761, 'Mouse +WP/CL', 'Set consisting of a mouse and wrist pad, with corporate logo', 'hardware6', 27, 23);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3117, 'Mouse C/E', 'Ergonomic, cordless mouse. With track-ball for maximum comfort and ease of use.', 'hardware6', 41, 35);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2056, 'Mouse Pad /CL', 'Standard mouse pad, with corporate logo', 'hardware6', 8, 6);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2211, 'Wrist Pad', 'A foam strip to support your wrists when using a keyboard', 'hardware6', 4, 3);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2944, 'Wrist Pad /CL', 'Wrist Pad with corporate logo', 'hardware6', 3, 2);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1742, 'CD-ROM 500/16x', 'CD drive, read only, speed 16x, maximum capacity 500 MB.', 'hardware7', 101, 81);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2402, 'CD-ROM 600/E/24x', '600 MB external 24x speed CD-ROM drive (read only).', 'hardware7', 127, 113);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2403, 'CD-ROM 600/I/24x', '600 MB internal read only CD-ROM drive, reading speed 24x', 'hardware7', 117, 103);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1761, 'CD-ROM 600/I/32x', '600 MB Internal CD-ROM Drive, speed 32x (read only).', 'hardware7', 134, 119);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2381, 'CD-ROM 8x', 'CD Writer, read only, speed 8x', 'hardware7', 99, 82);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2424, 'CDW 12/24', 'CD Writer, speed 12x write, 24x read. Warning: will become obsolete very soon; this speed is not high enough anymore, and better alternatives are available for a reasonable price.', 'hardware7', 221, 198);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1781, 'CDW 20/48/E', 'CD Writer, read 48x, write 20x', 'hardware7', 233, 206);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2264, 'CDW 20/48/I', 'CD-ROM drive: read 20x, write 48x (internal)', 'hardware7', 223, 181);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2260, 'DFD 1.44/3.5', 'Dual Floppy Drive - 1.44 MB - 3.5', 'hardware7', 67, 54);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2266, 'DVD 12x', 'DVD-ROM drive: speed 12x', 'hardware7', 333, 270);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3077, 'DVD 8x', 'DVD - ROM drive, 8x speed. Will probably become obsolete pretty soon...', 'hardware7', 274, 237);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2259, 'FD 1.44/3.5', 'Floppy Drive - 1.44 MB High Density capacity - 3.5 inch chassis', 'hardware7', 39, 32);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2261, 'FD 1.44/3.5/E', 'Floppy disk drive - 1.44 MB (high density) capacity - 3.5 inch (external)', 'hardware7', 42, 37);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3082, 'Modem - 56/90/E', 'Modem - 56kb per second, v.90 PCI Global compliant. External; for power supply 110V.', 'hardware7', 81, 72);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2270, 'Modem - 56/90/I', 'Modem - 56kb per second, v.90 PCI Global compliant. Internal, for standard chassis (3.5 inch).', 'hardware7', 66, 56);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2268, 'Modem - 56/H/E', 'Standard Hayes compatible modem - 56kb per second, external. Power supply: 220V.', 'hardware7', 77, 67);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3083, 'Modem - 56/H/I', 'Standard Hayes modem - 56kb per second, internal, for  standard 3.5 inch chassis.', 'hardware7', 67, 56);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2374, 'Modem - C/100', 'DOCSIS/EURODOCSIS 1.0/1.1-compliant external cable modem', 'hardware7', 65, 54);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1740, 'TD 12GB/DAT', 'Tape drive - 12 gigabyte capacity, DAT format.', 'hardware7', 134, 111);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2409, 'TD 7GB/8', 'Tape drive, 7GB capacity, 8mm cartridge tape.', 'hardware7', 210, 177);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2262, 'ZIP 100', 'ZIP Drive, 100 MB capacity (external) plus cable for parallel port connection', 'hardware7', 98, 81);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2522, 'Battery - EL', 'Extended life battery, for laptop computers', 'hardware8', 44, 39);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2278, 'Battery - NiHM', 'Rechargeable NiHM battery for laptop computers', 'hardware8', 55, 48);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2418, 'Battery Backup (DA-130)', 'Single-battery charger with LED indicators', 'hardware8', 61, 52);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2419, 'Battery Backup (DA-290)', 'Two-battery charger with LED indicators', 'hardware8', 72, 60);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3097, 'Cable Connector - 32R', 'Cable Connector - 32 pin ribbon', 'hardware8', 3, 2);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3099, 'Cable Harness', 'Cable harness to organize and bundle computer wiring', 'hardware8', 4, 3);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2380, 'Cable PR/15/P', '15 foot parallel printer cable', 'hardware8', 6, 5);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2408, 'Cable PR/P/6', 'Standard Centronics 6ft printer cable, parallel port', 'hardware8', 4, 3);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2457, 'Cable PR/S/6', 'Standard RS232 serial printer cable, 6 feet', 'hardware8', 5, 4);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2373, 'Cable RS232 10/AF', '10 ft RS232 cable with F/F and 9F/25F adapters', 'hardware8', 6, 4);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1734, 'Cable RS232 10/AM', '10 ft RS232 cable with M/M and 9M/25M adapters', 'hardware8', 6, 5);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1737, 'Cable SCSI 10/FW/ADS', '10ft SCSI2 F/W Adapt to DSxx0 Cable', 'hardware8', 8, 6);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1745, 'Cable SCSI 20/WD->D', '20ft SCSI2 Wide Disk Store to Disk Store Cable', 'hardware8', 9, 7);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2982, 'Drive Mount - A', 'Drive Mount assembly kit', 'hardware8', 44, 35);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3277, 'Drive Mount - A/T', 'Drive Mount assembly kit for tower PC', 'hardware8', 36, 29);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2976, 'Drive Mount - D', 'Drive Mount for desktop PC', 'hardware8', 52, 44);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3204, 'Envoy DS', 'Envoy Docking Station', 'hardware8', 126, 107);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2638, 'Envoy DS/E', 'Enhanced Envoy Docking Station', 'hardware8', 137, 111);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3020, 'Envoy IC', 'Envoy Internet Computer, Plug&Play', 'hardware8', 449, 366);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1948, 'Envoy IC/58', 'Internet computer with built-in 58K modem', 'hardware8', 498, 428);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3003, 'Laptop 128/12/56/v90/110', 'Envoy Laptop, 128MB memory, 12GB hard disk, v90 modem, 110V power supply.', 'hardware8', 3219, 2606);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2999, 'Laptop 16/8/110', 'Envoy Laptop, 16MB memory, 8GB hard disk, 110V power supply (US only).', 'hardware8', 999, 800);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3000, 'Laptop 32/10/56', 'Envoy Laptop, 32MB memory, 10GB hard disk, 56K Modem, universal power supply (switchable).', 'hardware8', 1749, 1542);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3001, 'Laptop 48/10/56/110', 'Envoy Laptop, 48MB memory, 10GB hard disk, 56K modem, 110V power supply.', 'hardware8', 2556, 2073);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3004, 'Laptop 64/10/56/220', 'Envoy Laptop, 64MB memory, 10GB hard disk, 56K modem, 220V power supply.', 'hardware8', 2768, 2275);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3391, 'PS 110/220', 'Power Supply - switchable, 110V/220V', 'hardware8', 85, 75);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3124, 'PS 110V /T', 'Power supply for tower PC, 110V', 'hardware8', 84, 70);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1738, 'PS 110V /US', '110 V Power Supply - US compatible', 'hardware8', 86, 70);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2377, 'PS 110V HS/US', '110 V hot swappable power supply - US compatible', 'hardware8', 97, 82);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2299, 'PS 12V /P', 'Power Supply - 12v portable', 'hardware8', 76, 64);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3123, 'PS 220V /D', 'Standard power supply, 220V, for desktop computers.', 'hardware8', 81, 65);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1748, 'PS 220V /EUR', '220 Volt Power supply type - Europe', 'hardware8', 83, 70);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1726, 'LCD Monitor 11/PM', 'Liquid Cristal Display 11 inch passive monitor. The virtually-flat, high-resolution screen delivers outstanding image quality with reduced glare.', 'hardware1', 259, 208);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2359, 'LCD Monitor 9/PM', 'Liquid Cristal Display 9 inch passive monitor. Enjoy the productivity that a small monitor can bring via more workspace on your desk. Easy setup with plug-and-play compatibility.', 'hardware1', 249, 206);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3060, 'Monitor 17/HR', 'CRT Monitor 17 inch (16 viewable) high resolution. Exceptional image performance and the benefit of additional screen space. This monitor offers sharp, color-rich monitor performance at an incredible value. With a host of leading features, including on-screen display controls.', 'hardware1', 299, 250);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2243, 'Monitor 17/HR/F', 'Monitor 17 inch (16 viewable) high resolution, flat screen. High density photon gun with Enhanced Elliptical Correction System for more consistent, accurate focus across the screen, even in the corners.', 'hardware1', 350, 302);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3057, 'Monitor 17/SD', 'CRT Monitor 17 inch (16 viewable) short depth. Delivers outstanding image clarity and precision. Gives professional color, technical engineering, and visualization/animation users the color fidelity they demand, plus a large desktop for enhanced productivity.', 'hardware1', 369, 320);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3061, 'Monitor 19/SD', 'CRT Monitor 19 inch (18 viewable) short depth. High-contrast black screen coating: produces superior contrast and grayscale performance. The newly designed, amplified professional speakers with dynamic bass response bring all of your multimedia audio experiences to life with crisp, true-to-life sound and rich, deep bass tones. Plus, color-coded cables, simple plug-and-play setup and digital on-screen controls mean you are ready to set your sights on outrageous multimedia and the incredible Internet in just minutes.', 'hardware1', 499, 437);
commit;
-- prompt 100 records committed...
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2245, 'Monitor 19/SD/M', 'Monitor 19 (18 Viewable) short depth, Monochrome. Outstanding image performance in a compact design. A simple, on-screen dislay menu helps you easily adjust screen dimensions, colors and image attributes. Just plug your monitor into your PC and you are ready to go.', 'hardware1', 512, 420);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3065, 'Monitor 21/D', 'CRT Monitor 21 inch (20 viewable). Digital OptiScan technology: supports resolutions up to 1600 x 1200 at 75Hz. Dimensions (HxWxD): 8.3 x 18.5 x 15 inch. The detachable or attachable monitor-powered Platinum Series speakers offer crisp sound and the convenience of a digital audio player jack. Just plug in your digital audio player and listen to tunes without powering up your PC.', 'hardware1', 999, 875);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3331, 'Monitor 21/HR', '21 inch monitor (20 inch viewable) high resolution. This monitor is ideal for business, desktop publishing, and graphics-intensive applications. Enjoy the productivity that a large monitor can bring via more workspace for running applications.', 'hardware1', 879, 785);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2252, 'Monitor 21/HR/M', 'Monitor 21 inch (20 viewable) high resolution, monochrome. Unit size: 35.6 x 29.6 x 33.3 cm (14.6 kg) Package: 40.53 x 31.24 x 35.39 cm (16.5 kg). Horizontal frequency 31.5 - 54 kHz, Vertical frequency 50 - 120 Hz. Universal power supply 90 - 132 V, 50 - 60 Hz.', 'hardware1', 889, 717);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3064, 'Monitor 21/SD', 'Monitor 21 inch (20 viewable) short depth. Features include a 0.25-0.28 Aperture Grille Pitch, resolution support up to 1920 x 1200 at 76Hz, on-screen displays, and a conductive anti-reflective film coating.', 'hardware1', 1023, 909);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3155, 'Monitor Hinge - HD', 'Monitor Hinge, heavy duty, maximum monitor weight 30 kg', 'hardware1', 49, 42);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3234, 'Monitor Hinge - STD', 'Standard Monitor Hinge, maximum monitor weight 10 kg', 'hardware1', 39, 34);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3350, 'Plasma Monitor 10/LE/VGA', '10 inch low energy plasma monitor, VGA resolution', 'hardware1', 740, 630);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2236, 'Plasma Monitor 10/TFT/XGA', '10 inch TFT XGA flatscreen monitor for laptop computers', 'hardware1', 964, 863);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3054, 'Plasma Monitor 10/XGA', '10 inch standard plasma monitor, XGA resolution. This virtually-flat, high-resolution screen delivers outstanding image quality with reduced glare.', 'hardware1', 600, 519);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1782, 'Compact 400/DQ', '400 characters per second high-speed draft printer. Dimensions (HxWxD): 17.34 x 24.26 x 26.32 inch. Interface: RS-232 serial (9-pin), no expansion slots. Paper size: A4, US Letter.', 'hardware2', 125, 108);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2430, 'Compact 400/LQ', '400 characters per second high-speed letter-quality printer. Dimensions (HxWxD): 12.37 x 27.96 x 23.92 inch. Interface: RS-232 serial (25-pin), 3 expansion slots. Paper size: A2, A3, A4.', 'hardware2', 175, 143);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1792, 'Industrial 600/DQ', 'Wide carriage color capability 600 characters per second high-speed draft printer. Dimensions (HxWxD): 22.31 x 25.73 x 20.12 inch. Paper size: 3x5 inch to 11x17 inch full bleed wide format.', 'hardware2', 225, 180);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1791, 'Industrial 700/HD', '700 characters per second dot-matrix printer with harder body and dust protection for industrial uses. Interface: Centronics parallel, IEEE 1284 compliant. Paper size: 3x5 inch to 11x17 inch full bleed wide format. Memory: 4MB. Dimensions (HxWxD): 9.3 x 16.5 x 13 inch.', 'hardware2', 275, 239);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2302, 'Inkjet B/6', 'Inkjet Printer, black and white, 6 pages per minute, resolution 600x300 dpi. Interface: Centronics parallel, IEEE 1284 compliant. Dimensions (HxWxD): 7.3 x 17.5 x 14 inch. Paper size: A3, A4, US legal. No expansion slots.', 'hardware2', 150, 121);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2453, 'Inkjet C/4', 'Inkjet Printer, color (with two separate ink cartridges), 6 pages per minute black and white, 4 pages per minute color, resolution 600x300 dpi. Interface: Biodirectional IEEE 1284 compliant parallel interface and RS-232 serial (9-pin) interface 2 open EIO expansion slots. Memory: 8MB 96KB receiver buffer.', 'hardware2', 195, 174);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2387, 'PS 220V /FR', '220V Power supply type - France', 'hardware8', 83, 66);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2370, 'PS 220V /HS/FR', '220V hot swappable power supply, for France.', 'hardware8', 91, 75);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2311, 'PS 220V /L', 'Power supply for laptop computers, 220V', 'hardware8', 95, 79);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1733, 'PS 220V /UK', '220V Power supply type - United Kingdom', 'hardware8', 89, 76);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2878, 'Router - ASR/2W', 'Special ALS Router - Approved Supplier required item with 2-way match', 'hardware8', 345, 305);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2879, 'Router - ASR/3W', 'Special ALS Router - Approved Supplier required item with 3-way match', 'hardware8', 456, 384);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2152, 'Router - DTMF4', 'DTMF 4 port router', 'hardware8', 231, 191);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3301, 'Screws <B.28.P>', 'Screws: Brass, size 28mm, Phillips head. Plastic box, contents 500.', 'hardware8', 15, 12);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3143, 'Screws <B.28.S>', 'Screws: Brass, size 28mm, straight. Plastic box, contents 500.', 'hardware8', 16, 13);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2323, 'Screws <B.32.P>', 'Screws: Brass, size 32mm, Phillips head. Plastic box, contents 400.', 'hardware8', 18, 14);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3134, 'Screws <B.32.S>', 'Screws: Brass, size 32mm, straight. Plastic box, contents 400.', 'hardware8', 18, 15);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3139, 'Screws <S.16.S>', 'Screws: Steel, size 16 mm, straight. Carton box, contents 750.', 'hardware8', 21, 17);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3300, 'Screws <S.32.P>', 'Screws: Steel, size 32mm, Phillips head. Plastic box, contents 400.', 'hardware8', 23, 19);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2316, 'Screws <S.32.S>', 'Screws: Steel, size 32mm, straight. Plastic box, contents 500.', 'hardware8', 22, 19);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3140, 'Screws <Z.16.S>', 'Screws: Zinc, length 16mm, straight. Carton box, contents 750.', 'hardware8', 24, 19);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2319, 'Screws <Z.24.S>', 'Screws: Zinc, size 24mm, straight. Carton box, contents 500.', 'hardware8', 25, 21);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2322, 'Screws <Z.28.P>', 'Screws: Zinc, size 28 mm, Phillips head. Carton box, contents 850.', 'hardware8', 23, 18);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3178, 'Spreadsheet - SSP/V 2.0', 'SmartSpread Spreadsheet, Professional Edition Version 2.0, for Vision Release 11.1 and 11.2. Shrink wrap includes CD-ROM containing advanced software and online documentation, plus printed manual, tutorial, and license registration.', 'software1', 45, 37);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3179, 'Spreadsheet - SSS/S 2.1', 'SmartSpread Spreadsheet, Standard Edition Version 2.1, for SPNIX Release 4.0. Shrink wrap includes CD-ROM containing software and online documentation, plus printed manual and license registration.', 'software1', 50, 44);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3182, 'Word Processing - SWP/V 4.5', 'SmartWord Word Processor, Professional Edition Version 4.5, for Vision Release 11.x. Shrink wrap includes CD-ROM, containing advanced software, printed manual, and license registration.', 'software2', 65, 54);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3183, 'Word Processing - SWS/V 4.5', 'SmartWord Word Processor, Standard Edition Version 4.5, for Vision Release 11.x. Shrink wrap includes CD-ROM and license registration.', 'software2', 50, 40);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3197, 'Spreadsheet - SSS/V 2.1', 'SmartSpread Spreadsheet, Standard Edition Version 2.1, for Vision Release 11.1 and 11.2. Shrink wrap includes CD-ROM containing software and online documentation, plus printed manual, tutorial, and license registration.', 'software1', 45, 36);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3255, 'Spreadsheet - SSS/CD 2.2B', 'SmartSpread Spreadsheet, Standard Edition, Beta Version 2.2, for SPNIX Release 4.1. CD-ROM only.', 'software1', 35, 30);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3256, 'Spreadsheet - SSS/V 2.0', 'SmartSpread Spreadsheet, Standard Edition Version 2.0, for Vision Release 11.0. Shrink wrap includes CD-ROM containing software and online documentation, plus printed manual, tutorial, and license registration.', 'software1', 40, 34);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3260, 'Word Processing - SWP/S 4.4', 'SmartSpread Spreadsheet, Standard Edition Version 2.2, for SPNIX Release 4.x. Shrink wrap includes CD-ROM, containing software, plus printed manual and license registration.', 'software2', 50, 41);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3262, 'Spreadsheet - SSS/S 2.2', 'SmartSpread Spreadsheet, Standard Edition Version 2.2, for SPNIX Release 4.1. Shrink wrap includes CD-ROM containing software and online documentation, plus printed manual and license registration.', 'software1', 50, 41);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3361, 'Spreadsheet - SSP/S 1.5', 'SmartSpread Spreadsheet, Standard Edition Version 1.5, for SPNIX Release 3.3. Shrink wrap includes CD-ROM containing advanced software and online documentation, plus printed manual, tutorial, and license registration.', 'software1', 40, 34);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1799, 'SPNIX3.3 - SL', 'Operating System Software: SPNIX V3.3 - Base Server License. Includes 10 general licenses for system administration, developers, or users. No network user licensing. ', 'software4', 1000, 874);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1801, 'SPNIX3.3 - AL', 'Operating System Software: SPNIX V3.3 - Additional system administrator license, including network access.', 'software4', 100, 88);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1803, 'SPNIX3.3 - DL', 'Operating System Software: SPNIX V3.3 - Additional developer license.', 'software4', 60, 51);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1804, 'SPNIX3.3 - UL/N', 'Operating System Software: SPNIX V3.3 - Additional user license with network access.', 'software4', 65, 56);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1805, 'SPNIX3.3 - UL/A', 'Operating System Software: SPNIX V3.3 - Additional user license class A.', 'software4', 50, 42);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1806, 'SPNIX3.3 - UL/C', 'Operating System Software: SPNIX V3.3 - Additional user license class C.', 'software4', 50, 42);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1808, 'SPNIX3.3 - UL/D', 'Operating System Software: SPNIX V3.3 - Additional user license class D.', 'software4', 55, 46);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1820, 'SPNIX3.3 - NL', 'Operating System Software: SPNIX V3.3 - Additional network access license.', 'software4', 55, 45);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1822, 'SPNIX4.0 - SL', 'Operating System Software: SPNIX V4.0 - Base Server License. Includes 10 general licenses for system administration, developers, or users. No network user licensing. ', 'software4', 1500, 1303);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2422, 'SPNIX4.0 - SAL', 'Operating System Software: SPNIX V4.0 - Additional system administrator license, including network access.', 'software4', 150, 130);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2452, 'SPNIX4.0 - DL', 'Operating System Software: SPNIX V4.0 - Additional developer license.', 'software4', 100, 88);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2462, 'SPNIX4.0 - UL/N', 'Operating System Software: SPNIX V4.0 - Additional user license with network access.', 'software4', 80, 71);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2464, 'SPNIX4.0 - UL/A', 'Operating System Software: SPNIX V4.0 - Additional user license class A.', 'software4', 70, 62);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2467, 'SPNIX4.0 - UL/D', 'Operating System Software: SPNIX V4.0 - Additional user license class D.', 'software4', 80, 64);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2468, 'SPNIX4.0 - UL/C', 'Operating System Software: SPNIX V4.0 - Additional user license class C.', 'software4', 75, 67);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2470, 'SPNIX4.0 - NL', 'Operating System Software: SPNIX V4.0 - Additional network access license.', 'software4', 80, 70);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2471, 'SPNIX3.3 SU', 'Operating System Software: SPNIX V3.3 - Base Server License Upgrade to V4.0.', 'software4', 500, 439);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2492, 'SPNIX3.3 AU', 'Operating System Software: SPNIX V3.3 - V4.0 upgrade; class A user.', 'software4', 45, 38);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2493, 'SPNIX3.3 C/DU', 'Operating System Software: SPNIX V3.3 - V4.0 upgrade; class C or D user.', 'software4', 25, 22);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2494, 'SPNIX3.3 NU', 'Operating System Software: SPNIX V3.3 - V4.0 upgrade; network access license.', 'software4', 25, 20);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2995, 'SPNIX3.3 SAU', 'Operating System Software: SPNIX V3.3 - V4.0 upgrade; system administrator license.', 'software4', 70, 62);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3290, 'SPNIX3.3 DU', 'Operating System Software: SPNIX V3.3 - V4.0 upgrade; developer license.', 'software4', 65, 55);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1778, 'C for SPNIX3.3 - 1 Seat', 'C programming software for SPNIX V3.3 - single user', 'software5', 62, 52);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1779, 'C for SPNIX3.3 - Doc', 'C programming language documentation' || chr(10) || ', SPNIX V3.3', 'software5', 128, 112);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1780, 'C for SPNIX3.3 - Sys', 'C programming software for SPNIX V3.3 - system compiler, libraries, linker', 'software5', 450, 385);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2371, 'C for SPNIX4.0 - Doc', 'C programming language documentation, SPNIX V4.0', 'software5', 146, 119);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2423, 'C for SPNIX4.0 - 1 Seat', 'C programming software for SPNIX V4.0 - single user', 'software5', 84, 73);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3501, 'C for SPNIX4.0 - Sys', 'C programming software for SPNIX V4.0 - system compiler, libraries, linker', 'software5', 555, 448);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3502, 'C for SPNIX3.3 -Sys/U', 'C programming software for SPNIX V3.3 - 4.0 Upgrade; system compiler, libraries, linker', 'software5', 105, 88);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3503, 'C for SPNIX3.3 - Seat/U', 'C programming software for SPNIX V3.3 - 4.0 Upgrade - single user', 'software5', 22, 18);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1774, 'Base ISO CP - BL', 'Base ISO Communication Package - Base License', 'software6', 110, 93);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1775, 'Client ISO CP - S', 'ISO Communication Package add-on license for additional SPNIX V3.3 client.', 'software6', 27, 22);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1794, 'OSI 8-16/IL', 'OSI Layer 8 to 16 - Incremental License', 'software6', 128, 112);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1825, 'X25 - 1 Line License', 'X25 network access control system, single user', 'software6', 25, 21);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2004, 'IC Browser - S', 'IC Web Browser for SPNIX. Browser with network mail capability.', 'software6', 90, 80);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2005, 'IC Browser Doc - S', 'Documentation set for IC Web Browser for SPNIX. Includes Installation Manual, Mail Server Administration Guide, and User Quick Reference.', 'software6', 115, 100);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2416, 'Client ISO CP - S', 'ISO Communication Package add-on license for additional SPNIX V4.0 client.', 'software6', 41, 36);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2417, 'Client ISO CP - V', 'ISO Communication Package add-on license for additional Vision client.', 'software6', 33, 27);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2449, 'OSI 1-4/IL', 'OSI Layer 1 to 4 - Incremental License', 'software6', 83, 72);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3101, 'IC Browser - V', 'IC Web Browser for Vision with manual. Browser with network mail capability.', 'software6', 75, 67);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3170, 'Smart Suite - V/SP', 'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for Vision. Spanish language software and user manuals.', 'software6', 161, 132);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3171, 'Smart Suite - S3.3/EN', 'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for SPNIX Version 3.3. English language software and user manuals.', 'software6', 148, 120);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3172, 'Graphics - DIK+', 'Software Kit Graphics: Draw-It Kwik-Plus. Includes extensive clip art files and advanced drawing tools for 3-D object manipulation, variable shading, and extended character fonts.', 'software6', 42, 34);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3173, 'Graphics - SA', 'Software Kit Graphics: SmartArt. Professional graphics package for SPNIX with multiple line styles, textures, built-in shapes and common symbols.', 'software6', 86, 72);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2412, '8MB EDO Memory', '8 MB 8x32 EDO SIM memory. Extended Data Out memory differs from FPM in a small, but significant design change. Unlike FPM, the data output drivers for EDO remain on when the memory controller removes the column address to begin the next cycle. Therefore, a new data cycle can begin before the previous cycle has completed. EDO is available on SIMMs and DIMMs, in 3.3 and 5 volt varieties.', 'hardware4', 98, 83);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2378, 'DIMM - 128 MB', '128 MB DIMM memory. The main reason for the change from SIMMs to DIMMs is to support the higher bus widths of 64-bit processors. DIMMs are 64- or 72-bits wide; SIMMs are only 32- or 36-bits wide (with parity).', 'hardware4', 305, 247);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3087, 'DIMM - 16 MB', 'Citrus OLX DIMM - 16 MB capacity.', 'hardware4', 124, 99);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2384, 'DIMM - 1GB', 'Memory DIMM: RAM - 1 GB capacity.', 'hardware4', 599, 479);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1749, 'DIMM - 256MB', 'Memory DIMM: RAM 256 MB. (100-MHz Registered SDRAM)', 'hardware4', 337, 300);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1750, 'DIMM - 2GB', 'Memory DIMM: RAM, 2 GB capacity.', 'hardware4', 699, 560);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2394, 'DIMM - 32MB', '32 MB DIMM Memory upgrade', 'hardware4', 128, 106);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2400, 'DIMM - 512 MB', '512 MB DIMM memory. Improved memory upgrade granularity: Fewer DIMMs are required to upgrade a system than it would require if using SIMMs in the same system. Increased maximum memory ceilings: Given the same number of memory slots, the maximum memory of a system using DIMMs is more than one using SIMMs. DIMMs have separate contacts on each side of the board, which provide two times the data rate as one SIMM.', 'hardware4', 448, 380);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1763, 'DIMM - 64MB', 'Memory DIMM: RAM, 64MB (100-MHz Unregistered ECC SDRAM)', 'hardware4', 247, 202);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2396, 'EDO - 32MB', 'Memory EDO SIM: RAM, 32 MB (100-MHz Unregistered ECC SDRAM). Like FPM, EDO is available on SIMMs and DIMMs, in 3.3 and 5 volt varieties If EDO memory is installed in a computer that was not designed to support it, the memory may not work.', 'hardware4', 179, 149);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2272, 'RAM - 16 MB', 'Memory SIMM: RAM - 16 MB capacity.', 'hardware4', 135, 110);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2274, 'RAM - 32 MB', 'Memory SIMM: RAM - 32 MB capacity.', 'hardware4', 161, 135);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3090, 'RAM - 48 MB', 'Random Access Memory, SIMM - 48 MB capacity.', 'hardware4', 193, 170);
commit;
-- prompt 200 records committed...
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1739, 'SDRAM - 128 MB', 'SDRAM memory, 128 MB capacity. SDRAM can access data at speeds up to 100 MHz, which is up to four times as fast as standard DRAMs. The advantages of SDRAM can be fully realized, however, only by computers designed to support SDRAM. SDRAM is available on 5 and 3.3 volt DIMMs.', 'hardware4', 299, 248);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3359, 'SDRAM - 16 MB', 'SDRAM memory upgrade module, 16 MB. Synchronous Dynamic Random Access Memory was introduced after EDO. Its architecture and operation are based on those of the standard DRAM, but SDRAM provides a revolutionary change to main memory that further reduces data retrieval times. SDRAM is synchronized to the system clock that controls the CPU. This means that the system clock controlling the functions of the microprocessor also controls the SDRAM functions. This enables the memory controller to know on which clock cycle a data request will be ready, and therefore eliminates timing delays.', 'hardware4', 111, 99);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3088, 'SDRAM - 32 MB', 'SDRAM module with ECC - 32 MB capacity. SDRAM has multiple memory banks that can work simultaneously. Switching between banks allows for a continuous data flow.', 'hardware4', 258, 220);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2276, 'SDRAM - 48 MB', 'Memory SIMM: RAM - 48 MB. SDRAM can operate in burst mode. In burst mode, when a single data address is accessed, an entire block of data is retrieved rather than just the one piece. The assumption is that the next piece of data that will be requested will be sequential to the previous. Since this is usually the case, data is held readily available.', 'hardware4', 269, 215);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3086, 'VRAM - 16 MB', 'Citrus Video RAM module - 16 MB capacity. VRAM is used by the video system in a computer to store video information and is reserved exclusively for video operations. It was developed to provide continuous streams of serial data for refreshing video screens.', 'hardware4', 211, 186);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3091, 'VRAM - 64 MB', 'Citrus Video RAM memory module - 64 MB capacity. Physically, VRAM looks just like DRAM with added hardware called a shift register. The special feature of VRAM is that it can transfer one entire row of data (up to 256 bits) into this shift register in a single clock cycle. This ability significantly reduces retrieval time, since the number of fetches is reduced from a possible 256 to a single fetch. The main benefit of having a shift register available for data dumps is that it frees the CPU to refresh the screen rather than retrieve data, thereby doubling the data bandwidth. For this reason, VRAM is often referred to as being dual-ported. However, the shift register will only be used when the VRAM chip is given special instructions to do so. The command to use the shift register is built into the graphics controller.', 'hardware4', 279, 243);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1787, 'CPU D300', 'Dual CPU @ 300Mhz. For light personal processing only, or file servers with less than 5 concurrent users. This product will probably become obsolete soon.', 'hardware5', 101, 90);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2439, 'CPU D400', 'Dual CPU @ 400Mhz. Good price/performance ratio; for mid-size LAN file servers (up to 100 concurrent users).', 'hardware5', 123, 105);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1788, 'CPU D600', 'Dual CPU @ 600Mhz. State of the art, high clock speed; for heavy load WAN servers (up to 200 concurrent users).', 'hardware5', 178, 149);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2375, 'GP 1024x768', 'Graphics Processor, resolution 1024 X 768 pixels. Outstanding price/performance for 2D and 3D applications under SPNIX v3.3 and v4.0. Double your viewing power by running two monitors from this single card. Two 17 inch monitors have more screen area than one 21 inch monitor. Excellent option for users that multi-task frequently or access data from multiple sources often.', 'hardware5', 78, 69);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2411, 'GP 1280x1024', 'Graphics Processor, resolution 1280 X 1024 pixels. High end 3D performance at a mid range price: 15 million Gouraud shaded triangles per second, Optimized 3D drivers for MCAD and DCC applications, with user-customizable settings. 64MB DDR SDRAM unified frame buffer supporting true color at all supported standard resolutions.', 'hardware5', 98, 78);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1769, 'GP 800x600', 'Graphics processor, resolution 800 x 600 pixels. Remarkable value for users requiring great 2D capabilities or general 3D support for advanced applications. Drives incredible performance in highly complex models and frees the customer to focus on the design, instead of the rendering process.', 'hardware5', 48, null);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2049, 'MB - S300', 'PC type motherboard, 300 Series.', 'hardware5', 55, 47);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2751, 'MB - S450', 'PC type motherboard, 450 Series.', 'hardware5', 66, 54);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3112, 'MB - S500', 'PC type motherboard, 500 Series.', 'hardware5', 77, 66);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2752, 'MB - S550', 'PC type motherboard for the 550 Series.', 'hardware5', 88, 76);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2293, 'MB - S600', 'Motherboard, 600 Series.', 'hardware5', 99, 87);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3114, 'MB - S900/650+', 'PC motherboard, 900 Series; standard motherboard for all models 650 and up.', 'hardware5', 101, 88);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3129, 'Sound Card STD', 'Sound Card - standard version, with MIDI interface, line in/out, low impedance microphone input.', 'hardware5', 46, 39);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3133, 'Video Card /32', 'Video Card, with 32MB cache memory.', 'hardware5', 48, 41);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2308, 'Video Card /E32', '3-D ELSA Video Card, with 32 MB memory.', 'hardware5', 58, 48);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3175, 'Project Management - S4.0', 'Project Management Software, for SPNIX V4.0. Software includes command line and graphical interface with text, graphic, spreadsheet, and customizable report formats.', 'software6', 37, 32);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3176, 'Smart Suite - V/EN', 'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for Vision. English language software and user manuals.', 'software6', 120, 103);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3177, 'Smart Suite - V/FR', 'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for Vision. French language software and user manuals.', 'software6', 120, 102);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3245, 'Smart Suite - S4.0/FR', 'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for SPNIX V4.0. French language software and user manuals.', 'software6', 222, 195);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3246, 'Smart Suite - S4.0/SP', 'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for SPNIX V4.0. Spanish language software and user manuals.', 'software6', 222, 193);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3247, 'Smart Suite - V/DE', 'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for Vision. German language software and user manuals.', 'software6', 120, 96);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3248, 'Smart Suite - S4.0/DE', 'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for SPNIX V4.0. German language software and user manuals.', 'software6', 222, 193);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3250, 'Graphics - DIK', 'Software Kit Graphics: Draw-It Kwik. Simple graphics package for Vision systems, with options to save in GIF, JPG, and BMP formats.', 'software6', 28, 24);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3251, 'Project Management - V', 'Project Management Software, for Vision. Software includes command line and graphical interface with text, graphic, spreadsheet, and customizable report formats.', 'software6', 31, 26);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3252, 'Project Management - S3.3', 'Project Management Software, for SPNIX V3.3. Software includes command line and graphical interface with text, graphic, spreadsheet, and customizable report formats.', 'software6', 26, 23);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3253, 'Smart Suite - S4.0/EN', 'Office Suite (SmartWrite, SmartArt, SmartSpread, SmartBrowse) for SPNIX V4.0. English language software and user manuals.', 'software6', 222, 188);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3257, 'Web Browser - SB/S 2.1', 'Software Kit Web Browser: SmartBrowse V2.1 for SPNIX V3.3. Includes context sensitive help files and online documentation.', 'software6', 66, 58);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3258, 'Web Browser - SB/V 1.0', 'Software Kit Web Browser: SmartBrowse V2.1 for Vision. Includes context sensitive help files and online documentation.', 'software6', 80, 70);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3362, 'Web Browser - SB/S 4.0', 'Software Kit Web Browser: SmartBrowse V4.0 for SPNIX V4.0. Includes context sensitive help files and online documentation.', 'software6', 99, 81);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2231, 'Desk - S/V', 'Standard-sized desk; capitalizable, taxable item. Final finish is from veneer in stock at time of order, including oak, ash, cherry, and mahogany.', 'office1', 2510, 2114);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2335, 'Mobile phone', 'Dual band mobile phone with low battery consumption. Lightweight, foldable, with socket for single earphone and spare battery compartment.', 'office1', 100, 83);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2350, 'Desk - W/48', 'Desk - 48 inch white laminate without return; capitalizable, taxable item.', 'office1', 2500, 2129);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2351, 'Desk - W/48/R', 'Desk - 60 inch white laminate with 48 inch return; capitalizable, taxable item.', 'office1', 2900, 2386);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2779, 'Desk - OS/O/F', 'Executive-style oversized oak desk with file drawers. Final finish is customizable when ordered, light or dark oak stain, or natural hand rubbed clear.', 'office1', 3980, 3347);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3337, 'Mobile Web Phone', 'Mobile phone including monthly fee for Web access. Slimline shape with leather-look carrying case and belt clip.', 'office1', 800, 666);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2091, 'Paper Tablet LW 8 1/2 x 11', 'Paper tablet, lined, white, size 8 1/2 x 11 inch', 'office2', 1, 0);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2093, 'Pens - 10/FP', 'Permanent ink pen dries quickly and is smear resistant. Provides smooth, skip-free writing. Fine point. Single color boxes (black, blue, red) or assorted box (6 black, 3 blue, and 1 red).', 'office2', 8, 7);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2144, 'Card Organizer Cover', 'Replacement cover for desk top style business card holder. Smoke grey (original color) or clear plastic.', 'office2', 18, 14);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2336, 'Business Cards Box - 250', 'Business cards box, capacity 250. Use form BC110-2, Rev. 3/2000 (hardcopy or online) when ordering and complete all fields marked with an asterisk.', 'office2', 55, 49);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2337, 'Business Cards - 1000/2L', 'Business cards box, capacity 1000, 2-sided with different language on each side. Use form BC111-2, Rev. 12/1999 (hardcopy or online) when ordering - complete all fields marked with an asterisk and check box for second language (English is always on side 1).', 'office2', 300, 246);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2339, 'Paper - Std Printer', '20 lb. 8.5x11 inch white laser printer paper (recycled), ten 500-sheet reams', 'office2', 25, 21);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2536, 'Business Cards - 250/2L', 'Business cards box, capacity 250, 2-sided with different language on each side. Use form BC111-2, Rev. 12/1999 (hardcopy or online) when ordering - complete all fields marked with an asterisk and check box for second language (English is always on side 1).', 'office2', 80, 68);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2537, 'Business Cards Box - 1000', 'Business cards box, capacity 1000. Use form BC110-3, Rev. 3/2000 (hardcopy or online) when ordering and complete all fields marked with an asterisk.', 'office2', 200, 176);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2783, 'Clips - Paper', 'World brand paper clips set the standard for quality.10 boxes with 100 clips each. #1 regular or jumbo, smooth or non-skid.', 'office2', 10, 8);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2808, 'Paper Tablet LY 8 1/2 x 11', 'Paper Tablet, Lined, Yellow, size 8 1/2 x 11 inch', 'office2', 1, 0);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2810, 'Inkvisible Pens', 'Rollerball pen is equipped with a smooth precision tip. See-through rubber grip allows for a visible ink supply and comfortable writing. 4-pack with 1 each, black, blue, red, green.', 'office2', 6, 4);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2870, 'Pencil - Mech', 'Ergonomically designed mechanical pencil for improved writing comfort. Refillable erasers and leads. Available in three lead sizes: .5mm (fine); .7mm (medium); and .9mm (thick).', 'office2', 5, 4);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3051, 'Pens - 10/MP', 'Permanent ink pen dries quickly and is smear resistant. Provides smooth, skip-free writing. Medium point. Single color boxes (black, blue, red) or assorted box (6 black, 3 blue, and 1 red).', 'office2', 12, 10);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3150, 'Card Holder - 25', 'Card Holder; heavy plastic business card holder with embossed corporate logo. Holds about 25 of your business cards, depending on card thickness.', 'office2', 18, 15);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3208, 'Pencils - Wood', 'Box of 2 dozen wooden pencils. Specify lead type when ordering: 2H (double hard), H (hard), HB (hard black), B (soft black).', 'office2', 2, 1);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3209, 'Sharpener - Pencil', 'Electric Pencil Sharpener Rugged steel cutters for long life. PencilSaver helps prevent over-sharpening. Non-skid rubber feet. Built-in pencil holder.', 'office2', 13, 11);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3224, 'Card Organizer - 250', 'Portable holder for organizing business cards, capacity 250. Booklet style with slip in, transparent pockets for business cards. Optional alphabet tabs. Specify cover color when ordering (dark brown, beige, burgundy, black, and light grey).', 'office2', 32, 28);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3225, 'Card Organizer - 1000', 'Holder for organizing business cards with alphabet dividers; capacity 1000. Desk top style with smoke grey cover and black base. Lid is removable for storing inside drawer.', 'office2', 47, 39);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3511, 'Paper - HQ Printer', 'Quality paper for inkjet and laser printers tested to resist printer jams. Acid free for archival purposes. 22lb. weight with brightness of 92. Size: 8 1/2 x 11. Single 500-sheet ream.', 'office2', 9, 7);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3515, 'Lead Replacement', 'Refill leads for mechanical pencils. Each pack contains 25 leads and a replacement eraser. Available in three lead sizes: .5mm (fine); .7mm (medium); and .9mm (thick).', 'office2', 2, 1);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2986, 'Manual - Vision OS/2x +', 'Manuals for Vision Operating System V 2.x and Vision Office Suite', 'office3', 125, 111);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3163, 'Manual - Vision Net6.3/US', 'Vision Networking V6.3 Reference Manual. US version with advanced encryption.', 'office3', 35, 29);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3165, 'Manual - Vision Tools2.0', 'Vision Business Tools Suite V2.0 Reference Manual. Includes installation, configuration, and user guide.', 'office3', 40, 34);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3167, 'Manual - Vision OS/2.x', 'Vision Operating System V2.0/2.1/2/3 Reference Manual. Complete installation, configuration, management, and tuning information for Vision system administration. Note that this manual replaces the individual Version 2.0 and 2.1 manuals.', 'office3', 55, 47);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3216, 'Manual - Vision Net6.3', 'Vision Networking V6.3 Reference Manual. Non-US version with basic encryption.', 'office3', 30, 26);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3220, 'Manual - Vision OS/1.2', 'Vision Operating System V1.2 Reference Manual. Complete installation, configuration, management, and tuning information for Vision system administration.', 'office3', 45, 36);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1729, 'Chemicals - RCP', 'Cleaning Chemicals - 3500 roller clean pads', 'office4', 80, 66);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1910, 'FG Stock - H', 'Fiberglass Stock - heavy duty, 1 thick', 'office4', 14, 11);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1912, 'SS Stock - 3mm', 'Stainless steel stock - 3mm. Can be predrilled for standard power supplies, motherboard holders, and hard drives. Please use appropriate template to identify model number, placement, and size of finished sheet when placing order for drilled sheet.', 'office4', 15, 12);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (1940, 'ESD Bracelet/Clip', 'Electro static discharge bracelet with alligator clip for easy connection to computer chassis or other ground.', 'office4', 18, 14);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2030, 'Latex Gloves', 'Latex Gloves for assemblers, chemical handlers, fitters. Heavy duty, safety orange, with textured grip on fingers and thumb. Waterproof and shock-proof up to 220 volts/2 amps, 110 volts/5 amps. Acid proof for up to 5 minutes.', 'office4', 12, 10);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2326, 'Plastic Stock - Y', 'Plastic Stock - Yellow, standard quality.', 'office4', 2, 1);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2330, 'Plastic Stock - R', 'Plastic Stock - Red, standard quality.', 'office4', 2, 1);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2334, 'Resin', 'General purpose synthetic resin.', 'office4', 4, 3);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2340, 'Chemicals - SW', 'Cleaning Chemicals - 3500 staticide wipes', 'office4', 72, 59);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2365, 'Chemicals - TCS', 'Cleaning Chemical - 2500 transport cleaning sheets', 'office4', 78, 69);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2594, 'FG Stock - L', 'Fiberglass Stock - light weight for internal heat shielding, 1/4 thick', 'office4', 9, 7);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2596, 'SS Stock - 1mm', 'Stainless steel stock - 3mm. Can be predrilled for standard model motherboard and battery holders. Please use appropriate template to identify model number, placement, and size of finished sheet when placing order for drilled sheet.', 'office4', 12, 10);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2631, 'ESD Bracelet/QR', 'Electro Static Discharge Bracelet: 2 piece lead with quick release connector. One piece stays permanently attached to computer chassis with screw, the other is attached to the bracelet. Additional permanent ends available.', 'office4', 15, 12);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2721, 'PC Bag - L/S', 'Black Leather Computer Case - single laptop capacity with pockets for manuals, additional hardware, and work papers. Adjustable protective straps and removable pocket for power supply and cables.', 'office4', 87, 70);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2722, 'PC Bag - L/D', 'Black Leather Computer Case - double laptop capacity with pockets for additional hardware or manuals and work papers. Adjustable protective straps and removable pockets for power supplies and cables. Double wide shoulder strap for comfort.', 'office4', 112, 99);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2725, 'Machine Oil', 'Machine Oil for Lubrication of CD-ROM drive doors and slides. Self-cleaning adjustable nozzle for fine to medium flow.', 'office4', 4, 3);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (2782, 'PC Bag - C/S', 'Canvas Computer Case - single laptop capacity with pockets for manuals, additional hardware, and work papers. Adjustable protective straps and removable pocket for power supply and cables. Outside pocket with snap closure for easy access while travelling.', 'office4', 62, 50);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3187, 'Plastic Stock - B/HD', 'Plastic Stock - Blue, high density.', 'office4', 3, 2);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3189, 'Plastic Stock - G', 'Plastic Stock - Green, standard density.', 'office4', 2, 1);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3191, 'Plastic Stock - O', 'Plastic Stock - Orange, standard density.', 'office4', 2, 1);
insert into PRODUSE (ID_PRODUS, DENUMIRE_PRODUS, DESCRIERE, CATEGORIE, PRET_LISTA, PRET_MIN)
values (3193, 'Plastic Stock - W/HD', 'Plastic Stock - White, high density.', 'office4', 3, 2);
commit;
-- prompt 288 records loaded
-- prompt Loading RAND_COMENZI...
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2392, 3124, 77, 63);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2393, 3082, 78, 10);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2394, 3134, 18, 45);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2399, 2311, 86.9, 20);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2400, 2999, 880, 16);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2411, 3106, 45, 11);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2412, 3139, 20, 79);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2418, 3110, 45, 20);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2419, 3129, 43, 57);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2421, 3129, 43, 172);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2422, 3133, 46, 11);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2423, 3245, 214.5, 13);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2427, 2464, 66, 6);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2428, 3127, 498, 12);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2429, 3133, 46, 52);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2431, 3129, 44, 11);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2434, 2236, 949.3, 84);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2435, 2316, 21, 10);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2440, 2311, 86.9, 7);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2442, 2439, 115.5, 30);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2444, 3143, 15, 97);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2445, 2293, 97, 11);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2448, 3133, 42, 11);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2452, 3139, 20, 10);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2354, 3150, 17, 58);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2355, 2322, 19, 188);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2356, 2308, 58, 47);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2357, 2245, 462, 26);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2358, 1808, 55, 14);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2362, 2326, 1.1, 173);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2363, 2299, 74, 25);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2365, 2319, 24, 38);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2366, 2395, 120, 12);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2368, 3129, 42, 72);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2372, 3134, 17, 17);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2375, 3143, 15, 93);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2376, 2302, 133.1, 21);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2379, 3127, 488.4, 23);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2380, 3143, 15, 31);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2382, 3129, 42, 76);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2383, 2439, 115.5, 54);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2384, 2322, 22, 59);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2387, 2243, 332.2, 20);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2391, 1822, 1433.3, 23);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2392, 3133, 45, 66);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2393, 3086, 211, 13);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2394, 3140, 19, 48);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2395, 2243, 332.2, 27);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2397, 2999, 880, 16);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2399, 2316, 22, 24);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2400, 3003, 2866.6, 19);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2412, 3143, 16, 80);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2414, 3246, 212.3, 18);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2419, 3133, 45, 61);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2420, 3133, 48, 29);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2423, 3246, 212.3, 14);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2427, 2470, 76, 6);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2428, 3133, 48, 12);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2429, 3139, 21, 54);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2432, 2999, 880, 11);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2434, 2245, 462, 86);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2435, 2323, 18, 12);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2436, 3245, 214.5, 16);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2437, 2457, 4.4, 17);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2440, 2322, 23, 10);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2443, 3139, 20, 12);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2444, 3150, 17, 100);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2445, 2299, 72, 14);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2448, 3134, 17, 14);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2450, 3216, 29, 11);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2452, 3143, 15, 12);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2454, 2308, 55, 12);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2455, 2496, 268.4, 32);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2456, 2537, 193.6, 19);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2354, 3163, 30, 61);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2355, 2323, 17, 190);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2356, 2311, 95, 51);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2357, 2252, 788.7, 26);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2361, 2326, 1.1, 194);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2362, 2334, 3.3, 177);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2363, 2308, 57, 26);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2365, 2322, 19, 43);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2366, 2400, 418, 16);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2369, 3170, 145.2, 24);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2372, 3143, 15, 21);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2374, 2467, 79, 21);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2375, 3150, 17, 93);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2376, 2311, 95, 25);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2380, 3150, 17, 33);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2382, 3139, 21, 79);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2384, 2330, 1.1, 61);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2385, 2311, 86.9, 96);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2387, 2245, 462, 22);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2389, 3143, 15, 30);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2390, 1948, 470.8, 16);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2392, 3139, 21, 68);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2393, 3087, 108.9, 14);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2395, 2252, 788.7, 30);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2397, 3000, 1696.2, 16);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2399, 2326, 1.1, 27);
commit;
-- prompt 100 records committed...
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2407, 2752, 86, 18);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2411, 3112, 72, 17);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2414, 3253, 206.8, 23);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2420, 3140, 19, 34);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2423, 3251, 26, 16);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2426, 3234, 34, 18);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2428, 3143, 16, 13);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2434, 2252, 788.7, 87);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2435, 2334, 3.3, 14);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2436, 3250, 27, 18);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2437, 2462, 76, 19);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2440, 2330, 1.1, 13);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2443, 3143, 15, 17);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2444, 3155, 43, 104);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2448, 3139, 20, 15);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2450, 3220, 41, 14);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2451, 1948, 470.8, 22);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2452, 3150, 17, 13);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2454, 2316, 21, 13);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2457, 3150, 17, 27);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2458, 3143, 15, 129);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2354, 3165, 37, 64);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2355, 2326, 1.1, 192);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2356, 2316, 22, 55);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2357, 2257, 371.8, 29);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2360, 2093, 7.7, 42);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2361, 2334, 3.3, 198);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2362, 2339, 25, 179);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2363, 2311, 86.9, 29);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2364, 1948, 470.8, 20);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2365, 2326, 1.1, 44);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2366, 2406, 195.8, 20);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2367, 2322, 22, 45);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2369, 3176, 113.3, 24);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2371, 2316, 21, 21);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2375, 3155, 45, 98);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2376, 2316, 21, 27);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2377, 2319, 25, 131);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2380, 3155, 45, 33);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2381, 3163, 35, 55);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2382, 3143, 15, 82);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2385, 2319, 25, 97);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2386, 2365, 77, 27);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2387, 2252, 788.7, 27);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2389, 3155, 46, 33);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2392, 3150, 18, 72);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2393, 3091, 278, 19);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2396, 3140, 19, 93);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2399, 2330, 1.1, 28);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2406, 2761, 26, 19);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2407, 2761, 26, 21);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2410, 3003, 2866.6, 15);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2411, 3123, 75, 17);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2414, 3260, 50, 24);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2420, 3143, 15, 39);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2422, 3150, 17, 25);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2423, 3258, 78, 21);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2428, 3150, 17, 16);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2429, 3150, 17, 55);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2434, 2254, 408.1, 92);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2435, 2339, 25, 19);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2436, 3256, 36, 18);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2437, 2464, 64, 21);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2440, 2334, 3.3, 15);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2442, 2459, 624.8, 40);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2443, 3150, 18, 17);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2447, 2293, 97, 34);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2448, 3143, 16, 16);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2450, 3224, 32, 16);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2452, 3155, 44, 13);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2454, 2323, 18, 16);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2457, 3155, 44, 32);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2354, 3167, 51, 68);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2355, 2330, 1.1, 197);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2356, 2323, 18, 55);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2357, 2262, 95, 29);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2359, 2370, 91, 17);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2363, 2319, 24, 31);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2365, 2335, 97, 45);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2366, 2409, 194.7, 22);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2367, 2326, 1.1, 48);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2368, 3143, 16, 75);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2369, 3187, 2.2, 24);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2371, 2323, 17, 24);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2375, 3163, 30, 99);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2376, 2319, 25, 32);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2377, 2326, 1.1, 132);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2379, 3139, 21, 34);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2380, 3163, 32, 36);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2383, 2457, 4.4, 62);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2386, 2370, 90, 28);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2387, 2253, 354.2, 32);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2388, 2330, 1.1, 105);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2392, 3155, 49, 77);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2393, 3099, 3.3, 19);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2394, 3155, 49, 61);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2395, 2255, 690.8, 34);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2396, 3150, 17, 93);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2399, 2335, 100, 33);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2411, 3124, 84, 17);
commit;
-- prompt 200 records committed...
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2419, 3150, 17, 69);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2421, 3143, 15, 176);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2422, 3155, 43, 29);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2434, 2257, 371.8, 94);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2435, 2350, 2341.9, 24);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2440, 2337, 270.6, 19);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2442, 2467, 80, 44);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2443, 3155, 43, 21);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2445, 2311, 95, 24);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2446, 2326, 1.1, 34);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2447, 2299, 76, 35);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2452, 3165, 34, 18);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2454, 2334, 3.3, 18);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2354, 3170, 145.2, 70);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2355, 2339, 25, 199);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2357, 2268, 75, 32);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2359, 2373, 6, 17);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2363, 2323, 18, 34);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2365, 2339, 25, 50);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2366, 2415, 339.9, 24);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2367, 2330, 1.1, 52);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2368, 3155, 45, 75);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2369, 3193, 2.2, 28);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2371, 2334, 3.3, 26);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2372, 3163, 30, 30);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2375, 3165, 36, 103);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2376, 2326, 1.1, 33);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2377, 2330, 1.1, 136);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2379, 3140, 19, 35);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2380, 3167, 52, 37);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2383, 2462, 75, 63);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2386, 2375, 73, 32);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2395, 2264, 199.1, 34);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2396, 3155, 47, 98);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2398, 2537, 193.6, 23);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2411, 3127, 488.4, 18);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2413, 3155, 47, 62);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2418, 3140, 20, 31);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2419, 3155, 47, 72);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2421, 3150, 17, 176);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2440, 2339, 25, 23);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2444, 3165, 37, 112);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2445, 2319, 25, 27);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2446, 2330, 1.1, 36);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2447, 2302, 133.1, 37);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2452, 3170, 145.2, 20);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2354, 3176, 113.3, 72);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2359, 2377, 96, 17);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2363, 2326, 1.1, 37);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2365, 2340, 72, 54);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2366, 2419, 69, 24);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2367, 2335, 91.3, 54);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2371, 2339, 25, 29);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2372, 3167, 54, 32);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2375, 3171, 132, 107);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2376, 2334, 3.3, 36);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2378, 2457, 4.4, 25);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2380, 3176, 113.3, 40);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2381, 3176, 113.3, 62);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2382, 3163, 29, 89);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2385, 2335, 91.3, 106);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2386, 2378, 271.7, 33);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2389, 3165, 34, 43);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2395, 2268, 71, 37);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2396, 3163, 29, 100);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2398, 2594, 9, 27);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2410, 3051, 12, 21);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2411, 3133, 43, 23);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2412, 3163, 30, 92);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2413, 3163, 30, 66);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2419, 3165, 35, 76);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2420, 3163, 30, 45);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2422, 3163, 30, 35);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2426, 3248, 212.3, 26);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2427, 2496, 268.4, 19);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2428, 3170, 145.2, 24);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2429, 3163, 30, 63);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2440, 2350, 2341.9, 24);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2444, 3172, 37, 112);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2445, 2326, 1.1, 28);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2446, 2337, 270.6, 37);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2447, 2308, 54, 40);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2452, 3172, 37, 20);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2457, 3170, 145.2, 42);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2354, 3182, 61, 77);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2357, 2276, 236.5, 38);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2359, 2380, 5.5, 17);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2361, 2359, 248, 208);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2362, 2359, 248, 189);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2363, 2334, 3.3, 42);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2367, 2350, 2341.9, 54);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2369, 3204, 123, 34);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2371, 2350, 2341.9, 32);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2372, 3170, 145.2, 36);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2375, 3176, 120, 109);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2378, 2459, 624.8, 25);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2380, 3187, 2.2, 40);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2381, 3183, 47, 63);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2382, 3165, 37, 92);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2384, 2359, 249, 77);
commit;
-- prompt 300 records committed...
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2385, 2350, 2341.9, 109);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2386, 2394, 116.6, 36);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2387, 2268, 75, 42);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2388, 2350, 2341.9, 112);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2389, 3167, 52, 47);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2392, 3165, 40, 81);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2393, 3108, 69.3, 30);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2394, 3167, 52, 68);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2395, 2270, 64, 41);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2399, 2359, 226.6, 38);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2404, 2808, 0, 37);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2406, 2782, 62, 31);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2411, 3143, 15, 24);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2412, 3167, 54, 94);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2417, 2976, 51, 37);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2418, 3150, 17, 37);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2419, 3167, 54, 81);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2420, 3171, 132, 47);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2421, 3155, 43, 185);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2422, 3167, 54, 39);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2423, 3290, 65, 33);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2426, 3252, 25, 29);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2427, 2522, 40, 22);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2428, 3173, 86, 28);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2429, 3165, 36, 67);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2430, 3501, 492.8, 43);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2434, 2268, 75, 104);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2435, 2365, 75, 33);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2436, 3290, 63, 24);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2437, 2496, 268.4, 35);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2440, 2359, 226.6, 28);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2443, 3165, 36, 31);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2444, 3182, 63, 115);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2446, 2350, 2341.9, 39);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2447, 2311, 93, 44);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2452, 3173, 80, 23);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2455, 2536, 75, 54);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2457, 3172, 36, 45);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2458, 3163, 32, 142);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2355, 2359, 226.6, 204);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2357, 2289, 48, 41);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2359, 2381, 97, 17);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2361, 2365, 76, 209);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2355, 2289, 46, 200);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2356, 2264, 199.1, 38);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2357, 2211, 3.3, 140);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2358, 1781, 226.6, 9);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2359, 2337, 270.6, 1);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2360, 2058, 23, 29);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2361, 2289, 46, 180);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2362, 2289, 48, 200);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2363, 2264, 199.1, 9);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2364, 1910, 14, 6);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2365, 2289, 48, 92);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2366, 2359, 226.6, 8);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2367, 2289, 48, 99);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2354, 3106, 48, 61);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2368, 3106, 48, 150);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2369, 3150, 18, 3);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2370, 1910, 14, 9);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2371, 2274, 157, 6);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2372, 3106, 48, 6);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2373, 1820, 49, 8);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2374, 2422, 150, 10);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2375, 3106, 42, 140);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2376, 2270, 60, 14);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2377, 2289, 42, 130);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2378, 2403, 113.3, 20);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2379, 3106, 42, 92);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2380, 3106, 42, 26);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2381, 3117, 38, 110);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2382, 3106, 42, 160);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2383, 2409, 194.7, 37);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2384, 2289, 43, 95);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2385, 2289, 43, 200);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2386, 2330, 1.1, 7);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2387, 2211, 3.3, 52);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2388, 2289, 43, 150);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2389, 3106, 43, 180);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2390, 1910, 14, 4);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2391, 1787, 101, 5);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2392, 3106, 43, 63);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2393, 3051, 12, 10);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2394, 3117, 41, 90);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2395, 2211, 3.3, 110);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2396, 3106, 44, 150);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2397, 2976, 52, 2);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2398, 2471, 482.9, 5);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2399, 2289, 44, 120);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2400, 2976, 52, 4);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2401, 2492, 41, 4);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2402, 2536, 75, 8);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2403, 2522, 44, 5);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2404, 2721, 85, 6);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2405, 2638, 137, 9);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2406, 2721, 85, 5);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2407, 2721, 85, 5);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2408, 2751, 61, 3);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2409, 2810, 6, 8);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2410, 2976, 46, 10);
commit;
-- prompt 400 records committed...
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2411, 3082, 81, 2);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2412, 3106, 46, 170);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2413, 3108, 77, 200);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2414, 3208, 1.1, 8);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2415, 2751, 62, 5);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2416, 2870, 4.4, 10);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2417, 2870, 4.4, 9);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2418, 3082, 75, 15);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2419, 3106, 46, 150);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2420, 3106, 46, 110);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2421, 3106, 46, 160);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2422, 3106, 46, 18);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2423, 3220, 39, 8);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2424, 3350, 693, 11);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2425, 3501, 492.8, 3);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2426, 3193, 2.2, 6);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2427, 2430, 173, 12);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2428, 3106, 42, 7);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2429, 3106, 42, 200);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2430, 3350, 693, 6);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2431, 3097, 2.2, 3);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2432, 2976, 49, 3);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2433, 1910, 13, 6);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2434, 2211, 3.3, 81);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2435, 2289, 48, 35);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2436, 3208, 1.1, 8);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2437, 2423, 83, 8);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2438, 2995, 69, 3);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2439, 1797, 316.8, 9);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2440, 2289, 48, 19);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2441, 2536, 80, 9);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2442, 2402, 127, 26);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2443, 3106, 44, 3);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2444, 3117, 36, 110);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2445, 2270, 66, 5);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2446, 2289, 48, 47);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2447, 2264, 199.1, 29);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2448, 3106, 44, 3);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2449, 2522, 43, 2);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2450, 3191, 1.1, 4);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2451, 1910, 13, 9);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2452, 3117, 38, 140);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2453, 2492, 43, 3);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2454, 2289, 43, 120);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2455, 2471, 482.9, 3);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2456, 2522, 40, 5);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2457, 3108, 72, 36);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2458, 3117, 38, 140);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2354, 3114, 96.8, 43);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2356, 2274, 148.5, 34);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2358, 1782, 125, 4);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2361, 2299, 76, 180);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2362, 2299, 76, 160);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2363, 2272, 129, 7);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2365, 2293, 99, 28);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2368, 3110, 42, 60);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2369, 3155, 43, 1);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2372, 3108, 74, 2);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2373, 1825, 24, 1);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2374, 2423, 78, 6);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2375, 3112, 71, 84);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2376, 2276, 236.5, 4);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2378, 2412, 95, 2);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2380, 3108, 75, 18);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2381, 3124, 77, 44);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2382, 3110, 43, 64);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2384, 2299, 71, 48);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2386, 2334, 3.3, 5);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2388, 2293, 94, 90);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2389, 3112, 73, 18);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2390, 1912, 14, 2);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2391, 1791, 262.9, 3);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2392, 3112, 73, 57);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2393, 3060, 295, 2);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2394, 3123, 77, 36);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2396, 3108, 76, 75);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2399, 2293, 94, 12);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2400, 2982, 41, 1);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2401, 2496, 268.4, 3);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2406, 2725, 3.3, 4);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2408, 2761, 26, 1);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2411, 3086, 208, 2);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2412, 3114, 98, 68);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2413, 3112, 75, 40);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2414, 3216, 30, 7);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2416, 2878, 340, 1);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2418, 3090, 187, 12);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2419, 3114, 99, 45);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2420, 3110, 46, 11);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2421, 3108, 78, 160);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2422, 3117, 41, 5);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2423, 3224, 32, 3);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2424, 3354, 541, 9);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2425, 3511, 9, 2);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2427, 2439, 121, 1);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2428, 3108, 76, 1);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2429, 3108, 76, 40);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2430, 3353, 454.3, 5);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2431, 3106, 48, 1);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2432, 2982, 43, 2);
commit;
-- prompt 500 records committed...
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2435, 2299, 75, 4);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2436, 3209, 13, 2);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2437, 2430, 157.3, 4);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2438, 3000, 1748, 3);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2439, 1806, 45, 4);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2440, 2293, 98, 2);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2441, 2537, 193.6, 7);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2442, 2410, 350.9, 21);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2443, 3114, 101, 2);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2444, 3127, 488.4, 88);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2445, 2278, 49, 3);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2447, 2266, 297, 23);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2448, 3114, 99, 0);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2450, 3193, 2.2, 3);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2454, 2293, 99, 0);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2457, 3123, 79, 14);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2458, 3123, 79, 112);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2354, 3123, 79, 47);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2361, 2308, 53, 182);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2362, 2311, 93, 164);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2365, 2302, 133.1, 29);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2368, 3117, 38, 62);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2369, 3163, 32, 5);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2372, 3110, 42, 7);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2375, 3117, 38, 85);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2378, 2414, 438.9, 7);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2380, 3117, 38, 23);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2381, 3133, 44, 44);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2382, 3114, 100, 65);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2389, 3123, 80, 21);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2391, 1797, 348, 7);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2392, 3117, 38, 58);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2393, 3064, 1017, 5);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2394, 3124, 82, 39);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2396, 3110, 44, 79);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2399, 2299, 76, 15);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2400, 2986, 123, 4);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2410, 2982, 40, 5);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2411, 3097, 2.2, 6);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2412, 3123, 71.5, 68);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2413, 3117, 35, 44);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2414, 3220, 41, 9);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2418, 3097, 2.2, 13);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2419, 3123, 71.5, 48);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2420, 3114, 101, 15);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2421, 3112, 72, 164);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2422, 3123, 71.5, 5);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2424, 3359, 111, 12);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2425, 3515, 1.1, 4);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2428, 3114, 101, 5);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2429, 3110, 45, 43);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2430, 3359, 111, 10);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2431, 3114, 101, 3);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2436, 3216, 30, 3);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2439, 1820, 54, 9);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2440, 2302, 150, 2);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2442, 2418, 60, 23);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2444, 3133, 43, 90);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2450, 3197, 44, 5);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2454, 2299, 71, 3);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2457, 3127, 488.4, 17);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2458, 3127, 488.4, 114);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2354, 3129, 41, 47);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2361, 2311, 86.9, 185);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2362, 2316, 22, 168);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2365, 2308, 56, 29);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2366, 2373, 6, 7);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2367, 2302, 147, 32);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2369, 3165, 34, 10);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2371, 2293, 96, 8);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2375, 3127, 488.4, 86);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2377, 2302, 147, 119);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2378, 2417, 27, 11);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2379, 3114, 98, 14);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2380, 3127, 488.4, 24);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2381, 3139, 20, 45);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2382, 3117, 35, 66);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2383, 2418, 56, 45);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2386, 2340, 71, 14);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2389, 3129, 46, 22);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2391, 1799, 961.4, 10);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2393, 3069, 385, 8);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2394, 3129, 46, 41);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2396, 3114, 100, 83);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2397, 2986, 120, 8);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2399, 2302, 149, 17);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2410, 2986, 120, 6);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2411, 3099, 3.3, 7);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2412, 3127, 492, 72);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2413, 3127, 492, 44);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2414, 3234, 39, 11);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2420, 3123, 79, 20);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2421, 3117, 41, 165);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2426, 3216, 30, 11);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2428, 3117, 41, 6);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2429, 3123, 79, 46);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2430, 3362, 94, 10);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2431, 3117, 41, 7);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2432, 2986, 122, 5);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2436, 3224, 32, 6);
commit;
-- prompt 600 records committed...
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2439, 1822, 1433.3, 13);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2442, 2422, 144, 25);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2443, 3124, 82, 6);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2444, 3139, 21, 93);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2447, 2272, 121, 24);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2458, 3134, 17, 115);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2354, 3139, 21, 48);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2355, 2308, 57, 185);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2356, 2293, 98, 40);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2358, 1797, 316.8, 12);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2359, 2359, 249, 1);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2361, 2316, 22, 187);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2365, 2311, 95, 29);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2366, 2382, 804.1, 10);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2368, 3123, 81, 70);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2372, 3123, 81, 10);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2374, 2449, 78, 15);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2375, 3133, 45, 88);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2376, 2293, 99, 13);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2377, 2311, 95, 121);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2378, 2423, 79, 11);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2380, 3133, 46, 28);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2381, 3143, 15, 48);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2382, 3123, 79, 71);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2383, 2422, 146, 46);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2385, 2302, 133.1, 87);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2388, 2308, 56, 96);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2391, 1808, 55, 15);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2393, 3077, 260.7, 8);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2394, 3133, 46, 45);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2399, 2308, 56, 17);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2408, 2783, 10, 10);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2410, 2995, 68, 8);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2411, 3101, 73, 8);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2412, 3134, 18, 75);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2413, 3129, 46, 45);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2420, 3127, 496, 22);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2421, 3123, 80, 168);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2422, 3127, 496, 9);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2427, 2457, 4.4, 6);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2428, 3123, 80, 8);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2429, 3127, 497, 49);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2431, 3127, 498, 9);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2435, 2311, 86.9, 8);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2442, 2430, 173, 28);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2444, 3140, 19, 95);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2447, 2278, 50, 25);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2354, 3143, 16, 53);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2355, 2311, 86.9, 188);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2356, 2299, 72, 44);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2358, 1803, 55, 13);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2365, 2316, 22, 34);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2366, 2394, 116.6, 11);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2367, 2308, 54, 39);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2368, 3127, 496, 70);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2371, 2299, 73, 15);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2372, 3127, 496, 13);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2375, 3134, 17, 90);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2376, 2299, 73, 17);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2378, 2424, 217.8, 15);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2380, 3140, 20, 30);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2382, 3127, 496, 71);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2383, 2430, 174, 50);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2384, 2316, 21, 58);
insert into RAND_COMENZI (NR_COMANDA, ID_PRODUS, PRET, CANTITATE)
values (2391, 1820, 52, 18);
commit;
-- prompt 665 records loaded
-- prompt Enabling foreign key constraints for TARI...
alter table TARI enable constraint TARA_REG_FK;
-- prompt Enabling foreign key constraints for LOCATII...
alter table LOCATII enable constraint LOC_C_ID_FK;
-- prompt Enabling foreign key constraints for ANGAJATI...
alter table ANGAJATI enable constraint ANG_DEPT_FK;
alter table ANGAJATI enable constraint ANG_FUNCTIE_FK;
alter table ANGAJATI enable constraint ANG_MANAGER_FK;
-- prompt Enabling foreign key constraints for DEPARTAMENTE...
alter table DEPARTAMENTE enable constraint DEPT_LOC_FK;
-- prompt Enabling foreign key constraints for COMENZI...
alter table COMENZI enable constraint COMENZI_ID_ANGAJAT_FK;
alter table COMENZI enable constraint COMENZI_ID_CLIENT_FK;
-- prompt Enabling foreign key constraints for ISTORIC_FUNCTII...
alter table ISTORIC_FUNCTII enable constraint IST_ANG_FK;
alter table ISTORIC_FUNCTII enable constraint IST_DEPT_FK;
alter table ISTORIC_FUNCTII enable constraint IST_FUNCTII_FK;
-- prompt Enabling foreign key constraints for RAND_COMENZI...
alter table RAND_COMENZI enable constraint PROD_COM_ID_PRODUS_FK;
alter table RAND_COMENZI enable constraint PROD_COM_NR_COMANDA_FK;
-- prompt Enabling triggers for REGIUNI...
alter table REGIUNI enable all triggers;
-- prompt Enabling triggers for TARI...
alter table TARI enable all triggers;
-- prompt Enabling triggers for LOCATII...
alter table LOCATII enable all triggers;
-- prompt Enabling triggers for ANGAJATI...
alter table ANGAJATI enable all triggers;
-- prompt Enabling triggers for DEPARTAMENTE...
alter table DEPARTAMENTE enable all triggers;
-- prompt Enabling triggers for FUNCTII...
alter table FUNCTII enable all triggers;
-- prompt Enabling triggers for CLIENTI...
alter table CLIENTI enable all triggers;
-- prompt Enabling triggers for COMENZI...
alter table COMENZI enable all triggers;
-- prompt Enabling triggers for ISTORIC_FUNCTII...
alter table ISTORIC_FUNCTII enable all triggers;
-- prompt Enabling triggers for PRODUSE...
alter table PRODUSE enable all triggers;
-- prompt Enabling triggers for RAND_COMENZI...
alter table RAND_COMENZI enable all triggers;
-- set feedback on
-- set define on
-- prompt Done.