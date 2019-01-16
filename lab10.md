# Laboratorium 10
## Tematyka zajęć
Zapytania z podzapytaniami.

Uwaga: Poniższy zestaw zadań przeznaczony jest na jeden półtoragodzinny blok zajęć oraz pracę samodzielną poza zajęciami laboratoryjnymi. Zadania lub punkty oznaczone symbolem ★ przeznaczone są do realizacji samodzielnej. Podczas zajęć laboratoryjnych należy w pierwszej kolejności realizować pozostałe obowiązkowe podpunkty.

## Zadanie 10.1
baza danych: cukiernia

Przeanalizuj poniższe zapytania i zinterpretuj ich znaczenie. Zwróć uwagę na operatory w klauzuli where:
```sql
SELECT DISTINCT nazwa 
FROM pudelka NATURAL JOIN zawartosc 
WHERE idczekoladki 
  IN (SELECT idczekoladki FROM czekoladki ORDER BY koszt LIMIT 3);
 
SELECT nazwa 
FROM czekoladki 
WHERE koszt = (SELECT MAX(koszt) FROM czekoladki);
```
Zwróć uwagę na umiejscowienie podzapytania, oraz ewentualną ilość wierszy/kolumn które zwraca.

```sql
SELECT p.nazwa, idpudelka 
FROM (SELECT idczekoladki FROM czekoladki ORDER BY koszt LIMIT 3) 
  AS ulubioneczekoladki 
NATURAL JOIN zawartosc 
NATURAL JOIN pudelka p;
 
SELECT nazwa, koszt, (SELECT MAX(koszt) FROM czekoladki) AS MAX FROM czekoladki;
```

## Zadanie 10.2
baza danych: cukiernia

Napisz zapytanie wyświetlające informacje na temat zamówień (dataRealizacji, idzamowienia) używając odpowiedniego operatora in/not in/exists/any/all, które:

* zostały złożone przez klienta, który ma na imię Antoni,
* zostały złożone przez klientów z mieszkań (zwróć uwagę na pole ulica),
* ★ zostały złożone przez klienta z Krakowa do realizacji w listopadzie 2013 roku.

## ★ Zadanie 10.3
baza danych: cukiernia

Napisz zapytanie wyświetlające informacje na temat klientów (nazwa, ulica, miejscowość), używając odpowiedniego operatora in/not in/exists/any/all, którzy:

* złożyli zamówienia z datą realizacji 12.11.2013,
* złożyli zamówienia z datą realizacji w listopadzie 2013,
* zamówili pudełko Kremowa fantazja lub Kolekcja jesienna,
* zamówili co najmniej 2 sztuki pudełek Kremowa fantazja lub Kolekcja jesienna w ramach jednego zamówienia,
* zamówili pudełka, które zawierają czekoladki z migdałami,
* złożyli przynajmniej jedno zamówienie,
* nie złożyli żadnych zamówień.

## Zadanie 10.4
baza danych: cukiernia

Napisz zapytanie wyświetlające informacje na temat pudełek z czekoladkami (nazwa, opis, cena), używając odpowiedniego operatora, np. in/not in/exists/any/all, które:

★ zawierają czekoladki o wartości klucza głównego D09
★ zawierają czekoladki Gorzka truskawkowa,
★ zawierają przynajmniej jedną czekoladkę, której nazwa zaczyna się na S,
★ zawierają przynajmniej 4 sztuki czekoladek jednego gatunku (o takim samym kluczu głównym),
★ zawierają co najmniej 3 sztuki czekoladki Gorzka truskawkowa,
★ zawierają czekoladki z nadzieniem truskawkowym,
nie zawierają czekoladek w gorzkiej czekoladzie,
nie zawierają czekoladek z orzechami,
zawierają przynajmniej jedną czekoladkę bez nadzienia.

## Zadanie 10.5
baza danych: cukiernia

Napisz poniższe zapytania w języku SQL (używając odpowiedniego operatora, np. in/not in/exists/any/all):

* Wyświetl wartości kluczy głównych oraz nazwy czekoladek, których koszt jest większy od czekoladki o wartości klucza głównego równej D08.
* ★ Kto (nazwa klienta) złożył zamówienia na takie same czekoladki (pudełka) jak zamawiała Gorka Alicja.
* ★ Kto (nazwa klienta, adres) złożył zamówienia na takie same czekoladki (pudełka) jak zamawiali klienci z Katowic.

## Zadanie 10.6
baza danych: cukiernia

Wyświetl nazwę pudełka oraz ilość czekoladek, dla:

* pudełka o największej liczbie czekoladek (bez użycia klauzuli limit),
* ★ pudełka o najmniejszej liczbie czekoladek (bez użycia klauzuli limit),
* ★ pudełka, w którym liczba czekoladek jest powyżej średniej.
* ★ pudełka o największej lub najmniejszej liczbie czekoladek.

## Zadanie 10.7
baza danych: cukiernia

Napisz zapytanie wyświetlające: liczbę porządkową i identyfikator pudełka czekoladek (idpudelka). Identyfikatory pudełek mają być posortowane alfabetycznie, rosnąco. Liczba porządkowa jest z przedziału 1..N, gdzie N jest ilością pudełek.

Użyj podzapytania w klauzuli select:

select kolumna1, kolumna2, (select ...) from ...