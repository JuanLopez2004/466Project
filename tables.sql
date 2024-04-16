DROP TABLE IF EXISTS Song_Producer;
DROP TABLE IF EXISTS Song_Writer;
DROP TABLE IF EXISTS Song_Artist;
DROP TABLE IF EXISTS Song;
DROP TABLE IF EXISTS Artist;
DROP TABLE IF EXISTS Producer;
DROP TABLE IF EXISTS Writer;

--###########################################################################
-- One to Many relationships
--###########################################################################
CREATE TABLE IF NOT EXISTS Song (
    ID INT PRIMARY KEY,
    name VARCHAR(30) 
);

CREATE TABLE IF NOT EXISTS Artist (
    ID INT PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS Writer (
    ID INT PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS Producer (
    ID INT PRIMARY KEY,
    name VARCHAR(30)
);


--###########################################################################
-- Many to Many relationships
--###########################################################################
CREATE TABLE IF NOT EXISTS Song_Artist (
    SongID INT NOT NULL,
    ArtistID INT NOT NULL,
    PRIMARY KEY (SongID, ArtistID),
    FOREIGN KEY (SongID) REFERENCES Song(ID),
    FOREIGN KEY (SongID) REFERENCES Artist(ID)
);

CREATE TABLE IF NOT EXISTS Song_Writer (
    SongID INT NOT NULL,
    WriterID INT NOT NULL,
    PRIMARY KEY (SongID, WriterID),
    FOREIGN KEY (SongID) REFERENCES Song(ID),
    FOREIGN KEY (SongID) REFERENCES Writer(ID)
);

CREATE TABLE IF NOT EXISTS Song_Producer (
    SongID INT NOT NULL,
    ProducerID INT NOT NULL,
    PRIMARY KEY (SongID, ProducerID),
    FOREIGN KEY (SongID) REFERENCES Song(ID),
    FOREIGN KEY (ProducerID) REFERENCES Producer(ID)
);
