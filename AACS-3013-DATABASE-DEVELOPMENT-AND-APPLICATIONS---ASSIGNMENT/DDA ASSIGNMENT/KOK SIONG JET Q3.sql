SET SERVEROUTPUT ON
SET LINESIZE 180
SET PAGESIZE 100

PROMPT Enter booking ID to search:
ACCEPT booking_id_prompt CHAR PROMPT 'Enter Booking ID: '

COLUMN "BOOKING_DATE" FORMAT A30 HEADING "Booking Date"
COLUMN "TOTAL_AMOUNT" FORMAT $999,999.99 HEADING "Total Amount"
COLUMN "SEAT_ID" FORMAT A10 HEADING "Seat ID"
COLUMN "STATUS" FORMAT A15 HEADING "Status"
COLUMN "TYPE" FORMAT A15 HEADING "Type"

TTITLE LEFT 'BOOKED SEATS AND BOOKING DETAILS FOR BOOKING ID: &booking_id_prompt' SKIP 2

SELECT 
    b.booking_date AS "BOOKING_DATE",
    b.total_amount AS "TOTAL_AMOUNT",
    s.seat_Id AS "SEAT_ID",
    s.status AS "STATUS",
    s.type AS "TYPE"
FROM 
    Booking b
JOIN 
    Ticket t ON b.booking_Id = t.booking_Id
JOIN 
    Seat s ON t.ticket_Id = s.ticket_Id
WHERE 
    b.booking_Id = '&booking_id_prompt';

CLEAR COLUMN
CLEAR BREAKS
TTITLE OFF
