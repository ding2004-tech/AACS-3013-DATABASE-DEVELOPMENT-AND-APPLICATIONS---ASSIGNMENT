CREATE TABLE Showing (
    schedule_Id VARCHAR2(6) NOT NULL,
    movie_Id VARCHAR2(6) NOT NULL,
    details VARCHAR2(151),
    PRIMARY KEY (schedule_Id, movie_Id),
    FOREIGN KEY (schedule_Id) REFERENCES Schedule(schedule_Id),
    FOREIGN KEY (movie_Id) REFERENCES Movie(movie_Id)
);

