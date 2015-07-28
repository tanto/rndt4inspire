/*select SUBSTR(identifier, -1,LENGTH(identifier)-3) FROM records LIMIT 100;*/
/*SELECT SUBSTR(identifier, 1, 5) AS sigla, COUNT(SUBSTR(identifier, 1, 5)) AS numero_elementi FROM records GROUP BY sigla ORDER BY sigla ASC;*/
/*SELECT INSTR(identifier, ':') FROM records;*/
SELECT SUBSTR(identifier, 1, INSTR(identifier, ':')-1) AS sigla, COUNT(SUBSTR(identifier, 1, 5)) AS numero_elementi FROM records GROUP BY sigla ORDER BY sigla ASC; 

CREATE TABLE tmp_identifier_decodifica AS SELECT SUBSTR(identifier, 1, INSTR(identifier, ':')-1) AS sigla, COUNT(SUBSTR(identifier, 1, 5)) AS numero_elementi FROM records_clean GROUP BY sigla ORDER BY sigla ASC; 