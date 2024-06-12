ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY';
SET LINESIZE 100
SET PAGESIZE 40
TTITLE OFF
COLUMN "CUSTOMER NAME" FORMAT A30
COLUMN "RESERVATION ID" FORMAT A15
COLUMN "PAYMENT ID" FORMAT A20
COLUMN "TIME" FORMAT A20
COLUMN "TOTAL" FORMAT $9999.99

PROMPT 'CHECK THE LONG-STANDING RESERVATION AND PAYMENT DETAILS'
PROMPT

ACCEPT v_name CHAR FORMAT A30 PROMPT 'ENTER THE CUSTOMER NAME:'

TTITLE CENTER 'CUSTOMER (&v_name) RESERVATION AND PAYMENT DETAILS' 
PROMPT
PROMPT
PROMPT

SELECT c.name AS "CUSTOMER NAME",
       r.reservation_Id AS "RESERVATION ID",
       p.payment_Id AS "PAYMENT ID",
       TO_CHAR(p.payment_time, 'DD/MM/YYYY HH:MI AM') AS "TIME",
       TO_CHAR(p.total_amount, '$9999.99') AS "TOTAL"
FROM Customer c
JOIN Reservation r ON c.cust_Id = r.cust_Id
JOIN Payment p ON r.reservation_Id = p.reservation_Id
WHERE 
    c.name = '&v_name'
ORDER BY r.reservation_Id , p.payment_time, p.total_amount;

COLUMN "CUSTOMER NAME" CLEAR
COLUMN "RESERVATION ID" CLEAR
COLUMN "PAYMENT ID" CLEAR
COLUMN "TIME" CLEAR
COLUMN "TOTAL" CLEAR

TTITLE OFF

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-RR';
SET linesize 80
SET pagesize 14
