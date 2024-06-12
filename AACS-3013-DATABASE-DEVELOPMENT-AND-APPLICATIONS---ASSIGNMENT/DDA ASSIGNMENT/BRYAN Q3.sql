ACCEPT search_input_date DATE FORMAT 'DD/MM/YYYY' PROMPT 'Enter Cancel Date (DD/MM/YYYY): '

COLUMN "Cancel_ID" FORMAT A10 HEADING "Cancel ID"
COLUMN "Customer Name" FORMAT A20 HEADING "Customer Name"
COLUMN "Cust_ID" FORMAT A15 HEADING "Customer ID"
COLUMN "Reservation_ID" FORMAT A15 HEADING "Reservation ID"
COLUMN "Price" FORMAT 9999.99 HEADING "Price(RM)"
COLUMN "Charge Fee" FORMAT 99.99 HEADING "Change Fee(RM)"
COLUMN "Refund" FORMAT 9999.99 HEADING "Refund Amount(RM)"

SET LINESIZE 180
SET PAGESIZE 100

TTITLE LEFT 'CANCELLATION LIST ON &search_input_date' 

SELECT
    CL.cancel_id AS "Cancel_ID",
    C.name AS "Customer Name",
    C.cust_Id AS "Cust_ID",
    R.reservation_id AS "Reservation_ID",
    R.price AS "Price",
    CL.charge_fee AS "Charge Fee",
	(R.price - CL.charge_fee) AS "Refund"
FROM
    Cancellation CL
JOIN
    Reservation R ON CL.reservation_id = R.reservation_id
JOIN
    Customer C ON R.cust_Id = C.cust_Id
WHERE 
    CL.cancel_date = TO_DATE('&search_input_date', 'DD/MM/YYYY');

CLEAR COLUMN
CLEAR BREAKS
TTITLE OFF

