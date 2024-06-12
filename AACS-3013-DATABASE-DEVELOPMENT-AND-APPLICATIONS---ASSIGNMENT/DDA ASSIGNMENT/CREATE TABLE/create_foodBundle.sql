CREATE TABLE FoodBundle (
    bundle_Id VARCHAR2(6) NOT NULL,
    ticket_Id VARCHAR2(6) REFERENCES Ticket(ticket_Id),
    description VARCHAR2(50) NOT NULL,
    qty NUMBER(3) NOT NULL,
    price NUMBER(6,2) NOT NULL,
    PRIMARY KEY (bundle_Id)
);