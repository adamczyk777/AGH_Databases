# Laboratorium 4

## Zadanie 1

**baza danych: cukiernia**
Porównaj wyniki poniższych zapytań:
```sql
SELECT k.nazwa FROM klienci k;
-- same imiona i nazwiska

SELECT k.nazwa, z.idzamowienia FROM klienci k, zamowienia z;
-- połaczone z id zamowienia dla klienta kazdy z kazdym

SELECT k.nazwa, z.idzamowienia FROM klienci k, zamowienia z  
WHERE z.idklienta = k.idklienta;
-- Łączy tylko istotne nie robi iloczynu kartezjanskiego

SELECT k.nazwa, z.idzamowienia FROM klienci k NATURAL JOIN zamowienia z;
-- tak jak wyzej

SELECT k.nazwa, z.idzamowienia FROM klienci k JOIN zamowienia z
ON z.idklienta=k.idklienta;
-- działa tak samo jak wyzej ale mamy do czynienia z inna skladnia

SELECT k.nazwa, z.idzamowienia FROM klienci k JOIN zamowienia z
USING (idklienta);
-- Tak jak wyzej
```

1. W którym zapytaniu występuje iloczyn kartezjański?

    zapytanie drugie

2. Które zapytanie dostarcza bezwartościowych danych?

    Zapytanie drugie

## Zadanie 2

**baza danych: cukiernia**

Napisz zapytanie w języku SQL wyświetlające informacje na temat zamówień (data realizacji, idzamowienia), które:
1. zostały złożone przez klienta, który ma na imię Antoni,
```sql
select z.datarealizacji, z.idzamowienia, k.nazwa from zamowienia z natural join klienci k where nazwa similar to '%Antoni%';
```
2. zostały złożone przez klientów z mieszkań (zwróć uwagę na pole ulica),
```sql
select z.datarealizacji, z.idzamowienia, k.ulica from zamowienia z natural join klienci k where ulica similar to '%/%';
```
3. zostały złożone przez klienta z Krakowa do realizacji w listopadzie 2013 roku. *
```sql
select z.datarealizacji, z.idzamowienia, k.miejscowosc from zamowienia z natural join klienci k where miejscowosc='Kraków' and datarealizacji between '01-11-2013' and '30-11-2013'; 
select z.datarealizacji, z.idzamowienia, k.miejscowosc from zamowienia z join klienci k using (idklienta) where miejscowosc='Kraków' and datarealizacji between '01-11-2013' and '30-11-2013'; 
select z.datarealizacji, z.idzamowienia, k.miejscowosc from zamowienia z join klienci k on z.idklienta=k.idklienta where miejscowosc='Kraków' and datarealizacji between '01-11-2013' and '30-11-2013'; 
```

W każdym zapytaniu należy dodać dodatkowxe pola (poza informacjami o zamówieniu), które pozwolą sprawdzić, czy wynik jest poprawny np. nazwa klienta, ulica etc.

## Zadanie 3

**baza danych: cukiernia**

