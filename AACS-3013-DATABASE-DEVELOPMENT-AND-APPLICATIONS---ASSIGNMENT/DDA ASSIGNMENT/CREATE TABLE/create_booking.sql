CREATE TABLE Booking (
    booking_Id VARCHAR2(6) NOT NULL,
    cust_Id VARCHAR2(6) REFERENCES Customer(cust_Id),
    booking_date TIMESTAMP NOT NULL,
    total_amount NUMBER(6,2) NOT NULL,
    schedule_Id VARCHAR2(6) REFERENCES Schedule(schedule_Id),
    PRIMARY KEY (booking_Id)
);