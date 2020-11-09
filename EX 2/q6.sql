/* Return ID numbers of all doctors who treated exactly 3 patients with BMI over 30 */

WITH PatientsWithBMI30 AS (SELECT did, pid
                           FROM Visit NATURAL JOIN Patient
                           WHERE bmi > 30)

SELECT DISTINCT P1.did
FROM PatientsWithBMI30 P1, PatientsWithBMI30 P2, PatientsWithBMI30 P3
WHERE P1.did = P2.did AND
      P1.did = P3.did AND
      P1.pid <> P2.pid AND
      P1.pid <> P3.pid AND
      P2.pid <> P3.pid

EXCEPT

SELECT DISTINCT P1.did
FROM PatientsWithBMI30 P1, PatientsWithBMI30 P2, PatientsWithBMI30 P3, PatientsWithBMI30 P4
WHERE P1.did = P2.did AND
      P1.did = P3.did AND
      P1.did = P4.did AND
        P1.pid <> P2.pid AND
        P1.pid <> P3.pid AND
        P2.pid <> P3.pid AND
        P1.pid <> P4.pid AND
        P2.pid <> P4.pid AND
        P3.pid <> P4.pid

ORDER BY did asc;