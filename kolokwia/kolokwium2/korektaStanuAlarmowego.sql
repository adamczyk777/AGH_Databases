-- która zmienia aktualną wartość pola stan_alarmowy podanego punktu na wartość będącą  
-- srednią wszystkich stanów alarmowych  punktów pomiarowych znajduj ˛acych si˛e 
-- na terenie tej samej gminy w której lezy modyfikowany punkt pomiarowy.
--  Ostrzeżenia nie muszą być aktualizowane, poniewaz są wpisami archiwalnymi. 

CREATE OR REPLACE FUNCTION korektaStanuAlarmowego(id integer) returns void
AS
$$
DECLARE
    averageStan numeric(7,2);
    idGminy integer;
BEGIN
    SELECT DISTINCT id_gminy INTO idGminy FROM punkty_pomiarowe WHERE id_punktu = id;
    
    SELECT AVG(stan_alarmowy) 
    INTO averageStan 
    FROM punkty_pomiarowe
    WHERE id_gminy = idGminy;

    UPDATE punkty_pomiarowe
    SET stan_alarmowy = averageStan
    WHERE id_gminy = idGminy;
END;
$$
LANGUAGE plpgsql;
