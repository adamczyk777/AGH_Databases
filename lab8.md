# Labratorium 8

## Tematyka zajęć
Normalizacja

Uwaga: Poniższy zestaw zadań przeznaczony jest na jeden półtoragodzinny blok zajęć oraz pracę samodzielną poza zajęciami laboratoryjnymi. Zadania lub punkty oznaczone symbolem ★ przeznaczone są do realizacji samodzielnej. Podczas zajęć laboratoryjnych należy w pierwszej kolejności realizować pozostałe obowiązkowe podpunkty.

## Zadanie 8.1
Dana jest relacja R o schemacie H = {P,O,E,B,K}:

Pracownik,
Oddział,
Email (pracownik może mieć wiele adresów email, po jednym dla każdego z oddziałów firmy),
Biurko (oznaczenie),
Komputer (oznaczenie)
oraz zbiór zależności funkcyjnych F = {{P,O} → E, {P,E} → O, {P,O} → B, B → K}

Wyznacz wszystkie klucze relacji R.
Wyznacz co najmniej 5 nietrywialnych i prostych zależności funkcyjnych należących do F+, ale nie należących do F.
Sprawdź czy F jest minimalny.
Zadanie 8.2
Dana jest relacja R o schemacie H = {P,E,O,B,K} (patrz zadanie 8.1) oraz zbiór zależności funkcyjnych F = {{P,O} → E, {P,E} → O, {P,O} → B, B → K}

Które z poniższych zależności należą do zbioru F+?

P → E
{P,K} → B
{P,E} → B
★ {P,E,O} → K
★ B → O
★ {P,E} → {K,B}
Zadanie 8.3
Wyznacz minimalny zbiór zależności funkcyjnych dla poniższych zbiorów.

F = { C → {A,B}, E → {A,D}, C → D, E → B }.
F = { A → B, A → C, {A,B} → D, {A,C} → {B,D} }.
★ F = { A → B, B → C, A → C, C → A, C → B, B → A }.

## Zadanie 8.4
Dana jest relacja R o schemacie H = {A,C,G,N,S,R,T}

Aktor,
Czas trwania filmu,
Gaża,
Nagroda (dla Aktora, rozważane są tylko Oscary),
Studio filmowe,
Rok produkcji,
Tytuł filmu.
oraz zbiór zależności funkcyjnych F = {{S,T} → R, {R,T} → C, {R,T} → S, {A,T} → G, {A,T} → N, {N,R,T} → A}.

Która z poniższych dekompozycji jest dekompozycją bezstratną?

H1 = {A,G,N,R,T}, H2 = {C,R,S,T}
H1 = {A,G,N,T}, H2 = {C,R,S,T}
★ H1 = {A,G,N,S,T}, H2 = {C,R,S,T}
H1 = {A,G,S,T}, H2 = {A,N,R,T}, H3 = {C,S,R,T}
★ H1 = {A,G,T}, H2 = {A,N,T}, H3 = {C,S,R,T}
★ H1 = {A,G,S,T}, H2 = {A,N,T}, H3 = {C,S,R,T}

## Zadanie 8.5
Dana jest relacja R o schemacie H = {M,P,S,T}

Moduł zajęć,
Prowadzący,
Sala,
Termin egzaminu
oraz zbiór zależności funkcyjnych F = {{S,T} → M, M → P, P → S}.

Która z poniższych dekompozycji zachowuje wszystkie zależności funkcyjne?

H1 = {M,S,T}, H2 = {M,P,S}
H1 = {M,S,T}, H2 = {P,S}
★ H1 = {M,P,S}, H2 = {S,T}

## Zadanie 8.6
Dana jest relacja R o schemacie H = {M,P,S,T} (patrz zadanie 8.5) oraz zbiór zależności funkcyjnych F = {{S,T} → M, M → P, P → S}. Zakładając, że R jest w 1NF, wyznacz w jakiej maksymalnej postaci normalnej jest relacja R.

## ★ Zadanie 8.7
Dana jest relacja R o schemacie H = {G,P,T,W}

Gabinet,
Prowadzący,
Termin konsultacji,
Wymagane umówienie się (tak/nie).
oraz zbiór zależności funkcyjnych F = {{P,T} → G, P → W, {G,T} → P }. Zakładając, że R jest w 1NF, wyznacz w jakiej maksymalnej postaci normalnej jest relacja R.

## Zadanie 8.8
Dana jest relacja R o schemacie H = {C,N,O,P}

Cena,
Napój,
Opakowanie (pojemność),
Producent,
oraz zbiór zależności funkcyjnych F = {N → P, {N,O} → C }.

Zakładając, że R jest w 1NF, wyznacz w jakiej maksymalnej postaci normalnej jest relacja R.
Sprowadź relację do 3NF.
Czy wszystkie relacje w wyniku dekompozycji są w BCNF?

## Zadanie 8.9
Sprowadź relację z zadania 8.6 do BCNF. Czy istnieje dekompozycja, która zachowuje zależności funkcyjne?

## ★ Zadanie 8.10
Dana jest relacja R o schemacie H = {A,B,C,D} oraz zbiór zależności funkcyjnych F = { {A,B} → C, {A,C} → D }. Sprowadź relację do 3NF.

★ Zadanie 8.11
Dana jest relacja R o schemacie H = {A,B,C,D,E} oraz zbiór zależności funkcyjnych F = { {A,B} → C, {A,D} → E, C → D, E → B }.

Wyznacz wszystkie klucze relacji R.
Wyznacz co najmniej 5 nietrywialnych i prostych zależności funkcyjnych należących do F+.
★ Zadanie 8.12
Dana jest relacja R o schemacie H = {A,B,C,D,E,F} oraz zbiór zależności funkcyjnych F = { {A,B} → {C,E}, {A,D} → E, E → D, E → {B,C}, A → F }.

Która z poniższych dekompozycji jest dekompozycją bezstratną?

H1 = {A,B,C,D}, H2 = {D,E,F}
H1 = {A,B,E}, H2 = {C,D,E,F}
H1 = {A,B,E,F}, H2 = {C,D,E}
H1 = {A,E}, H2 = {B,E,F}, H3 = {C,D,E}
H1 = {A,E}, H2 = {B,E,F}, H3 = {A,C,D,F}
H1 = {A,B,C,E}, H2 = {A,B,D}, H3 = {A,F}

## ★ Zadanie 8.13
Dana jest relacja R o schemacie H = {A,B,C,D} oraz zbiór zależności funkcyjnych F = { {A,B} → C, A → D, {C,D} → B }. Zakładając, że R jest w 1NF, wyznacz w jakiej maksymalnej postaci normalnej jest relacja R.

## ★ Zadanie 8.14
Dana jest relacja R o schemacie H = {A,B,C,D} oraz zbiór zależności funkcyjnych F = { {A,B} → C, {A,D} → C }. Zakładając, że R jest w 1NF, wyznacz w jakiej maksymalnej postaci normalnej jest relacja R.