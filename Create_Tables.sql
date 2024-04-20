DROP TABLE IF EXISTS SongArtist, SongWriter, SongProducer, FIFOQueue, PriorityQueue, KaraokeFile, Song, Artist, Producer, Writer, PQUser, FIUser;

-----one to many relationships-----


CREATE TABLE Song
(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(30)
);

CREATE TABLE Artist
(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Artist_Name VARCHAR(30)
);

CREATE TABLE Producer 
(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Prod_Name VARCHAR(30)
);

CREATE TABLE Writer
(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Writer_Name VARCHAR(30)
);


--many to many relationships--

CREATE TABLE KaraokeFile
(
    FileID INT PRIMARY KEY AUTO_INCREMENT,
    ID INT,
    FileName VARCHAR(40),
    FOREIGN KEY (ID) REFERENCES Song(ID)
);

CREATE TABLE SongArtist
(
    SongID INT,
    ArtistID INT,
    FOREIGN KEY (SongID) REFERENCES Song(ID),
    FOREIGN KEY (ArtistID) REFERENCES Artist(ID)
);

CREATE TABLE SongWriter
(
    SongID INTEGER,
    WriterID INTEGER,
    FOREIGN KEY (SongID) REFERENCES Song(ID),
    FOREIGN KEY (WriterID) REFERENCES Writer(ID)
);

CREATE TABLE SongProducer 
(
    SongID INT,
    ProducerID INT,
    FOREIGN KEY (SongID) REFERENCES Song(ID),
    FOREIGN KEY (ProducerID) REFERENCES Producer(ID)
);

CREATE TABLE PQUser
(
    PQUser INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    PQ_FName VARCHAR(25) NOT NULL,
    PQ_LName VARCHAR(25) NOT NULL,
    Pledge INT(6) NOT NULL
);

CREATE TABLE FIUser
(
    FIUser INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FI_FName VARCHAR(25) NOT NULL,
    FI_LNAME VARCHAR(25) NOT NULL
);

CREATE TABLE FIFOQueue
(
    FIID INT,
    FileID INT,
    Time TIME,
    FOREIGN KEY (FIID) REFERENCES FIUser(FIUser),
    FOREIGN KEY (FileID) REFERENCES KaraokeFile(FileID)
);

CREATE TABLE PriorityQueue
(
    PQID INT,
    FileID INT,
    Time TIME,
    FOREIGN KEY (PQID) REFERENCES PQUser(PQUser),
    FOREIGN KEY (FileID) REFERENCES KaraokeFile(FileID)
);