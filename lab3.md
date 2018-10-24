# Laboratorium 3

## Zadanie 1
``` sql
select idZamowienia, dataRealizacji from zamowienia where dataRealizacji >= '2013-11-15' and dataRealizacji <= '2013-11-20';
select idZamowienia, dataRealizacji from zamowienia where dataRealizacji between '2013-12-01' and '2013-12-06' or dataRealizacji between '2013-12-15' and '2013-12-20';
select idZamowienia, dataRealizacji from zamowienia where dataRealizacji between '2013-12-01' and '2013-12-31';
select idZamowienia, dataRealizacji from zamowienia where date_part('year',dataRealizacji) = 2013 and date_part('month',dataRealizacji) = 11;
select idZamowienia, dataRealizacji from zamowienia where date_part('year',dataRealizacji) = 2013 and date_part('month',dataRealizacji) between 11 nad 12;
select idZamowienia, dataRealizacji from zamowienia where date_part('day',dataRealizacji) between 17 and 19;
select idZamowienia, dataRealizacji from zamowienia where date_part('week',dataRealizacji) between 46 and 47;
```

## Zadanie 2
``` sql
select idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nazwa similar to 'S%'; 
select idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nazwa similar to 'S%i';
select idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nazwa similar to 'S% m%'; 
select idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nazwa similar to '(A|B|C)%'; 
select idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nazwa similar to '%(O|o)rzech%';
select idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nazwa similar to 'S%m%';
select idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nazwa similar to '%(maliny|truskawki)%';
select idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nazwa not similar to '(D|E|F|G|H|I|J|K|S|T)%';
select idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nazwa similar to 'Slod%';
select idCzekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nazwa not similar to '% %';
```

## Zadanie 3
``` sql
select miejscowosc from klienci where miejscowosc similar to '_+ _+';
select telefon from klienci where telefon similar to '0%';
select telefon form klienci where telefon not similar to '0%'
```

## Zadanie 4
``` sql
select * from czekoladki where (masa between 15 and 24) union select * from czekoladki where (koszt between 0.15 and 0.24);
select * from czekoladki where masa between 25 and 35 except select * from czekoladki where koszt between 0.25 and 0.35;
select * from czekoladki where masa between 15 and 24 intersect select * from czekoladki where koszt between 0.15 and 0.24 union select * from czekoladki where masa between 25 and 35 and koszt between 0.25 and 0.35;
select * from czekoladki where masa between 15 and 24 intersect select * from czekoladki where koszt between 0.15 and 0.24;
select * from czekoladki where masa between 25 and 35 except select * from czekoladki where koszt not between 0.15 and 0.24
except select * from czekoladki where koszt not between 0.29 and 0.35;
```

## Zadanie 5
``` sql
select idklienta from klienci except select idklienta from zamowienia;
select idpudelka from pudelka except select idpudelka from artykuly;
select nazwa from czekoladki where nazwa similar to '%(Rz|rz)%' union select nazwa from pudelka where nazwa similar to '%(Rz|rz)%' union select nazwa from klienci where nazwa similar to '%(Rz|rz)%';
select idczekoladki from czekoladki except select idczekoladki from zawartosc;
```

## Zadanie 6
``` sql
select idmeczu, gospodarze[1]+gospodarze[2]+gospodarze[3]+coalesce(gospodarze[4],0)+coalesce(gospodarze[5],0) as gospodarze, goscie[1]+goscie[2]+goscie[3]+coalesce(goscie[4],0)+coalesce(goscie[5],0) as goscie from statystyki
select idmeczu, gospodarze[1]+gospodarze[2]+gospodarze[3]+coalesce(gospodarze[4],0)+coalesce(gospodarze[5],0) as gospodarze, goscie[1]+goscie[2]+goscie[3]+coalesce(goscie[4],0)+coalesce(goscie[5],0) as goscie from statystyki where gospodarze[5] > goscie[5] and (gospodarze[5] > 15 or doscie[5] > 15);
select idmeczu,(case when(gospodarze[1] > goscie[1])then 1 else 0 end+case when (gospodarze[2] > goscie[2]) then 1 else 0 end +case when(gospodarze[3] > goscie[3]) then 1 else 0 end + case when (gospodarze[4] > goscie[4]) then 1 else 0 end + case when (gospodarze[5] > goscie[5]) then 1 else 0 end) || ':' || (case when(gospodarze[1] < goscie[1])then 1 else 0 end+ case when (gospodarze[2] < goscie[2]) then 1 else 0 end + case when (gospodarze[3] < goscie[3]) then 1 else 0 end + case when (gospodarze[4] < goscie[4]) then 1 else 0 end + case when (gospodarze[5] < goscie[5]) then 1 else 0 end) as "wynik" from statystyki;
select idmeczu, gospodarze[1]+gospodarze[2]+gospodarze[3]+coalesce(gospodarze[4],0)+coalesce(gospodarze[5],0) as gospodarze, goscie[1]+goscie[2]+goscie[3]+coalesce(goscie[4],0)+coalesce(goscie[5],0) as goscie from statystyki where sqrt(gospodarze[1]) < log(2,gospodarze[1]+gospodarze[2]+gospodarze[3]+coalesce(gospodarze[4],0)+coalesce(gospodarze[5],0)+goscie[1]+goscie[2]+goscie[3]+coalesce(goscie[4],0)+coalesce(goscie[5],0))
```

## Zadanie 7

``` sql
\echo <!DOCTYPE html>
\echo <html>
\echo <body>
\echo
\echo <h1>Wynik</h1>
\H
\pset border 2
select idmeczu,(case when(gospodarze[1] > goscie[1])then 1 else 0 end+case when (gospodarze[2] > goscie[2]) then 1 else 0 end +case when(gospodarze[3] > goscie[3]) then 1 else 0 end + case when (gospodarze[4] > goscie[4]) then 1 else 0 end + case when (gospodarze[5] > goscie[5]) then 1 else 0 end) || ':' || (case when(gospodarze[1] < goscie[1])then 1 else 0 end+ case when (gospodarze[2] < goscie[2]) then 1 else 0 end + case when (gospodarze[3] < goscie[3]) then 1 else 0 end + case when (gospodarze[4] < goscie[4]) then 1 else 0 end + case when (gospodarze[5] < goscie[5]) then 1 else 0 end) as "wynik" from statystyki;
\echo
\echo </body>
\echo </html>
```

## Zadanie 8
``` sql
\a
\pset fieldsep ','
\t
select idmeczu, gospodarze[1]+gospodarze[2]+gospodarze[3]+coalesce(gospodarze[4],0)+coalesce(gospodarze[5],0) as gospodarze, goscie[1]+goscie[2]+goscie[3]+coalesce(goscie[4],0)+coalesce(goscie[5],0) as goscie from statystyki
```