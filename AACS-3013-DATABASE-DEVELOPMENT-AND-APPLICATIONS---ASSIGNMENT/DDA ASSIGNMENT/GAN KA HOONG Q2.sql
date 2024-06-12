set linesize 120
SET PAGESIZE 40

COLUMN "Customer ID" FORMAT A12 HEADING "Customer ID"
COLUMN "Customer Name" FORMAT A20 HEADING "Customer Name"
COLUMN "Customer Email" FORMAT A30 HEADING "Customer Email"
COLUMN "Total Bookings" FORMAT 9999 HEADING "Total Booking"
COLUMN "Total Amount Spent" FORMAT $9999.99 HEADING "TOTAL SPEND"

ACCEPT v_name CHAR PROMPT 'Enter Customer Name: '

TTITLE OFF


TTITLE CENTER "Customer Booking Summary" SKIP 2

SELECT 
    c.cust_Id AS "Customer ID",
    c.name AS "Customer Name",
    c.email AS "Customer Email",
    COUNT(DISTINCT b.booking_Id) AS "Total Bookings",
    TO_CHAR(SUM(b.total_amount), '$999999.99') AS "Total Spent"
FROM Customer c
JOIN Booking b ON c.cust_Id = b.cust_Id
JOIN Ticket t ON b.booking_Id = t.booking_Id
WHERE c.name = '&v_name'
GROUP BY c.cust_Id, c.name, c.email
ORDER BY c.name ASC;

TTITLE OFF

COLUMN "Customer ID" CLEAR
COLUMN "Customer Name" CLEAR
COLUMN "Customer Email" CLEAR
COLUMN "Total Bookings" CLEAR
COLUMN "Total Amount Spent" CLEAR

SET linesize 80
SET pagesize 14
