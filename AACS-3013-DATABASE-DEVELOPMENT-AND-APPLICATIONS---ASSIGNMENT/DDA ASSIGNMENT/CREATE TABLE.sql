CREATE TABLE Customer (
    cust_Id VARCHAR2(6) NOT NULL,
    email VARCHAR2(35) NOT NULL,
    name VARCHAR2(51) NOT NULL,
    tel VARCHAR2(15) NOT NULL,
    dob DATE,
    gender VARCHAR2(1),
    PRIMARY KEY (cust_Id),
    CONSTRAINT chk_gender CHECK (UPPER(gender) IN ('M','F')),
    CONSTRAINT chk_email CHECK (REGEXP_LIKE(email, '^[a-zA-Z]\w+@(\S+)$')),
    CONSTRAINT chk_tel CHECK (REGEXP_LIKE(tel, '^\d{3}-\d{3}-\d{4}$'))
);

CREATE TABLE Membership (
    member_Id VARCHAR2(6) NOT NULL,
    cust_Id VARCHAR2(6) REFERENCES Customer(cust_Id),
    start_date DATE,
    end_date DATE,
    PRIMARY KEY (member_Id)
);

CREATE TABLE Member_benefit (
    benefit_Id VARCHAR2(6) NOT NULL,
    member_Id VARCHAR2(6) REFERENCES Membership(member_Id),
    benefit_title VARCHAR2(51),
    PRIMARY KEY (benefit_Id)
);

CREATE TABLE Reservation (
    reservation_Id VARCHAR2(6) NOT NULL,
    hall_Id VARCHAR2(6) REFERENCES Hall(hall_Id),
    cust_Id VARCHAR2(6) REFERENCES Customer(cust_Id),
    price NUMBER(6,2) NOT NULL,
    reserve_hour NUMBER(2),
    PRIMARY KEY (reservation_Id)
);

CREATE TABLE Hall (
    hall_Id VARCHAR2(6) NOT NULL,
    hall_capacity NUMBER(6) NOT NULL,
    hall_info VARCHAR2(100) NOT NULL,
    cinema_Id VARCHAR2(6) REFERENCES Cinema(cinema_Id),
    PRIMARY KEY (hall_Id)
);


CREATE TABLE Cinema (
    cinema_Id VARCHAR2(6) NOT NULL,
    name VARCHAR2(50),
    location VARCHAR2(300) NOT NULL,
    PRIMARY KEY (cinema_Id)
);

CREATE TABLE Cancellation (
    cancel_Id VARCHAR2(6) NOT NULL,
    reservation_Id VARCHAR2(6) REFERENCES Reservation(reservation_Id),
    cancel_date TIMESTAMP NOT NULL,
    reason VARCHAR2(150) NOT NULL,
    charge_fee NUMBER(6,2) NOT NULL,
    PRIMARY KEY (cancel_Id)
);


CREATE TABLE Payment (
    payment_Id VARCHAR2(6) NOT NULL,
    reservation_Id VARCHAR2(6) REFERENCES Reservation(reservation_Id),
    booking_Id VARCHAR2(6) REFERENCES Booking(booking_Id),
    payment_time DATE NOT NULL,
    total_amount NUMBER(6,2) NOT NULL,
    PRIMARY KEY (payment_Id)
);

CREATE TABLE Booking (
    booking_Id VARCHAR2(6) NOT NULL,
    cust_Id VARCHAR2(6) REFERENCES Customer(cust_Id),
    booking_date TIMESTAMP NOT NULL,
    total_amount NUMBER(6,2) NOT NULL,
    schedule_Id VARCHAR2(6) REFERENCES Schedule(schedule_Id),
    PRIMARY KEY (booking_Id)
);

CREATE TABLE Ticket (
    ticket_Id VARCHAR2(6) NOT NULL,
    booking_Id VARCHAR2(6) REFERENCES Booking(booking_Id),
    price NUMBER(6,2) NOT NULL,
    PRIMARY KEY (ticket_Id)
);

CREATE TABLE Seat (
    seat_Id VARCHAR2(6) NOT NULL,
    ticket_Id VARCHAR2(6) REFERENCES Ticket(ticket_Id),
    status VARCHAR2(50),
    type VARCHAR2(50),
    PRIMARY KEY (seat_Id)
);

CREATE TABLE FoodBundle (
    bundle_Id VARCHAR2(6) NOT NULL,
    ticket_Id VARCHAR2(6) REFERENCES Ticket(ticket_Id),
    description VARCHAR2(50) NOT NULL,
    qty NUMBER(3) NOT NULL,
    price NUMBER(6,2) NOT NULL,
    PRIMARY KEY (bundle_Id)
);

CREATE TABLE Schedule (
    schedule_Id VARCHAR2(6) NOT NULL,
    hall_Id VARCHAR2(6) REFERENCES Hall(hall_Id),
    movie_Id VARCHAR2(6) REFERENCES Movie(movie_Id),
    datetime TIMESTAMP NOT NULL,
    PRIMARY KEY (schedule_Id)
);

CREATE TABLE Showing (
    schedule_Id VARCHAR2(6) NOT NULL,
    movie_Id VARCHAR2(6) NOT NULL,
    details VARCHAR2(151),
    PRIMARY KEY (schedule_Id, movie_Id),
    FOREIGN KEY (schedule_Id) REFERENCES Schedule(schedule_Id),
    FOREIGN KEY (movie_Id) REFERENCES Movie(movie_Id)
);

CREATE TABLE Movie (
    movie_Id VARCHAR2(6) NOT NULL,
    title VARCHAR2(51) NOT NULL,
    genre VARCHAR2(51),
    duration INTERVAL DAY TO SECOND,
    PRIMARY KEY (movie_Id)
);

