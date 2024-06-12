SET LINESIZE 120
SET PAGESIZE 40

COLUMN "Hall ID" FORMAT A10
COLUMN "Hall Capacity" FORMAT 999
COLUMN "Schedule ID" FORMAT A10
COLUMN "Movie Title" FORMAT A25
COLUMN "Booking ID" FORMAT A10
COLUMN "Booking Date" FORMAT A25

ACCEPT booking_id_prompt CHAR PROMPT 'Enter Booking ID: '

TTITLE OFF


TTITLE CENTER "Hall and Booking Information" SKIP 2

SELECT 
    h.hall_Id AS "Hall ID",
    h.hall_capacity AS "Hall Capacity",
    s.schedule_Id AS "Schedule ID",
    m.title AS "Movie Title",
    b.booking_Id AS "Booking ID",
    TO_CHAR(b.booking_date, 'DD-MON-YYYY HH:MI:SS AM') AS "Booking Date"
FROM Hall h
JOIN Schedule s ON h.hall_Id = s.hall_Id
JOIN Movie m ON s.movie_Id = m.movie_Id
JOIN Booking b ON s.schedule_Id = b.schedule_Id
WHERE b.booking_Id = '&booking_id_prompt'
ORDER BY h.hall_Id , s.datetime , b.booking_date ;



COLUMN "Hall ID" CLEAR
COLUMN "Hall Capacity" CLEAR
COLUMN "Schedule ID" CLEAR
COLUMN "Movie Title" CLEAR
COLUMN "Booking ID" CLEAR
COLUMN "Booking Date" CLEAR

TTITLE OFF
