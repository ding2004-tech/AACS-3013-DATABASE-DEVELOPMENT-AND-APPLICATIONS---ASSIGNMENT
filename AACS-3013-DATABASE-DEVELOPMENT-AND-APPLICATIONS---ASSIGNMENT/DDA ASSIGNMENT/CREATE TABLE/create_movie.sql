CREATE TABLE Movie (
    movie_Id VARCHAR2(6) NOT NULL,
    title VARCHAR2(51) NOT NULL,
    genre VARCHAR2(51),
    duration INTERVAL DAY TO SECOND,
    PRIMARY KEY (movie_Id)
);

