CREATE TABLE Seat (
    seat_Id VARCHAR2(6) NOT NULL,
    ticket_Id VARCHAR2(6) REFERENCES Ticket(ticket_Id),
    status VARCHAR2(50),
    type VARCHAR2(50),
    PRIMARY KEY (seat_Id)
);