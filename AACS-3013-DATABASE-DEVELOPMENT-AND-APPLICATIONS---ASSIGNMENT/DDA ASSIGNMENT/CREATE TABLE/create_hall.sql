CREATE TABLE Hall (
    hall_Id VARCHAR2(6) NOT NULL,
    hall_capacity NUMBER(6) NOT NULL,
    hall_info VARCHAR2(100) NOT NULL,
    cinema_Id VARCHAR2(6) REFERENCES Cinema(cinema_Id),
    PRIMARY KEY (hall_Id)
);
