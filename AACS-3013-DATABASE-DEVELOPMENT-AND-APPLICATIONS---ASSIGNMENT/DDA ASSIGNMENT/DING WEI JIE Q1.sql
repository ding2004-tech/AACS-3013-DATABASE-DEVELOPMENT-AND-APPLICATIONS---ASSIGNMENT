ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY';
SET linesize 100
SET pagesize 40

COLUMN r.reserve_hour FORMAT 09
COLUMN r.hall_Id FORMAT A15  
COLUMN r.reservation_Id FORMAT A10

TTITLE OFF

PROMPT 'CHECK HALL HAS BEEN RESERVED FOR SPECIFY MONTH AND PROCEED TO RESERVE THE DESIRED HOUR'
PROMPT
PROMPT
ACCEPT v_startdate DATE FORMAT 'DD-MON-YYYY' PROMPT 'ENTER THE START DATE (DD-MON-YYYY):'
ACCEPT v_enddate DATE FORMAT 'DD-MON-YYYY' PROMPT 'ENTER THE END DATE (DD-MON-YYYY):'

TITLE LEFT 'TOTAL HALL RESERVATION  BY  THE  MONTH FROM &v_startdate TO &v_enddate ' RIGHT 'Page No: ' FORMAT 999 SQL.PNO SKIP 2

SELECT r.hall_Id AS "HALL",
       COUNT(r.reservation_Id) AS "TOTAL RESERVATION",
       LPAD(SUM(r.reserve_hour), 2, '0') || ' HOUR' AS "TOTAL RESERVE"
FROM Reservation r
JOIN Payment p ON r.reservation_Id = p.reservation_Id
JOIN Customer c ON r.cust_Id = c.cust_Id
WHERE p.payment_time BETWEEN TO_DATE('&v_startdate', 'DD-MON-YYYY') AND TO_DATE('&v_enddate', 'DD-MON-YYYY')
GROUP BY r.hall_Id
ORDER BY r.hall_Id;


TTITLE OFF

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-RR';
SET linesize 80
SET pagesize 14

COLUMN r.reserve_hour  CLEAR
COLUMN r.hall_Id  CLEAR
COLUMN r.reservation_Id CLEAR
