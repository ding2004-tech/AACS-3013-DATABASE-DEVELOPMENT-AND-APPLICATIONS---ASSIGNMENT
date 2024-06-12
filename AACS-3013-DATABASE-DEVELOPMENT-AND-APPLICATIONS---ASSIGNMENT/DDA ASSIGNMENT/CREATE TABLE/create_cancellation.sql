CREATE TABLE Cancellation (
    cancel_Id VARCHAR2(6) NOT NULL,
    reservation_Id VARCHAR2(6) REFERENCES Reservation(reservation_Id),
    cancel_date TIMESTAMP NOT NULL,
    reason VARCHAR2(150) NOT NULL,
    charge_fee NUMBER(6,2) NOT NULL,
    PRIMARY KEY (cancel_Id)
);
