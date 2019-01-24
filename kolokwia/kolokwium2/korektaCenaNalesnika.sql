
CREATE OR REPLACE FUNCTION korektaCenaNalesnika(idNalesnika integer) RETURNS void
AS $$
DECLARE
    zamowieniaWszystkich integer;
    zamowieniaDlaPodanego integer;
    sredniaWszystkich numeric(7,2);
BEGIN
    SELECT COUNT(id_zamowienia) INTO zamowieniaWszystkich FROM zamowienia;
    
    SELECT COUNT(id_zamowienia) INTO zamowieniaDlaPodanego 
    FROM zamowienia 
    NATURAL JOIN kompozycje k
    JOIN bazowe_nalesniki bn ON k.id_bazowego_nalesnika=bn.id_nalesnika
    WHERE bn.id_nalesnika=idNalesnika;

    SELECT zamowieniaWszystkich/(SELECT COUNT(id_nalesnika) FROM bazowe_nalesniki) INTO sredniaWszystkich;

    IF zamowieniaDlaPodanego > sredniaWszystkich THEN
        UPDATE bazowe_nalesniki 
        SET koszt = koszt * 1.05
        WHERE id_nalesnika=idNalesnika;
    ELSIF zamowieniaDlaPodanego < sredniaWszystkich THEN
        UPDATE bazowe_nalesniki 
        SET koszt = koszt * 0.95
        WHERE id_nalesnika=idNalesnika;
    END IF;
END;
$$
LANGUAGE plpgsql;