Napisz zapytanie w języku SQL wyświetlające informacje na temat klientów (nazwa, ulica, miejscowość), którzy:
1. złożyli zamówienia z datą realizacji nie starszą niż sprzed pięciu lat
```sql
select k.nazwa, k.ulica, k.miejscowosc from klienci k natural join zamowienia z where z.datarealizacji > (current_date-interval '5 years');
```
2. zamówili pudełko Kremowa fantazja lub Kolekcja jesienna
```sql
select pudelka.nazwa as "Pudełko", k.ulica, k.miejscowosc from klienci k join zamowienia using (idklienta) join artykuly using (idzamowienia) join pudelka using (idpudelka) where pudelka.nazwa='Kremowa fantazja' or pudelka.nazwa='Kolekcja jesienna';  
```
3. złożyli przynajmniej jedno zamówienie
```sql
select distinct nazwa, ulica, miejscowosc from klienci natural join zamowienia;
```
4. nie złożyli żadnych zamówień
```sql
select nazwa, ulica, miejscowosc from klienci left join zamowienia using (idklienta) where idzamowienia is null;
```
5. złożyli zamówienia z datą realizacji w listopadzie 2013 *
```sql
select nazwa, ulica, miejscowosc, datarealizacji from klienci natural join zamowienia where datarealizacji between '01-11-2013' and '30-11-2013';
```
6. zamówili co najmniej 2 sztuki pudełek Kremowa fantazja lub Kolekcja jesienna w ramach jednego zamówienia *
```sql
select k.nazwa, k.ulica, k.miejscowosc from klienci k join zamowienia z using (idklienta) join artykuly a using (idzamowienia) join pudelka p using (idpudelka) where p.nazwa in ('Kolekcha jesienna', 'Kremowa fantazja') and a.sztuk >= 2;
```
7. zamówili pudełka, które zawierają czekoladki z migdałami * 
```sql
select k.nazwa, k.ulica, k.miejscowosc from klienci k join zamowienia using (idklienta) join artykuly using (idzamowienia) join pudelka p using (idpudelka) join zawartosc z using (idpudelka) join czekoladki cz using (idczekoladki) where cz.nadzienie='migdały';
```

W każdym zapytaniu należy dodać dodatkowe pola (poza danymi klientów), które pozwolą sprawdzić, czy wynik jest poprawny np. data realizacji, nazwa pudełka itd.

Wskazówka: W punkcie 4 można wykorzystać złączenie zewnętrzne.

## Zadanie 4

**baza danych: cukiernia**

Napisz zapytanie w języku SQL wyświetlające informacje na temat pudełek i ich zawartości (nazwa, opis, nazwa czekoladki, opis czekoladki):
1. wszystkich pudełek
```sql
select p.nazwa, p.opis, c.nazwa, c.opis from pudelka p join zawartosc using(idpudelka) join czekoladki c using(idczekoladki);
```
2. pudełka o wartości klucza głównego heav
```sql
select p.idpudelka, p.nazwa, p.opis, c.nazwa, c.opis from pudelka p join zawartosc using(idpudelka) join czekoladki c using(idczekoladki) where p.idpudelka='heav';
```
3. pudełek, których nazwa zawiera słowo Kolekcja *
```sql
select p.idpudelka, p.nazwa, p.opis, c.nazwa, c.opis from pudelka p join zawartosc using(idpudelka) join czekoladki c using(idczekoladki) where p.nazwa like '%Kolekcja%';
```

W każdym zapytaniu należy dodać dodatkowe pola (poza danymi o pudełkach), które pozwolą sprawdzić, czy wynik jest poprawny.

## Zadanie 5

**baza danych: cukiernia**

