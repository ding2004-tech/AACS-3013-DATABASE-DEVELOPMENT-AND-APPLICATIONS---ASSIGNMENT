SET linesize 250
SET PAGESIZE 40

COLUMN "Customer Name" FORMAT A20 HEADING "Customer Name"
COLUMN "Customer Email" FORMAT A30 HEADING "Customer Email"
COLUMN "Booking ID" FORMAT A10 HEADING "Booking ID"
COLUMN "Booking Date" FORMAT A19 HEADING "Booking Date"
COLUMN "Total Amount" FORMAT $9999.99 HEADING "Total Amount"
COLUMN "Ticket ID" FORMAT A6 HEADING "Ticket ID"
COLUMN "Price" FORMAT $99.99 HEADING "Price"
COLUMN "Seat ID" FORMAT A6 HEADING "Seat"
COLUMN "Seat Status" FORMAT A15 HEADING "Seat Status"
COLUMN "Seat Type" FORMAT A15 HEADING "Seat Type"

ACCEPT v_name CHAR PROMPT 'Enter Customer Name: '

TTITLE OFF

TTITLE LEFT "                           Customer Booking Details" SKIP 2

SELECT
    c.name AS "Customer Name",
    c.email AS "Customer Email",
    b.booking_Id AS "Booking ID",
    TO_CHAR(b.booking_date, 'DD-MON-YY HH:MI AM') AS "Booking Date",
    TO_CHAR(b.total_amount, '$999999.99') AS "Total Amount",
    t.ticket_Id AS "Ticket ID",
    TO_CHAR(t.price, '$999999.99') AS "Price",
    s.seat_Id AS "Seat ID",
    s.status AS "Seat Status",
    s.type AS "Seat Type"
FROM
    Customer c
JOIN
    Booking b ON c.cust_Id = b.cust_Id
JOIN
    Ticket t ON b.booking_Id = t.booking_Id
JOIN
    Seat s ON t.ticket_Id = s.ticket_Id
WHERE
    c.name LIKE '%' || '&v_name' || '%'
ORDER BY
    b.booking_date DESC;


TTITLE OFF

COLUMN "Customer Name" CLEAR
COLUMN "Customer Email" CLEAR
COLUMN "Booking ID" CLEAR
COLUMN "Booking Date" CLEAR
COLUMN "Total Amount" CLEAR
COLUMN "Ticket ID" CLEAR
COLUMN "Price" CLEAR
COLUMN "Seat ID" CLEAR
COLUMN "Seat Status" CLEAR
COLUMN "Seat Type" CLEAR

SET linesize 80
SET pagesize 14
