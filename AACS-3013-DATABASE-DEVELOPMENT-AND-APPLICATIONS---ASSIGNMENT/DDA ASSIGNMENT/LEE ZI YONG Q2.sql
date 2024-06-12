SET SERVEROUTPUT ON
SET LINESIZE 180
SET PAGESIZE 50

COLUMN Movie_Title FORMAT A48
COLUMN Total_Bookings FORMAT 9999999
COLUMN Total_Amount FORMAT $9999999.99
TTITLE LEFT 'Total Booking and Revenue of &v_name ' SKIP 2

PROMPT 'Forrest Gump'
PROMPT 'The Matrix'
PROMPT 'Interstellar'
PROMPT 'Pulp Fiction'
PROMPT 'The Lord of the Rings: The Return of the King'
PROMPT 'Inception'
PROMPT 'The Godfather'
PROMPT 'The Shawshank Redemption'
PROMPT 'The Dark Knight'
ACCEPT v_name CHAR FORMAT A50 PROMPT 'ENTER MOVIE TITLE: '

SELECT
    m.title AS Movie_Title,
    COUNT(b.booking_Id) AS Total_Bookings,
    SUM(b.total_amount) AS Total_Amount
FROM
    Movie m
JOIN
    Schedule s ON m.movie_Id = s.movie_Id
JOIN
    Booking b ON s.schedule_Id = b.schedule_Id
WHERE m.title='&v_name'
GROUP BY
    m.title
ORDER BY
    Total_Bookings DESC;

CLEAR COLUMN
CLEAR BREAKS
TTITLE OFF