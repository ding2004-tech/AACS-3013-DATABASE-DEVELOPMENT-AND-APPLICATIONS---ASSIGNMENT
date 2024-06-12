ACCEPT hall_id_prompt PROMPT 'Enter Hall ID: '

SET LINESIZE 200
SET PAGESIZE 100
COLUMN "CINEMA" FORMAT A20
COLUMN "LOCATION" FORMAT A30
COLUMN "HALL_ID" FORMAT A8
COLUMN "HALL_INFO" FORMAT A20
COLUMN "RESERVATION" FORMAT 999

TTITLE LEFT 'TOTAL RESERVATION OF EACH CINEMA' SKIP 2

SELECT 
    c.name AS "CINEMA",
    c.location AS "LOCATION",
    h.hall_Id AS "HALL_ID",
    h.hall_info AS "HALL_INFO",
    COUNT(r.reservation_Id) AS "RESERVATION"
FROM 
    Cinema c
JOIN 
    Hall h ON c.cinema_Id = h.cinema_Id
JOIN 
    Reservation r ON h.hall_Id = r.hall_Id
WHERE 
    h.hall_Id = '&hall_id_prompt'
GROUP BY 
    c.name, c.location, h.hall_Id, h.hall_info
ORDER BY 
    COUNT(r.reservation_Id) DESC;


CLEAR COLUMN
CLEAR BREAKS
TTITLE OFF