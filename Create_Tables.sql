DROP TABLE IF EXISTS SongArtist;
DROP TABLE IF EXISTS SongWriter;
DROP TABLE IF EXISTS SongProducer;
DROP TABLE IF EXISTS Song;
DROP TABLE IF EXISTS Artist;
DROP TABLE IF EXISTS Producer;
DROP TABLE IF EXISTS Writer;

-- create tables -- 

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
    File_Name INT,
    SongID INT,
    FOREIGN KEY (SongID) REFERENCES Song(ID),
    PRIMARY KEY (File_Name, SongID)
);


-- priority queue input -- julian 
CREATE TABLE PriorityQueueInput
(
    PQID INT, --Foreign Key
    File_Name INT, --Foreign Key
    PQUser INT AUTO_INCREMENT,
    PQFName INT,
    PQLName INT,
    FOREIGN KEY (PQID) REFERENCES PriorityQueue(PQID),
    FOREIGN KEY (File_Name) REFERENCES KaraokeFile(File_Name),
    PRIMARY KEY (PQID, File_Name, PQUser)
);


-- fifo queue --  julian 
CREATE TABLE FirstInQueue
(
    FQID INT,
    Time INT,
    PRIMARY KEY (FQID)
);


-- priority queue -- juan


-- priority user -- juan


-- fifo user --  juan


-- fifo queue input -- juan