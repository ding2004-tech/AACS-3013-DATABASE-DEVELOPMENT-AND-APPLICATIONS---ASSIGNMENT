CREATE TABLE Reservation (
    reservation_Id VARCHAR2(6) NOT NULL,
    hall_Id VARCHAR2(6) REFERENCES Hall(hall_Id),
    cust_Id VARCHAR2(6) REFERENCES Customer(cust_Id),
    price NUMBER(6,2) NOT NULL,
    reserve_hour NUMBER(2),
    PRIMARY KEY (reservation_Id)
);