Napisz zapytanie w języku SQL wyświetlające informacje na temat pudełek z czekoladkami (nazwa, opis, cena), które (uwaga: może być konieczne użycie konstrukcji z poprzednich laboratoriów):
1. zawierają czekoladki o wartości klucza głównego d09
```sql
select p.nazwa, p.opis, p.cena from pudelka p natural join zawartosc z where z.idczekoladki='d09';
```
2. zawierają przynajmniej jedną czekoladkę, której nazwa zaczyna się na S
```sql
select p.nazwa, p.opis, p.cena from pudelka p join zawartosc z on z.idpudelka = p.idpudelka join czekoladki c on c.idczekoladki = z.idczekoladki where c.nazwa like 'S%';
```
3. zawierają przynajmniej 4 sztuki czekoladek jednego gatunku (o takim samym kluczu głównym)
```sql
select distinct p.nazwa, p.opis, p.cena from pudelka p join zawartosc z on z.idpudelka = p.idpudelka join czekoladki c on c.idczekoladki = z.idczekoladki where z.sztuk>=4;
```
4. zawierają czekoladki z nadzieniem truskawkowym
```sql
select distinct p.nazwa, p.opis, p.cena from pudelka p join zawartosc z on z.idpudelka = p.idpudelka join czekoladki c on c.idczekoladki = z.idczekoladki where c.nadzienie='truskawki';
```
5. nie zawierają czekoladek w gorzkiej czekoladzie
```sql
select distinct p.nazwa, p.opis, p.cena from pudelka p join zawartosc z on z.idpudelka = p.idpudelka join czekoladki c on c.idczekoladki = z.idczekoladki where c.czekolada!='gorzka';
```
6. ★ zawierają co najmniej 3 sztuki czekoladki Gorzka truskawkowa,
```sql
select distinct p.nazwa, p.opis, p.cena from pudelka p join zawartosc z on z.idpudelka = p.idpudelka join czekoladki c on c.idczekoladki = z.idczekoladki where c.nazwa='Gorzka truskawkowa' and z.sztuk>=3;
```
7. ★ nie zawierają czekoladek z orzechami,
```sql
select distinct p.nazwa, p.opis, p.cena from pudelka p join zawartosc z on z.idpudelka = p.idpudelka join czekoladki c on c.idczekoladki = z.idczekoladki where c.orzechy is null;
```
8. ★ zawierają czekoladki Gorzka truskawkowa,
```sql
select distinct p.nazwa, p.opis, p.cena from pudelka p join zawartosc z on z.idpudelka = p.idpudelka join czekoladki c on c.idczekoladki = z.idczekoladki where c.nazwa='Gorzka truskawkowa';
```
9. ★ zawierają przynajmniej jedną czekoladkę bez nadzienia.
```sql
select distinct p.nazwa, p.opis, p.cena from pudelka p join zawartosc z on z.idpudelka = p.idpudelka join czekoladki c on c.idczekoladki = z.idczekoladki where c.nadzienie is null and z.sztuk>=1;
```

W każdym zapytaniu należy dodać dodatkowe pola (poza danymi o pudełkach), które pozwolą sprawdzić, czy wynik jest poprawny.

**Uwaga**: Zdania: “Pudełko nie zawiera czekoladek w gorzkiej czekoladzie.” i “Pudełko zawiera jakieś czekoladki, które nie są w gorzkiej czekoladzie” nie oznaczają tego samego ;)

**Wskazówka**: W punktach 5 i 7 można wykorzystać operator EXCEPT.

## Zadanie 6

**baza danych: cukiernia**

Napisz poniższe zapytania w języku SQL:
1. Wyświetl wartości kluczy głównych oraz nazwy czekoladek, których koszt jest większy od kosztu czekoladki o wartości klucza głównego równej d08.
```sql
select distinct c1.koszt, c1.nazwa from czekoladki c1, czekoladki c2 where c2.idczekoladki = 'd08' and c1.koszt > c2.koszt;
```
2. Kto (nazwa klienta) złożył zamówienia na takie same czekoladki (pudełka) jak zamawiała Górka Alicja.
```sql
select distinct k1.nazwa from klienci k1 natural join zamowienia z1 natural join artykuly a1, klienci k2 natural join zamowienia z2 natural join artykuly a2 where k2.nazwa = 'Górka Alicja' and a1.idpudelka = a2.idpudelka and a1.sztuk = a2.sztuk and k1.nazwa != k2.nazwa;
```
3. ★ Kto (nazwa klienta, adres) złożył zamówienia na takie same czekoladki (pudełka) jak zamawiali klienci z Katowic.
```sql
select ditinct k1.nazwa from klienci k1 natural join zamowienia z1 natural join artykuly a1, klienci k2 natural join zamowienia z2 natural join artykuly a2 where k2.miejscowosc = 'Katowice' and k1.miejscowosc != 'Katowice' and a1.idpudelka = a2.idpudelka and a1.sztuk = a2.sztuk and k1.nazwa != k2.nazwa;
```
**Uwaga**: w powyższych zapytaniach należy użyć samozłączeń (złączeń własnych).

**Wskazówka**: Zapytanie w punkcie 2 można znacznie uprościć stosując konstrukcję z WITH.