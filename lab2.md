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
select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where orzechy is not null;

select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where orzechy is null;

select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where orzechy is not null or nadzienie is not null;

select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where czekolada in ('mleczna', 'biala') and orzechy is null;

select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where czekolada not in ('mleczna', 'biala') and (nadzienie is not null or orzechy is not null);

select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nadzienie is not null;

select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nadzienie is null;

select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where nadzienie is null and orzechy is null;

select idczekoladki, nazwa, czekolada, orzechy, nadzienie from czekoladki where czekolada in ('mleczna','biała') and nadzienie is null;

```

## Zadanie 2.6

baza danych: cukiernia

Napisz zapytanie w języku SQL, które wyświetli czekoladki których:

1. masa mieści się w przedziale od 15 do 24 g lub koszt produkcji mieści się w przedziale od 15 do 24 gr,

`select * from czekoladki where (masa between 15 and 24) or (koszt between 0.15 and 0.24);`

2. masa mieści się w przedziale od 15 do 24 g i koszt produkcji mieści się w przedziale od 15 do 24 gr lub masa mieści się w przedziale od 25 do 35 g i koszt produkcji mieści się w przedziale od 25 do 35 gr,

`select * from czekoladki where (masa between 15 and 24 and koszt between 0.15 and 0.24) or (masa between 25 and 35 and koszt between 0.25 and 0.35);`

3. masa mieści się w przedziale od 15 do 24 g i koszt produkcji mieści się w przedziale od 15 do 24 gr,

`select * from czekoladki where masa between 15 and 24 and koszt between 0.15 and 0.24;`

4. masa mieści się w przedziale od 25 do 35 g, ale koszt produkcji nie mieści się w przedziale od 25 do 35 gr,

`select * from czekoladki where (masa between 25 and 35) and (koszt between 0.25 and 0.35);`

5. masa mieści się w przedziale od 25 do 35 g, ale koszt produkcji nie mieści się ani w przedziale od 15 do 24 gr, ani w przedziale od 25 do 35 gr.

`select * from czekoladki where (masa between 25 and 35) and (koszt not between 0.15 and 0.24) and (koszt not between 0.25 and 0.24);`


## Zadanie 2.7

baza danych: cukiernia, oprogramowanie: psql

Korzystając z psql utwórz zapytanie wyświetlające całą zawartość tabeli Klienci.

1. Wydaj polecenie \a i ponownie wykonaj to samo zapytanie.
\a ->  ustawia ladnie lub brzydko
2. Wydaj polecenie \f ' ' i ponownie wykonaj to samo zapytanie.
\f ' '-> zmienia separator na spacje
3. Wydaj polecenie \H i ponownie wykonaj to samo zapytanie.
\H -> ustawia format na html
4. Stosując polecenie \o przekieruj wyniki zapytania do pliku wynik.html. Ponownie wykonaj to samo zapytanie. Na drugiej konsoli sprawdź efekt jego realizacji.
\o nazwapliku -> przekierowuje output do pliku

