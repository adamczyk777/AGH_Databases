# Laboratorium 5

## Zadanie 1

Napisz zapytanie w języku SQL wyświetlające informacje na temat:

* łącznej liczby czekoladek w bazie danych,
```sql
select count(*) from czekkoladki;
```
* łącznej liczby czekoladek z nadzieniem (na 2 sposoby) - podpowiedź: count(*), count(nazwaKolumny),
```sql
select count(*) from czekoladki where nadzienie is not null;
select count (nadzienie) from czekoladki;
```
* pudełka, w którym jest najwięcej czekoladek (uwaga: konieczne jest użycie LIMIT),
```sql
select idpudelka, sum(sztuk) 
from zawartosc 
group by idpudelka 
order by zawartosc 
limit 1;
```
* ★ łącznej liczby czekoladek w poszczególnych pudełkach,
```sql
select idpudelka, sum(sztuk) 
from zawartosc 
group by idpudelka 
order by sum(sztuk) desc;
```
* ★ łącznej liczby czekoladek bez orzechów w poszczególnych pudełkach,
```sql
select idpudelka, sum(sztuk) 
from zawartosc
join czekoladki c using(idczekoladki)
where c.orzechy is null
group by idpudelka 
order by sum(sztuk) desc;
```
* ★ łącznej liczby czekoladek w mlecznej czekoladzie w poszczególnych pudełkach.
```sql
select idpudelka, sum(sztuk)
from zawartosc
join czekoladki c using(idczekoladki)
where c.czekolada='mleczna'
group by idpudelka
order by 2 desc;
```

## Zadanie 2

Napisz zapytanie w języku SQL wyświetlające informacje na temat:

* masy poszczególnych pudełek,
```sql
select idpudelka, sum(c.masa * sztuk)
from zawartosc
natural join czekoladki c
group by idpudelka
order by 2 desc;
```
* pudełka o największej masie,
```sql
select idpudelka, sum(c.masa * sztuk)
from zawartosc
natural join czekoladki c
group by idpudelka
order by 2 desc
limit 1;
```
* ★ średniej masy pudełka w ofercie cukierni,
```sql
select avg(p.weight)
from (
    select idpudelka, sum(c.masa * sztuk) as weight
    from zawartosc
    natural join czekoladki c
    group by idpudelka
) p;
```
* ★ średniej wagi pojedynczej czekoladki w poszczególnych pudełkach,
```sql
select idpudelka, sum(c.masa * sztuk) / sum(sztuk)
from zawartosc
natural join czekoladki c
group by idpudelka
order by 2 desc;
```

## Zadanie 3

Napisz zapytanie w języku SQL wyświetlające informacje na temat:

* liczby zamówień na poszczególne dni,
```sql
select datarealizacji, count(datarealizacji)
from zamowienia
group by datarealizacji
order by 1 desc;
```
* łącznej liczby wszystkich zamówień,
```sql
select count(*)
from zamowienia;
```
* ★ łącznej wartości wszystkich zamówień,
```sql
select sum(koszt_zamowienia)
from (select idzamowienia, sum(a.sztuk * p.cena) as koszt_zamowienia
from zamowienia
join artykuly a using(idzamowienia)
join pudelka p using(idpudelka)
group by idzamowienia) koszta;
```
* ★ klientów, liczby złożonych przez nich zamówień i łącznej wartości złożonych przez nich zamówień.
```sql
select k.nazwa, count(z.idzamowienia)
from klienci k
join zamowienia z using(idklienta)
group by k.nazwa
order by 2 desc;
```

## Zadanie 4

Napisz zapytanie w języku SQL wyświetlające informacje na temat:

* czekoladki, która występuje w największej liczbie pudełek,
```sql
select c.idczekoladki, c.nazwa, count(c.idczekoladki)
from pudelka p
join zawartosc z using(idpudelka)
join czekoladki c using(idczekoladki)
group by c.idczekoladki
order by 3 desc;
```
* pudełka, które zawiera najwięcej czekoladek bez orzechów,
```sql
select p.idpudelka, p.nazwa, count(c.idczekoladki)
from pudelka p
join zawartosc z using(idpudelka)
join czekoladki c using(idczekoladki)
where c.orzechy is null
group by p.idpudelka
order by 3 desc;
```
* ★ czekoladki, która występuje w najmniejszej liczbie pudełek,
```sql

```
* ★ pudełka, które jest najczęściej zamawiane przez klientów.
```sql

```

## Zadanie 5

Napisz zapytanie w języku SQL wyświetlające informacje na temat:

* liczby zamówień na poszczególne kwartały,
```sql
select date_part('quarter', datarealizacji), count(idzamowienia)
from zamowienia
group by 1;
```
* liczby zamówień na poszczególne miesiące,
```sql
select count(idzamowienia), date_part('month', datarealizacji)
from zamowienia
group by 2
order by 1;
```
* ★ liczby zamówień do realizacji w poszczególnych tygodniach,
```sql
select count(idzamowienia), date_part('week', datarealizacji)
from zamowienia
group by 2
order by 1 desc;
```
* ★ liczby zamówień do realizacji w poszczególnych miejscowościach.
```sql

```

Uwaga: Upewnij się, że zapytania zwracają sensowne dane, np. liczba zamówień w styczniu niezależnie od roku jest bezsensowna.

## Zadanie 6

Napisz zapytanie w języku SQL wyświetlające informacje na temat:

* łącznej masy wszystkich pudełek czekoladek znajdujących się w cukierni,
```sql
select sum(p.stan * z.sztuk * c.masa)
from pudelka p
join zawartosc z using(idpudelka)
join czekoladki c using(idczekoladki);
```
* ★ łącznej wartości wszystkich pudełek czekoladek znajdujących się w cukierni.
```sql

```

## Zadanie 7 

Zakładając, że koszt wytworzenia pudełka czekoladek jest równy kosztowi wytworzenia zawartych w nim czekoladek, napisz zapytanie wyznaczające:

* zysk ze sprzedaży jednej sztuki poszczególnych pudełek (różnica między ceną pudełka i kosztem jego wytworzenia),
```sql
select p.idpudelka, p.nazwa, sum(p.cena - (c.koszt * z.sztuk))
from pudelka p
join zawartosc z using(idpudelka)
join czekoladki c using(idczekoladki)
group by 1
order by 3 desc;
```
* zysk ze sprzedaży zamówionych pudełek,
```sql
select sum(a.sztuk * zyski.zysk)
from zamowienia z
join artykuly a using (idzamowienia)
join (
    select p.idpudelka, p.nazwa, sum(p.cena - (c.koszt * z.sztuk)) as zysk
    from pudelka p
    join zawartosc z using(idpudelka)
    join czekoladki c using(idczekoladki)
    group by 1
    order by 3 desc
) zyski using (idpudelka);
```
* ★ zysk ze sprzedaży wszystkich pudełek czekoladek w cukierni.
```sql

```

## Zadanie 8 

Napisz zapytanie wyświetlające: 
liczbę porządkową i identyfikator pudełka czekoladek (idpudelka). 
```sql
select row_number() over (order by p.idpudelka), p.idpudelka
from pudelka p;
```

Identyfikatory pudełek mają być posortowane alfabetycznie, rosnąco. Liczba porządkowa jest z przedziału 1..N, gdzie N jest ilością pudełek.

Uwaga: Można zastosować samozłączenie.