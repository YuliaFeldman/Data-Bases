/* Return all pairs of pid, did, so that a patient with ID pid was never treated by
   a doctor with ID did */

SELECT DISTINCT pid, did
FROM Doctor, Patient
EXCEPT
SELECT DISTINCT pid, did
FROM Visit
ORDER BY pid, did ASC;