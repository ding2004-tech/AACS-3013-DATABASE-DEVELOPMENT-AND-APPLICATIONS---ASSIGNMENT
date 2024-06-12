SET SERVEROUTPUT ON
SET LINESIZE 180
SET PAGESIZE 50

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD';

COLUMN Hall FORMAT A6
COLUMN Info FORMAT A13
COLUMN Total_Movie FORMAT 9999999
TTITLE LEFT 'Total Movie Showing in &v_hall on &v_date' SKIP 2

ACCEPT v_hall CHAR FORMAT A50 PROMPT 'ENTER HALL ID (H001-H100) : '
ACCEPT v_Date DATE FORMAT 'YYYY/MM/DD' PROMPT 'Enter the date 2024-05-01 - 2024-05-30 (YYYY/MM/DD): '

SELECT
    h.hall_Id AS Hall,
    h.hall_info AS Info,
    COUNT(m.movie_Id) AS Total_Movie
FROM
    Hall h
JOIN 
    Schedule s ON h.hall_Id = s.hall_Id
JOIN
    Movie m ON m.movie_Id = s.movie_Id
WHERE 
    h.hall_Id='&v_hall' AND 
    TRUNC(s.datetime) = TO_DATE('&v_Date', 'YYYY/MM/DD')
GROUP BY
    h.hall_Id,
    h.hall_info;

CLEAR COLUMNS
CLEAR BREAKS
TTITLE OFF