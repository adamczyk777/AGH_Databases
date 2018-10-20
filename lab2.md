# Laboratorium 2

Wykonywanie prostych zapytań (rzutowanie, selekcja) opartych na pojedynczych tabelach. Praca z wartościami null.

## Zadanie 2.1

baza danych: cukiernia

``` sql
select nazwa, ulica, miejscowosc from klienci order by nazwa;

select * from klienci order by nazwa desc;

select * from klienci where miejscowosc in ('Kraków','Warszawa') order by miejscowosc desc, nazwa;

select * from klienci where miejscowosc = 'Kraków' or miejscowosc = 'Warszawa' order by miejscowosc desc, nazwa;

select * from klienci order by miejscowosd desc

select * from klienci where miejscowosc = 'Kraków' order by nazwa desc;
```

## Zadanie 2.2

baza danych: cukiernia

``` sql
select nazwa, masa from czekoladki where masa > 20;

select nazwa, masa, koszt from czekoladki where masa > 20 and koszt > 0.25;

select nazwa, masa, koszt*100 from czekoladki where masa > 20 and koszt > 25;

select nazwa, koszt, czekolada, nadzienie, orzechy from czekoladki where (czekolada = 'mleczna' and nadzienie = 'maliny') or (czekolada = 'mleczna' and nadzienie = 'truskawki') or (orzechy = 'laskowe' and czekolada != 'gorzka');

select nazwa, koszt from czekoladki where koszt > 0.25;

select nazwa, czekolada from czekoladki where czekolada in ('biala', 'mleczna');
```

## Zadanie 2.4

``` sql
select idczekoladki, nazwa, masa, koszt from czekoladki where masa between 15 and 24;

select idczekoladki, nazwa, masa, koszt from czekoladki where koszt between 0.15 and 0.24;

select idczekoladki, nazwa, masa, koszt from czekoladki where masa between 25 and 35 or koszt between 0.15 and 0.24;
```

## Zadanie 2.5

```sql

```
