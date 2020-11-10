/* Return ID numbers of patients who visited a doctor in '1111-11-11' */

SELECT DISTINCT pid
    FROM Visit
    WHERE vdate = '1111-11-11'
    ORDER BY pid ASC;

