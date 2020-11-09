/* Return ID numbers and names of all patients who where treated by a pediatrician and
   by an orthopedist */

SELECT DISTINCT pid, pname
FROM Visit NATURAL JOIN Patient NATURAL JOIN Doctor
WHERE specialty = 'pediatrician'
INTERSECT
SELECT DISTINCT pid, pname
FROM Visit NATURAL JOIN Patient NATURAL JOIN Doctor
WHERE specialty = 'orthopedist'
ORDER BY pid, pname ASC;

