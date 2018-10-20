# Laboratorium 1

## Wprowadzenie do psql

* \l			-> wyświetla baze danych
* \dt			-> wyświetla liste tabeli
* \d nazwa 	-> wyświetla strukturę tabeli
* \?			-> pomoc psql
* \h			-> pomoc SQL
* \q			-> zamyka psql
* \i skrypt	-> wykonuje skrypt
* \dn			-> wyświetla nazwy schematów

## Zadanie 1.1

``` sql
select nazwa, opis from czekoladki;
select nazwa, cena, stan from pudelka;
select * from klienci;
```

## Zadanie 1.2

Siatkówka

``` sql
-- tworymy schemat
create schema siatkowka;
\i schemat_siatkowka.sql

\dn
\dt

select imie, nazwisko from siatkowka.siatkarki

set search_path to siatkowka;
\dt
select imie, nazwisko from siatkarki;
set search_path to public;
select imie, nazwisko from siatkarki;
set search_path to public, siatkowka;
\dt;
```

## Zadanie 1.3

phppgadmin

