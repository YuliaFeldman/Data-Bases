/* Return names of all pediatricians who treated all male patients with BMI over 30 */

SELECT DISTINCT D.dname
    FROM Doctor D
    WHERE specialty = 'pediatrician' AND
          NOT EXISTS(SELECT *
                     FROM Patient P
                     WHERE P.gender = 'M' AND P.bmi > 30 AND P.pid NOT IN (SELECT V.pid
                                                                           FROM Visit V
                                                                           WHERE V.did = D.did))
    ORDER BY D.dname ASC;
