
DELETE FROM Patient
WHERE Patient.pid NOT IN (SELECT DISTINCT V.pid FROM Visit V);
