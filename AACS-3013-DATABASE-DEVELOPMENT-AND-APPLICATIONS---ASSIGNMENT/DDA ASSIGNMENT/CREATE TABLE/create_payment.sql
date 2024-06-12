CREATE TABLE Payment (
    payment_Id VARCHAR2(6) NOT NULL,
    reservation_Id VARCHAR2(6) REFERENCES Reservation(reservation_Id),
    booking_Id VARCHAR2(6) REFERENCES Booking(booking_Id),
    payment_time DATE NOT NULL,
    total_amount NUMBER(6,2) NOT NULL,
    PRIMARY KEY (payment_Id)
);