--Duplicate rows
SELECT ID, COUNT(ID)
FROM USERS
GROUP BY ID
HAVING COUNT(ID)>1;

--Barcode is assigned to multiple brands
SELECT BARCODE, count(BARCODE)
FROM BRANDS
GROUP BY BARCODE
HAVING count(BARCODE)>1;

SELECT *
FROM BRANDS
WHERE BARCODE = '"511111004790"';

--Multiple barcode, category, categorycode & cpg id for same brand
SELECT *
FROM BRANDS
WHERE NAME IN ('"Health Magazine"', '"Caleb''s Kola"');