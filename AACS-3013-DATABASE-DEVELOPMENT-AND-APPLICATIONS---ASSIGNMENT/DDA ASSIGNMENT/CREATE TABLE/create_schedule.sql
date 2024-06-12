
CREATE TABLE Schedule (
    schedule_Id VARCHAR2(6) NOT NULL,
    hall_Id VARCHAR2(6) REFERENCES Hall(hall_Id),
    movie_Id VARCHAR2(6) REFERENCES Movie(movie_Id),
    datetime TIMESTAMP NOT NULL,
    PRIMARY KEY (schedule_Id)
);