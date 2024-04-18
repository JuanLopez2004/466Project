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
    FOREIGN KEY (ProducerID) REFERENCES Producer(ID)
);

CREATE TABLE KaraokeFile
(
    FileName INT AUTO_INCREMENT PRIMARY KEY,
    SongID INT NOT NULL,
    FOREIGN KEY (SongID) REFERENCES Song(ID)
);

CREATE TABLE PriorityQueue
(
    PQID INT AUTO_INCREMENT PRIMARY KEY,
    Pledge INT(6) NOT NULL
);

CREATE TABLE PQUser
(
    PQUser INT AUTO_INCREMENT PRIMARY KEY,
    PQ_Fname VARCHAR(40) NOT NULL,
    PG_Lname VARCHAR(40) NOT NULL
);

CREATE TABLE FIUser
(
    FIUser INT AUTO_INCREMENT PRIMARY KEY,
    FI_FName VARCHAR(40) NOT NULL,
    FI_LNAME VARCHAR(40) NOT NULL
);

CREATE TABLE FirstInQueue
(
    FQID INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE FIFOInput
(
    FIUser INT NOT NULL,
    FQID INT NOT NULL,
    FileName INT NOT NULL,
    Time TIME,
    FOREIGN KEY (FIUser) REFERENCES FIUser(FIUser),
    FOREIGN KEY (FQID) REFERENCES FirstInQueue(FQID),
    FOREIGN KEY (FileName) REFERENCES KaraokeFile(FileName),
    PRIMARY KEY (FIUser, FQID, FIlename)
);

CREATE TABLE PriorityQueueInput
(
    PQID INT NOT NULL, 
    FileName INT NOT NULL,
    PQUser INT NOT NULL,
    Time TIME,
    FOREIGN KEY (PQID) REFERENCES PriorityQueue(PQID),
    FOREIGN KEY (FileName) REFERENCES KaraokeFile(FileName),
    FOREIGN KEY (PQUser) REFERENCES PQUser(PQUser),
    PRIMARY KEY (PQID, FileName, PQUser)
);