# Laboratorium 6 - Manipulowanie danymi, instrukcje INSERT, UPDATE, DELETE.

## Zadanie 1
baza danych: cukiernia

* Napisz i wykonaj zapytanie (użyj INSERT), które dodaje do tabeli czekoladki następujące informacje:
```
idczekoladki: W98,
nazwa: Biały kieł,
czekolada: biała,
orzechy: laskowe,
nadzienie: marcepan,
opis: Rozpływające się w rękach i kieszeniach,
koszt: 45 gr,
masa: 20 g.
```
```sql
insert into czekoladki VALUES (
    'W98',
    'Biały kieł',
    'biała',
    'laskowe',
    'marcepan',
    'Rozpływające się w rękach i kieszeniach',
    0.45,
    20
)
```

* Napisz i wykonaj trzy zapytania (użyj INSERT), które dodadzą do tabeli klienci następujące dane osobowe:
```
idklienta: 90,
nazwa: Matusiak Edward, 
ulica: Kropiwnickiego 6/3,
miejscowosc: Leningrad,
kod: 31-471,
telefon: 031 423 45 38,

idklienta: 91,
nazwa: Matusiak Alina,
ulica: Kropiwnickiego 6/3,
miejscowosc: Leningrad,
kod: 31-471,
telefon: 031 423 45 38,

idklienta: 92,
nazwa: Kimono Franek,
ulica: Karateków 8,
miejscowosc: Mistrz,
kod: 30-029,
telefon: 501 498 324.
```
```sql
insert into klienci values('90', 'Matusiak Edward', 'Kropiwnickiego 6/3', 'Leningrad', '31-471', '031 423 45 38');
```

* Dodaj do tabeli klienci dane Izy Matusiak (idklienta 93). Pozostałe dane osobowe Izy Matusiak muszą być takie same jak dla Pana Edwarda Matusiaka. Użyj podzapytań.
```sql
insert into klienci (select 94, 'Matusiak Iza', ulica, miejscowosc, kod, telefon from cukiernia.klienci where idklienta=90);

```

**Sprawdź, czy napisane przez Ciebie zapytania odniosły pożądany skutek tj. czy do w/w tabel zostały dodane odpowiednie wiersze, wykorzystaj SELECT.**

## Zadanie 2
baza danych: cukiernia

* Napisz i wykonaj zapytanie, które doda do tabeli czekoladki następujące pozycje, wykorzystaj wartości NULL w poleceniu INSERT:
```
IDCzekoladki: X91,
Nazwa: Nieznana Nieznajoma,
Opis: Niewidzialna czekoladka wspomagajaca odchudzanie.,
Koszt: 26 gr,
Masa: 0g,

IDCzekoladki: M98,
Nazwa: Mleczny Raj,
Czekolada: Mleczna,
Opis: Aksamitna mleczna czekolada w ksztalcie butelki z mlekiem.,
Koszt: 26 gr,
Masa: 36 g,
```
```sql
insert into czekoladki values(
    'X91',
    'Nieznana Nieznajoma',
    null,
    null,
    null,
    'Niewidzialna czekoladka wspomagajaca odchudzanie.',
    0.26,
    0
);

insert into czekoladki values(
    'M98',
    'Mlezcny Raj',
    'mleczna',
    null,
    null,
    'NAksamitna mleczna czekolada w ksztalcie butelki z mlekiem.',
    0.26,
    36
);
```
Sprawdź, czy napisane przez Ciebie zapytania odniosły pożądany skutek tj. czy do w/w tabel zostały dodane odpowiednie wiersze, wykorzystaj SELECT.
## Zadanie 3
baza danych: cukiernia

1. Napisz zapytanie, które usunie informacje dodane w Zadaniu 6.2, użyj DELETE.
```sql
delete from czekoladki where idczekoladki in ('M98', 'X91');
```

2. Sprawdź, czy odpowiednie rekordy zostały usunięte.
```sql
select * from czekoladki where idczekoladki in ('M98', 'X91');
```
3. Napisz i wykonaj zapytanie, które doda do tabeli czekoladki następujące pozycje, wykorzystaj nazwy kolumn w poleceniu INSERT:
```
IDCzekoladki: X91,
Nazwa: Nieznana Nieznajoma,
Opis: Niewidzialna czekoladka wspomagajaca odchudzanie.,
Koszt: 26 gr,
Masa: 0g,

IDCzekoladki: M98,
Nazwa: Mleczny Raj,
Czekolada: Mleczna,
Opis: Aksamitna mleczna czekolada w ksztalcie butelki z mlekiem.,
Koszt: 26 gr,
Masa: 36g,
```
```sql
insert into czekoladki(idczekoladki, nazwa, opis, koszt, masa) values(
    'X91',
    'Nieznana Nieznajoma',
    'Niewidzialna czekoladka wspomagajaca odchudzanie.',
    0.26,
    0
);

insert into czekoladki(idczekoladki, nazwa, czekolada, opis, koszt, masa) values (
    'M98',
    'Mlezcny Raj',
    'mleczna',
    'NAksamitna mleczna czekolada w ksztalcie butelki z mlekiem.',
    0.26,
    36
);
```

