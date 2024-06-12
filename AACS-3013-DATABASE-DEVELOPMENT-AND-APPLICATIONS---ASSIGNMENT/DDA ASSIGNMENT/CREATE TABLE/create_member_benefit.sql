CREATE TABLE Member_benefit (
    benefit_Id VARCHAR2(6) NOT NULL,
    member_Id VARCHAR2(6) REFERENCES Membership(member_Id),
    benefit_title VARCHAR2(51),
    PRIMARY KEY (benefit_Id)
);
