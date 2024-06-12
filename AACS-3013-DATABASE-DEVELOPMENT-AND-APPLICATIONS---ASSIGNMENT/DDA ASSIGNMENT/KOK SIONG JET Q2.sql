ACCEPT hall_id_prompt PROMPT 'Enter Hall ID: '

SET LINESIZE 200
SET PAGESIZE 100
COLUMN "CINEMA" FORMAT A20
COLUMN "LOCATION" FORMAT A30
COLUMN "ID" FORMAT A18
COLUMN "HALL_INFO" FORMAT A20
COLUMN "RESERVATION" FORMAT 999

TTITLE LEFT 'RESERVATION WITH THE MOST CANCELLATIONS' SKIP 2

SELECT 
    c.name AS "CINEMA",
    c.location AS "LOCATION",
    h.hall_Id AS "ID",
    h.hall_info AS "HALL_INFO",
    r.reservation_Id AS "RESERVATION",
    COUNT(ca.cancel_Id) AS "CANCELLATION"
FROM 
    Cinema c
JOIN 
    Hall h ON c.cinema_Id = h.cinema_Id
JOIN 
    Reservation r ON h.hall_Id = r.hall_Id
LEFT JOIN 
    Cancellation ca ON r.reservation_Id = ca.reservation_Id
WHERE 
    h.hall_Id = '&hall_id_prompt'
GROUP BY 
    c.name, c.location, h.hall_Id, h.hall_info, r.reservation_Id
ORDER BY 
    COUNT(ca.cancel_Id) DESC;


CLEAR COLUMN
CLEAR BREAKS
TTITLE OFF