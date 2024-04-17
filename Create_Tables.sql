DROP TABLE IF EXISTS SongArtist, SongWriter, SongProducer, KaraokeFile, PriorityQueueInput, FIFOInput, FirstInQueue, PriorityQueue, PQUser, FIUser, File, Song, Artist, Producer, Writer;


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

-- kfile -- julian
CREATE TABLE KaraokeFile
(
    FileName INT,
    SongID INT,
    FOREIGN KEY (SongID) REFERENCES Song(ID),
    PRIMARY KEY (FileName, SongID)
);

--file--

CREATE TABLE File
(
    FileName INT AUTO_INCREMENT PRIMARY KEY
);

-- priority queue -- juan

CREATE TABLE PriorityQueue
(
    PQID INT PRIMARY KEY,
    PTIME TIME,
    Pledge INT
);


-- priority queue input -- julian 
CREATE TABLE PriorityQueueInput
(
    PQID INT, 
    FileName INT,
    PQUser INT,
    PQFName INT,
    PQLName INT,
    FOREIGN KEY (PQID) REFERENCES PriorityQueue(PQID),
    FOREIGN KEY (FileName) REFERENCES File(FileName),
    PRIMARY KEY (PQID, FileName, PQUser)
);

-- priority user -- juan

CREATE TABLE PQUser
(
    PQUser INT AUTO_INCREMENT PRIMARY KEY,
    PQ_Fname VARCHAR(40),
    PG_Lname VARCHAR(40)
);

-- fifo user --  juan

CREATE TABLE FIUser
(
    FIUser INT AUTO_INCREMENT PRIMARY KEY,
    FI_FName VARCHAR(40),
    FI_LNAME VARCHAR(40)
);

-- fifo queue --  julian 
CREATE TABLE FirstInQueue
(
    FQID INT,
    Time INT,
    PRIMARY KEY (FQID)
);

-- fifo queue input -- juan

CREATE TABLE FIFOInput
(
    PID INT AUTO_INCREMENT PRIMARY KEY,
    FUser INT,
    FQID INT,
    FileName INT, 
    FIFName VARCHAR(40),
    FILName VARCHAR(40),
    FOREIGN KEY (FQID) REFERENCES FirstInQueue(FQID),
    FOREIGN KEY (FileName) REFERENCES File(Filename)
);