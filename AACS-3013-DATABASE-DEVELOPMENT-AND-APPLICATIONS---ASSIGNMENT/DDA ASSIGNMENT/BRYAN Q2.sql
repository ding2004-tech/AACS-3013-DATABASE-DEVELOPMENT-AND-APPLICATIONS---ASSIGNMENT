SET LINESIZE 180
SET PAGESIZE 100

PROMPT Enter CUSTOMER ID to search (use % for wildcard):
ACCEPT search_input CHAR PROMPT 'Enter search term: '

COLUMN name         FORMAT 'A20' HEADING "Customer Name"
COLUMN ticket_id    FORMAT 'A12' HEADING "Ticket"
COLUMN booking_id   FORMAT 'A12' HEADING "Booking"
COLUMN description  FORMAT 'A30' HEADING "Food"

TTITLE LEFT 'FOOD ORDER LIST FOR CUSTOMER '&search_input'' SKIP 1 'Page No: ' FORMAT 999 SQL.PNO SKIP 2
PROMPT
PROMPT

SELECT
    CASE 
        WHEN ROWNUM = 1 THEN C.name 
        ELSE ''
    END AS name,
    BK.booking_Id AS booking_id,
    T.ticket_Id AS ticket_id,
    F.description AS description
FROM 
    customer C 
JOIN
    Booking BK ON C.cust_Id = BK.cust_Id
JOIN
    Ticket T ON BK.booking_Id = T.booking_Id
JOIN
    FoodBundle F ON T.ticket_Id = F.ticket_Id
WHERE 
    C.cust_Id LIKE '%' || UPPER('&search_input') || '%';
CLEAR COLUMN
CLEAR BREAKS
TTITLE OFF
