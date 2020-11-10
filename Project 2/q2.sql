/* Return names of patients who where treated for free (fee = 0) by a doctor named 'Avi Cohen' */

SELECT DISTINCT pname
    FROM Visit NATURAL JOIN Patient NATURAL JOIN Doctor
    WHERE fee = 0 AND dname = 'Avi Cohen'
    ORDER BY pname ASC;
