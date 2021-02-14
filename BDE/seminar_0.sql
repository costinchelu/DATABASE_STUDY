set serveroutput on
declare
    n NUMBER;
    m NUMBER;
    o NUMBER;
    
    cursor 
        salarii is select nume, 
                        prenume, 
                        salariul 
                   from 
                        angajati 
                   order by 
                        salariul desc;
                        
    ang salarii%rowtype;
                        
begin
    n := ROUND(100.7835, 2);
    m := GREATEST(100, 50, -20);
    
    SELECT 
        max(salariul) into o 
    FROM  
        angajati
    WHERE SALARIUL < 10000;
    DBMS_OUTPUT.PUT_LINE('n = ' || n || ' m = ' || m || ' o = ' || o);
    
    open salarii;
    loop
        FETCH salarii into ang;
        EXIT WHEN salarii%notfound OR salarii%rowcount = 4; -- only shows first 3 
        dbms_output.put_line('Angajatul ' || ang.nume || ' ' || ang.prenume || ' are un salariu de ' || ang.salariul || ' lei');
    end loop;
    close salarii;
    
exception
when VALUE_ERROR  then
    dbms_output.put_line('A aparut o exceptie ' || SQLERRM);
when others then
    dbms_output.put_line('Exceptie generala ' || SQLERRM);
end;
/




set serveroutput on
declare

    cursor 
        salarii is select nume, 
                        prenume, 
                        salariul 
                   from 
                        angajati 
                   order by 
                        salariul desc;
                        
begin
   
    FOR ang IN salarii LOOP
        EXIT WHEN salarii%rowcount = 4; -- only shows first 3 
        dbms_output.put_line('Angajatul ' || ang.nume || ' ' || ang.prenume || ' are un salariu de ' || ang.salariul || ' lei');
    END LOOP;

    
exception
when VALUE_ERROR  then
    dbms_output.put_line('A aparut o exceptie ' || SQLERRM);
when others then
    dbms_output.put_line('Exceptie generala ' || SQLERRM);
end;
/

--  PROCEDURI:

create or replace procedure afiseaza_angajati(v_salariul NUMBER) is
-- nu apare cuvantul declare (se subintelege)
    cursor 
        salarii is select nume, 
                        prenume, 
                        salariul 
                   from 
                        angajati 
                   where
                        salariul < v_salariul
                   order by 
                        salariul desc;
                        
begin
   
    FOR ang IN salarii LOOP
        EXIT WHEN salarii%rowcount = 4; -- only shows first 3 
        dbms_output.put_line('Angajatul ' || ang.nume || ' ' || ang.prenume || ' are un salariu de ' || ang.salariul || ' lei');
    END LOOP;

    
exception
when VALUE_ERROR  then
    dbms_output.put_line('A aparut o exceptie ' || SQLERRM);
when others then
    dbms_output.put_line('Exceptie generala ' || SQLERRM);
end;
/


-- apelam procedura (bloc anonim):
begin 
    afiseaza_angajati(v_salariul => 5000);
end;
/


-- FUNCTIE
create or replace function get_nr_comenzi(v_id_client number) return number is 
n number;

begin
    select count(*) into n from comenzi where id_client = v_id_client;
    return n;
end;
/


-- apelam functia (bloc)
declare
    n number;
begin
    n := get_nr_comenzi(v_id_client => 145);
    dbms_output.put_line('Nr. comenzi date ' || n);
end;
/


-- 
select 
    id_client, 
    prenume_client, 
    nume_client,    
    get_nr_comenzi(id_client) nr_comenzi_date 
from 
    clienti 
where 
    get_nr_comenzi(id_client) > 2
order by 
    nr_comenzi_date desc;
    
    
--

delete from clienti where get_nr_comenzi(id_client) = 0;

--

