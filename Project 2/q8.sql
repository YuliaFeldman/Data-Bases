/* REturn ID of doctor who's patients average bmi is highest */
WITH AvgBmi AS (SELECT V.did, AVG(P.bmi)
                FROM Visit V NATURAL JOIN  Patient P
                GROUP BY V.did)

SELECT did
FROM AvgBmi A
WHERE A.AVG = (SELECT MAX(B.AVG)
                FROM AvgBmi B)
ORDER BY did;