# Laboratorium 11

## Tematyka zajęć
Implementacja funkcji w języku PL/pgSQL.

Uwaga: Poniższy zestaw zadań przeznaczony jest na jeden półtoragodzinny blok zajęć oraz pracę samodzielną poza zajęciami laboratoryjnymi. Zadania lub punkty oznaczone symbolem ★ przeznaczone są do realizacji samodzielnej. Podczas zajęć laboratoryjnych należy w pierwszej kolejności realizować pozostałe obowiązkowe podpunkty.

## Zadanie 1
1. Napisz funkcję masaPudelka wyznaczającą masę pudełka jako sumę masy czekoladek w nim zawartych. Funkcja jako argument przyjmuje identyfikator pudełka. Przetestuj działanie funkcji na podstawie prostej instrukcji select.

```sql
CREATE OR REPLACE FUNCTION masaPudelka(argIdPudelka char(4)) RETURNS integer AS
$$
    DECLARE
    sumaMas integer;
    BEGIN
        SELECT SUM(cz.masa) 
        INTO sumaMas
        FROM pudelka p
        JOIN zawartosc z USING(idpudelka)
        JOIN czekoladki cz USING(idczekoladki)
        WHERE idpudelka=argIdPudelka;

        RETURN sumaMas;
    END;
$$
LANGUAGE plpgsql;
```

2. ★ Napisz funkcję liczbaCzekoladek wyznaczającą liczbę czekoladek znajdujących się w pudełku. Funkcja jako argument przyjmuje identyfikator pudełka. Przetestuj działanie funkcji na podstawie prostej instrukcji select.

```sql

```

## Zadanie 11.2
Napisz funkcję zysk obliczającą zysk jaki cukiernia uzyskuje ze sprzedaży jednego pudełka czekoladek, zakładając, że zysk ten jest różnicą między ceną pudełka, a kosztem wytworzenia zawartych w nim czekoladek i kosztem opakowania (0,90 zł dla każdego pudełka). Funkcja jako argument przyjmuje identyfikator pudełka. Przetestuj działanie funkcji na podstawie prostej instrukcji select.
Napisz instrukcję select obliczającą zysk jaki cukiernia uzyska ze sprzedaży pudełek zamówionych w wybranym dniu.

```sql
CREATE OR REPLACE FUNCTION obliczZysk(argIdPudelka char(4)) RETURNS float8 AS
$$
    DECLARE
        zyskZPudelka numeric(7,2);
        kosztCzeko numeric(7,2);
        kosztPudelka numeric(7,2);
        kosztOpakowania numeric(7,2) := 0.90;
    BEGIN
        SELECT SUM(z.sztuk * cz.koszt)
        INTO kosztCzeko
        FROM pudelka p
        NATURAL JOIN zawartosc z
        JOIN czekoladki cz USING(idczekoladki)
        WHERE p.idpudelka = argIdPudelka;

        SELECT cena INTO kosztPudelka FROM pudelka WHERE idpudelka = argIdPudelka;
        zyskZPudelka := kosztPudelka - (kosztCzeko + kosztOpakowania);

        RETURN zyskZPudelka;
    END;
$$
LANGUAGE plpgsql;
```

## Zadanie 11.3
1. Napisz funkcję sumaZamowien obliczającą łączną wartość zamówień złożonych przez klienta, które czekają na realizację (są w tabeli Zamowienia). Funkcja jako argument przyjmuje identyfikator klienta. Przetestuj działanie funkcji.

```sql
CREATE OR REPLACE FUNCTION sumaZamowien(identyfikatorKlienta integer) RETURNS numeric(7,2) AS
$$
DECLARE
    sumaZamowien numeric(7,2);
    todayDate date;
BEGIN
    todayDate := '2013-12-10';
    SELECT SUM(a.sztuk*p.cena)
    INTO sumaZamowien
    FROM zamowienia z
    JOIN artykuly a USING(idzamowienia)
    JOIN pudelka p USING(idpudelka)
    WHERE z.idklienta = identyfikatorKlienta and z.datarealizacji > todayDate;

    RETURN sumaZamowien;
END;
$$
LANGUAGE plpgsql;
```

