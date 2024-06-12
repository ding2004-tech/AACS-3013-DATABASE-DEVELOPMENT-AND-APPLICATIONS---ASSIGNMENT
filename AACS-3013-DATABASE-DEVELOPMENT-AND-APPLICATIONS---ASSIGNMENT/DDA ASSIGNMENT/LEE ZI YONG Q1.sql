SET SERVEROUTPUT ON
SET LINESIZE 180
SET PAGESIZE 50

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD';

ACCEPT v_Date DATE FORMAT 'YYYY/MM/DD' PROMPT 'Enter the date 2024-05-01 - 2024-05-30 (YYYY/MM/DD): '

COLUMN Schedule_Id FORMAT A12
COLUMN Hall FORMAT A6
COLUMN Movie_Id FORMAT A10
COLUMN Movie_Title FORMAT A20
COLUMN Genre FORMAT A15
COLUMN Duration FORMAT A10

TTITLE LEFT 'Movie Schedule on &v_Date'  SKIP 2

SELECT
  s.schedule_Id AS Schedule_Id,
  s.hall_Id AS Hall,
  s.movie_Id AS Movie_Id,
  m.title AS Movie_Title,
  m.genre AS Genre,
   '     '||TO_CHAR(EXTRACT(HOUR FROM m.duration), 'FM00') || ':' || TO_CHAR(EXTRACT(MINUTE FROM m.duration), 'FM00') AS Duration
FROM Schedule s
  JOIN Showing sh ON s.schedule_Id = sh.schedule_Id
  JOIN Movie m ON s.movie_Id = m.movie_Id
WHERE
  s.datetime = TO_DATE('&v_Date', 'YYYY/MM/DD')
ORDER BY
  s.schedule_Id;

CLEAR COLUMN
CLEAR BREAKS
TTITLE OFF
