ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY';
SET LINESIZE 80
SET PAGESIZE 40

COLUMN "hall_Id" FORMAT A7 HEADING 'HALL'
COLUMN "ID" FORMAT A18

PROMPT CHECK HALL BOOKING AND RESERVATION HISTORY
PROMPT
PROMPT
ACCEPT v_hallId CHAR PROMPT 'ENTER THE HALL ID(H0XX):'

TTITLE OFF

TTITLE LEFT 'HALL (&v_hallId) BOOOKING AND RESERVATION HISTORY'

SELECT hall_Id, REPLACE(LISTAGG(ID, ' ') WITHIN GROUP (ORDER BY ID), CHR(10), ' ') AS ID
FROM (
    SELECT hall_Id, reservation_id || '   ' || TO_CHAR(payment_time, 'YYYY-MM-DD') AS ID
    FROM (
        SELECT h.hall_Id, r.reservation_Id, p.payment_time
        FROM Hall h
        JOIN Reservation r ON h.hall_Id = r.hall_Id
        JOIN Payment p ON r.reservation_Id = p.reservation_Id
    )
    UNION ALL
    SELECT hall_Id, b.booking_Id || ' ' || TO_CHAR(b.datetime, 'DD-MON-YYYY') AS ID
    FROM (
        SELECT h.hall_Id, b.booking_Id, s.datetime
        FROM Booking b
        JOIN Schedule s ON b.schedule_Id = s.schedule_Id
        JOIN Hall h ON s.hall_Id = h.hall_Id
    ) b
)
WHERE hall_Id = '&v_hallId'
GROUP BY hall_Id;

TTITLE OFF

COLUMN "hall_Id" CLEAR
COLUMN "ID" CLEAR


ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-RR';
SET linesize 80
SET pagesize 14
