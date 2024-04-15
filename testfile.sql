DROP TABLE IF EXISTS Song;
DROP TABLE IF EXISTS Artist;
DROP TABLE IF EXISTS Producer;
DROP TABLE IF EXISTS Writer;
DROP TABLE IF EXISTS Song_Artist;
DROP TABLE IF EXISTS Song_Writer;
DROP TABLE IF EXISTS Song_Producer;

--###########################################################################
-- One to Many relationships
--###########################################################################
CREATE TABLE Song (
    ID INT PRIMARY KEY,
    name VARCHAR(30) 
);

CREATE TABLE Artist (
    ID INT PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE Writer (
    ID INT PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE Producer (
    ID INT PRIMARY KEY,
    name VARCHAR(30)
);


--###########################################################################
-- Many to Many relationships
--###########################################################################
CREATE TABLE Song_Artist (
    SongID INTEGER,
    ArtistID INTEGER,
    FOREIGN KEY (SongID) REFERENCES Song(ID),
    FOREIGN KEY (SongID) REFERENCES Artist(ID)
);

CREATE TABLE Song_Writer (
    SongID INTEGER,
    WriterID INTEGER,
    FOREIGN KEY (SongID) REFERENCES Song(ID),
    FOREIGN KEY (SongID) REFERENCES Writer(ID)
);

CREATE TABLE Song_Producer (
    SongID INTEGER,
    ProducerID INTEGER,
    FOREIGN KEY (SongID) REFERENCES Song(ID),
    FOREIGN KEY (SongID) REFERENCES Producer(ID)
);


--###########################################################################
-- Insert data
--###########################################################################

-- Insert Song title
INSERT INTO Song (ID, name) VALUES 
(1, 'Go With the Flow');

-- Insert Artist name
INSERT INTO Artist (ID, name) VALUES 
(1, 'Queens of the Stone age');

-- Insert Producer name
INSERT INTO Producer (ID, name) VALUES
(1, 'Josh Homme'),
(2, 'Eric Valentine');

-- Insert Writer name
INSERT INTO Writer (ID, name) VALUES 
(1, 'Josh Homme'),
(2, 'Nick Oliver');


--###########################################################################
-- linking tables
--###########################################################################

-- Linking Song with Artist
INSERT INTO Song_Artist (SongID, ArtistID) VALUES 
(1, 1); 

-- Linking Song with Producer
INSERT INTO Song_Producer (SongID, ProducerID) VALUES 
(1, 1),
(1, 2);

-- Linking Song with Writer
INSERT INTO Song_Writer (SongID, WriterID) VALUES 
(1, 1),
(1, 2);


--###########################################################################
-- test queries
--###########################################################################

-- select statement that shows all artists of song 1
SELECT Artist.name
    FROM Artist
    JOIN Song_Artist ON Artist.ID = Song_Artist.ArtistID
    JOIN Song ON Song.ID = Song_Artist.SongID
    WHERE Song.ID = 1;

-- select statement that shows all producers of song 1
SELECT Producer.name
    FROM Producer
    JOIN Song_Producer ON Producer.ID = Song_Producer.ProducerID
    JOIN Song ON Song.ID = Song_Producer.SongID
    WHERE Song.ID = 1;

-- select statement that shows all writers of song 1
SELECT Writer.name
    FROM Writer
    JOIN Song_Writer ON Writer.ID = Song_Writer.WriterID
    JOIN Song ON Song.ID = Song_Writer.SongID
    WHERE Song.ID = 1;
