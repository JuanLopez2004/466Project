DROP TABLE IF EXISTS SongArtist, SongWriter, SongProducer, PriorityQueueInput, FIFOInput, FirstInQueue, PriorityQueue, PQUser, FIUser, KaraokeFile, Song, Artist, Producer, Writer;

-----one to many relationships-----

CREATE TABLE Song
(
    ID INT PRIMARY KEY,
    Title VARCHAR(30)
);

CREATE TABLE Artist
(
    ID INT PRIMARY KEY,
    Artist_Name VARCHAR(30)
);

CREATE TABLE Producer 
(
    ID INT PRIMARY KEY,
    Prod_name VARCHAR(30)
);

CREATE TABLE Writer
(
    ID INT PRIMARY KEY,
    Writer_Name VARCHAR(30)
);

--many to many relationships--

CREATE TABLE SongArtist
(
    SongID INT,
    ArtistID INT,
    FOREIGN KEY (SongID) REFERENCES Song(ID),
    FOREIGN KEY (ArtistID) REFERENCES Artist(ID),
    PRIMARY KEY (SongID, ArtistID)
);

CREATE TABLE SongWriter
(
    SongID INTEGER,
    WriterID INTEGER,
    FOREIGN KEY (SongID) REFERENCES Song(ID),
    FOREIGN KEY (WriterID) REFERENCES Writer(ID),
    PRIMARY KEY (SongID, WriterID)
);

CREATE TABLE SongProducer 
(
    SongID INT,
    ProducerID INT,
    FOREIGN KEY (SongID) REFERENCES Song(ID),
    FOREIGN KEY (ProducerID) REFERENCES Producer(ID),
    PRIMARY KEY (SongID, ProducerID)
);

CREATE TABLE KaraokeFile
(
    FileName INT PRIMARY KEY,
    SongID INT NOT NULL,
    FOREIGN KEY (SongID) REFERENCES Song(ID)
);

CREATE TABLE PriorityQueue
(
    PQID INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE FirstInQueue
(
    FQID INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE PQUser
(
    PQUser INT AUTO_INCREMENT PRIMARY KEY,
    PQ_FName VARCHAR(25) NOT NULL,
    PQ_LName VARCHAR(25) NOT NULL,
    Pledge INT(6) NOT NULL
);

CREATE TABLE FIUser
(
    FIUser INT AUTO_INCREMENT PRIMARY KEY,
    FI_FName VARCHAR(25) NOT NULL,
    FI_LNAME VARCHAR(25) NOT NULL
);

CREATE TABLE FIFOInput
(
    FIUser INT DEFAULT NULL,
    FQID INT,
    FileName INT NOT NULL,
    Time TIME,
    PRIMARY KEY (FQID, FileName),
    FOREIGN KEY (FIUser) REFERENCES FIUser(FIUser),
    FOREIGN KEY (FQID) REFERENCES FirstInQueue(FQID),
    FOREIGN KEY (FileName) REFERENCES KaraokeFile(FileName)
);

CREATE TABLE PriorityQueueInput
(   
    PQUser INT DEFAULT NULL,
    PQID INT,
    FileName INT NOT NULL,
    Time TIME,
    PRIMARY KEY (PQID, FileName),
    FOREIGN KEY (PQUser) REFERENCES PQUser(PQUser),
    FOREIGN KEY (PQID) REFERENCES PriorityQueue(PQID),
    FOREIGN KEY (FileName) REFERENCES KaraokeFile(FileName)
);