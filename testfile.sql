DROP TABLE IF EXISTS Contributer;
DROP TABLE IF EXISTS Song;
DROP TABLE IF EXISTS Artist;
DROP TABLE IF EXISTS Producer;
DROP TABLE IF EXISTS Writer;

CREATE TABLE Song
(
    ID INT PRIMARY KEY,
    Title VARCHAR(30)
);

CREATE TABLE Artist
(
    ID INT PRIMARY KEY,
    A_NAME VARCHAR(30)
    SongID INT,
    FOREIGN KEY (SongID) REFERENCES Song(ID)
);

CREATE TABLE Producer 
(
    ID INT PRIMARY KEY,
    SongID INT,
    P_NAME VARCHAR(30),
    FOREIGN KEY (SongID) REFERENCES Song(ID)
);

CREATE TABLE Writer
(
    ID INT PRIMARY KEY,
    SongID INT,
    W_NAME VARCHAR(30)
    FOREIGN KEY (SongID) REFERENCES Song(ID)
);

CREATE TABLE Contributer
(
    ID INT,
    AID INT,
    PID INT,
    WID INT,
    FOREIGN KEY (AID) REFERENCES Producer(ID),
    FOREIGN KEY (PID) REFERENCES Artist(ID),
    FOREIGN KEY (WID) REFERENCES Writer(ID),
    PRIMARY KEY (ID, AID, PID, WID)
);

INSERT INTO Song (ID, Title)
    VALUES(1, 'Go With the Flow');

INSERT INTO Artist (ID, SongID, A_NAME)
    VALUES(1, 1, 'Queens of the Stonage');

INSERT INTO Producer (ID, SongID, P_NAME)
    VALUES(1, 1, 'Josh Homme'),
          (2, 1, 'Eric Valentine');

INSERT INTO Writer (ID, SongID, W_NAME)
    VALUES(1, 1, 'Josh Homme'),
          (2, 1, 'Nick Oliver');
