CREATE TABLE Ticket (
    ticket_Id VARCHAR2(6) NOT NULL,
    booking_Id VARCHAR2(6) REFERENCES Booking(booking_Id),
    price NUMBER(6,2) NOT NULL,
    PRIMARY KEY (ticket_Id)
);