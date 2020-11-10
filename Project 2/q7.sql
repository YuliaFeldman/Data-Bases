/* For each doctor return it's did, and highest, lowest and average prices paid him */
SELECT V.did, MAX(V.fee), MIN(V.fee), AVG(V.fee)
FROM Visit V
GROUP BY V.did
ORDER BY V.did;