SET SERVEROUTPUT ON
SET LINESIZE 180
SET PAGESIZE 100

PROMPT Enter member ID or benefit ID to search (use % for wildcard):
ACCEPT search_input CHAR PROMPT 'Enter search term: '

COLUMN cust_id         FORMAT A13 HEADING "Customer ID"
COLUMN name            FORMAT A20 HEADING "Customer Name"
COLUMN member_id       FORMAT A13 HEADING "Member ID"
COLUMN benefit_id      FORMAT A13 HEADING "Benefit ID"
COLUMN benefit_title   FORMAT A40 HEADING "Benefit"



TTITLE LEFT 'BENEFIT LIST FOR '&search_input'' skip 1 'Page No: ' FORMAT 999 SQL.PNO

SELECT DISTINCT
    	C.cust_Id AS cust_id,
    	C.name AS name,
	M.member_Id AS member_id,
    	B.benefit_Id AS benefit_id,
	B.benefit_title AS benefit_title
FROM 
    customer C 
JOIN 
    Membership M ON C.cust_Id = M.cust_Id 
JOIN 
    member_benefit B ON M.member_Id = B.member_Id 
WHERE 
    B.benefit_Id LIKE '%' || UPPER('&search_input') || '%' OR
    M.member_Id LIKE '%' || UPPER('&search_input') || '%';

CLEAR COLUMN
CLEAR BREAKS
TTITLE OFF
