CREATE TABLE Membership (
    member_Id VARCHAR2(6) NOT NULL,
    cust_Id VARCHAR2(6) REFERENCES Customer(cust_Id),
    start_date DATE,
    end_date DATE,
    PRIMARY KEY (member_Id)
);