2. Napisz funkcję rabat obliczającą rabat jaki otrzymuje klient składający zamówienie. Funkcja jako argument przyjmuje identyfikator klienta. Rabat wyliczany jest na podstawie wcześniej złożonych zamówień w sposób następujący:
4 % jeśli wartość zamówień jest z przedziału 101-200 zł;
7 % jeśli wartość zamówień jest z przedziału 201-400 zł;
8 % jeśli wartość zamówień jest większa od 400 zł.

```sql
CREATE OR REPLACE FUNCTION rabat(argIdKlienta integer) RETURNS numeric(7,2) AS
$$
DECLARE
    sumaZamowien numeric(7,2);
    rabatkoncowy numeric(7,2);
BEGIN
    SELECT SUM(a.sztuk * p.cena) 
    INTO sumaZamowien
    FROM zamowienia z JOIN artykuly a USING(idzamowienia) JOIN pudelka p USING(idpudelka)
    WHERE z.idklienta=argIdKlienta;

    IF sumaZamowien BETWEEN 101 and 200 THEN
        rabatKoncowy := 0.04;
    ELSIF sumaZamowien BETWEEN 201 and 400 THEN
        rabatKoncowy := 0.07;
    ELSIF sumaZamowien > 400 THEN
        rabatKoncowy := 0.08;
    ELSE
        rabatKoncowy := 0.00;
    END IF;

    RETURN rabatKoncowy;
END;
$$
LANGUAGE plpgsql;
```

## Zadanie 11.4
Napisz bezargumentową funkcję podwyzka, która dokonuje podwyżki kosztów produkcji czekoladek o:

3 gr dla czekoladek, których koszt produkcji jest mniejszy od 20 gr;
4 gr dla czekoladek, których koszt produkcji jest z przedziału 20-29 gr;
5 gr dla pozostałych.
Funkcja powinna ponadto podnieść cenę pudełek o tyle o ile zmienił się koszt produkcji zawartych w nich czekoladek.

Przed testowaniem działania funkcji wykonaj zapytania, które umieszczą w plikach dane na temat kosztów czekoladek i cen pudełek tak, aby można było później sprawdzić poprawność działania funkcji podwyzka. Przetestuj działanie funkcji.

## ★ Zadanie 11.5
Napisz funkcję obnizka odwracająca zmiany wprowadzone w poprzedniej funkcji. Przetestuj działanie funkcji.

## Zadanie 11.6
Napisz funkcję zwracającą informacje o zamówieniach złożonych przez klienta, którego identyfikator podawany jest jako argument wywołania funkcji. W/w informacje muszą zawierać: idzamowienia, idpudelka, datarealizacji. Przetestuj działanie funkcji. Uwaga: Funkcja zwraca więcej niż 1 wiersz!
★ Napisz funkcję zwracającą listę klientów z miejscowości, której nazwa podawana jest jako argument wywołania funkcji. Lista powinna zawierać: nazwę klienta i adres. Przetestuj działanie funkcji.
★ Zadanie 11.7
Napisz funkcję rabat obliczającą rabat jaki otrzymuje klient kwiaciarni składający zamówienie. Funkcję utwórz w schemacie kwiaciarnia. Rabat wyliczany jest na podstawie zamówień bieżących (tabela zamowienia) i z ostatnich siedmiu dni (tabela historia) w sposób następujący:

5 % jeśli wartość zamówień jest większa od 0 lecz nie większa od 100 zł;
10 % jeśli wartość zamówień jest z przedziału 101-400 zł;
15 % jeśli wartość zamówień jest z przedziału 401-700 zł;
20 % jeśli wartość zamówień jest większa od 700 zł.