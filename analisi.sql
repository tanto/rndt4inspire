/*select SUBSTR(identifier, -1,LENGTH(identifier)-3) FROM records LIMIT 100;*/
/*SELECT SUBSTR(identifier, 1, 5) AS sigla, COUNT(SUBSTR(identifier, 1, 5)) AS numero_elementi FROM records GROUP BY sigla ORDER BY sigla ASC;*/
/*SELECT INSTR(identifier, ':') FROM records;*/
SELECT SUBSTR(identifier, 1, INSTR(identifier, ':')-1) AS sigla, COUNT(SUBSTR(identifier, 1, 5)) AS numero_elementi FROM records GROUP BY sigla ORDER BY sigla ASC; 

CREATE TABLE tmp_identifier_decodifica AS SELECT SUBSTR(identifier, 1, INSTR(identifier, ':')-1) AS sigla, COUNT(SUBSTR(identifier, 1, 5)) AS numero_elementi FROM records_clean GROUP BY sigla ORDER BY sigla ASC; 

/*CREATE TABLE tmp_8 AS SELECT a.id AS id, a.id_d AS id_d, a.data AS data, a.day AS day, b.dIns AS dIns, b.carb AS carb, b.prezzo AS prezzo FROM tmp_2 AS a LEFT JOIN tmp_7 AS b USING (id_d, day);*/
SELECT tmp_identifier_decodifica.sigla AS sigla_all, tmp_normalizza_2.sigla AS sigla_decode FROM tmp_identifier_decodifica LEFT JOIN tmp_normalizza_2 USING (sigla) WHERE sigla_decode IS NULL; 