Sprawdź, czy napisane przez Ciebie zapytania odniosły pożądany skutek tj. czy do w/w tabel zostały dodane odpowiednie wiersze, wykorzystaj SELECT.
## Zadanie 4
baza danych: cukiernia

Napisz instrukcje aktualizujące dane w bazie cukiernia. Sprawdź za pomocą instrukcji SELECT, czy odpowiednie rekordy zostały zmienione.

* Zmiana nazwiska Izy Matusiak na Nowak.
```sql
update klienci set nazwa='Nowak Iza' where idklienta=94;
```
* Obniżenie kosztu czekoladek o identyfikatorach (idczekoladki): W98, M98 i X91, o 10%.
```sql
update czekoladki set koszt=(koszt*0.9) where idczekoladki in ('W98', 'M98', 'X91');
```
* Ustalenie kosztu czekoladek o nazwie Nieznana Nieznajoma na taką samą jak cena czekoladki o identyfikatorze W98.
```sql
update czekoladki
set koszt=(select koszt from czekoladki where idczekoladki='W98')
where nazwa='Nieznana Nieznajoma';
```
* ★ Zmiana nazwy z Leningrad na Piotrograd w tabeli klienci.
```sql
```
* ★ Podniesienie kosztu czekoladek, których dwa ostatnie znaki identyfikatora (idczekoladki) są większe od 90, o 15 groszy.
```sql
```
## Zadanie 5
baza danych: cukiernia

Napisz instrukcje usuwające z bazy danych informacje o:

* klientach o nazwisku Matusiak,
```sql
delete from klienci where nazwa similar to '%Matusiak%';
```
* ★ klientach o identyfikatorze większym niż 91,
```sql
```
* ★ czekoladkach, których koszt jest większy lub równy 0.45 lub masa jest większa lub równa 36, lub masa jest równa 0.
```sql
```
## Zadanie 6
baza danych: cukiernia

Napisz skrypt zawierający instrukcje INSERT wstawiające do bazy danych Cukiernia dwa nowe rekordy do tabeli Pudelka oraz odpowiednie rekordy związane z tymi pudełkami do tabeli Zawartosc. Każde z nowych pudełek ma zawierać łącznie co najmniej 10 czekoladek, w co najmniej 4 różnych smakach.
```sql
```

## Zadanie 7
baza danych: cukiernia, oprogramowanie: psql

★ Polecenie COPY pozwala m.in. kopiowanie danych między bazą danych i standardowym systemem plików. Polecenie COPY FROM kopiuje dane z pliku do wskazanej tabeli. Domyślnie wartości atrybutów są oddzielane tabulatorem, zaś NULL jest oznaczany symbolem \N. Polecenie COPY TO kopiuje dane z bazy danych (cała tabela, wybrane kolumny lub wynik instrukcji SELECT) do pliku. Opcje polecenia pozwalają zdefiniować m.in. separator, oznaczenia wartości null, oznaczenie napisu pustego itp. http://www.postgresql.org/docs/9.1/static/sql-copy.html
```sql
```

★ Napisz skrypt zawierający instrukcje COPY wstawiające do bazy danych cukiernia dwa nowe rekordy do tabeli pudelka oraz odpowiednie rekordy związane z tymi pudełkami do tabeli zawartosc. Każde z nowych pudełek ma zawierać łącznie co najmniej 10 czekoladek, w co najmniej 4 różnych smakach.
```sql
```

## Zadanie 8
baza danych: cukiernia

* Napisz instrukcję UDPATE, która dla pudełek dodanych w poprzednich dwóch zadaniach, zwiększa o 1 liczbę czekoladek każdego smaku, które w nich występują.
```sql

```
* Napisz skrypt zawierający instrukcje UPDATE, które modyfikują tabelę czekoladki zastępując w kolumnach: czekolada, orzechy i nadzienie wartości Null wartością “brak”.
```sql
update czekoladki set czekolada='brak' where czekolada is null;
update czekoladki set orzechy='brak' where orzechy is null;
update czekoladki set nadzienie='brak' where nadzienie is null;
```
* ★ Napisz skrypt zawierający instrukcje UPDATE, które anulują zmiany wprowadzone w poprzednim punkcie.
```sql
```