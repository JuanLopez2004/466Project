DROP TABLE IF EXISTS SongArtist, SongWriter, SongProducer, FIFOQueue, PriorityQueue, KaraokeFile, Song, Artist, Producer, Writer, PQUser, FIUser;

/***********************************************************
The following table(relation) represents a strong entity
from the ER Diagram that represents the Titles associated
with the Songs. 
************************************************************/

CREATE TABLE Song
(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(30)
);

/***********************************************************
The following table(relation) represents a strong entity
from the ER Diagram that represents the Artists associated
with the Songs.
************************************************************/

CREATE TABLE Artist
(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Artist_Name VARCHAR(30)
);

/***********************************************************
The following table(relation) represents a strong entity
from the ER Diagram that represents the Producers associated
with the songs.
************************************************************/

CREATE TABLE Producer 
(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Prod_Name VARCHAR(30)
);

/***********************************************************
The following table(relation) represents a strong entity
from the ER Diagram that represents the Writers associated
with the songs.
************************************************************/

CREATE TABLE Writer
(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Writer_Name VARCHAR(30)
);

/***********************************************************
The following table(relation) represents a strong entity
from the ER Diagram that represents the users in the 
Priority Queue.
************************************************************/

CREATE TABLE PQUser
(
    PQUser INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    PQ_FName VARCHAR(25) NOT NULL,
    PQ_LName VARCHAR(25) NOT NULL,
    Pledge INT(6) NOT NULL
);

/***********************************************************
The following table(relation) represents a strong entity
from the ER Diagram that represents the users in the FIFO Queue.
************************************************************/

CREATE TABLE FIUser
(
    FIUser INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FI_FName VARCHAR(25) NOT NULL,
    FI_LNAME VARCHAR(25) NOT NULL
);

/***********************************************************
The following table(relation) represents the binary one-to-many 
relationship that the entites Song and File have within the
ER Diagram. The primary key of File is set within the relation
KaraokeFile and the primary key of Song is referenced as a
foreign key.
************************************************************/

CREATE TABLE KaraokeFile
(
    FileID INT PRIMARY KEY AUTO_INCREMENT,
    ID INT,
    FileName VARCHAR(40),
    FOREIGN KEY (ID) REFERENCES Song(ID)
);

/***********************************************************
The following table(relation) represents the binary many-to-many 
relationship that the entites Song and Artist have within the
ER Diagram. The primary keys of the tables(relations) Song and
Artist are now a concatentation within the new table(relation)
SongArtist represented as the foriegn key.
************************************************************/
CREATE TABLE SongArtist
(
    SongID INT,
    ArtistID INT,
    FOREIGN KEY (SongID) REFERENCES Song(ID),
    FOREIGN KEY (ArtistID) REFERENCES Artist(ID)
);

/***********************************************************
The following table(relation) represents the binary many-to-many 
relationship that the entites Song and Writer have within the
ER Diagram. The primary keys of the tables(relations) Song and Writer
are now a concatenation within the new table(relation) SongWriter
represented as the foriegn key.
************************************************************/
CREATE TABLE SongWriter
(
    SongID INTEGER,
    WriterID INTEGER,
    FOREIGN KEY (SongID) REFERENCES Song(ID),
    FOREIGN KEY (WriterID) REFERENCES Writer(ID)
);

/***********************************************************
The following table(relation) represents the binary many-to-many 
relationship that the entites Song and Producer have within the
ER Diagram. The primary keys of the tables(relations) Song and Producer
are now a concatenation within the new table(relation) SongProducer
represented as the foriegn key.
************************************************************/
CREATE TABLE SongProducer 
(
    SongID INT,
    ProducerID INT,
    FOREIGN KEY (SongID) REFERENCES Song(ID),
    FOREIGN KEY (ProducerID) REFERENCES Producer(ID)
);

/***********************************************************
The following table(relation) was formulated based on the binary 
many-to-many relationship that the entites FUser and File have within the
ER Diagram. The primary keys of the tables(relations) FUser and 
File are now a concatenation within the table(relation) FIFOQueue
as the foreign key.
************************************************************/
CREATE TABLE FIFOQueue
(
    FIID INT AUTO_INCREMENT,
    FileID INT,
    Time TIME,
    FOREIGN KEY (FIID) REFERENCES FIUser(FIUser),
    FOREIGN KEY (FileID) REFERENCES KaraokeFile(FileID)
);

/***********************************************************
The following table(relation) was formulated based
the binary many-to-many relationship that the entites PQUser and
File have within the ER Diagram. The primary keys of PQUser 
and File are now a concatenation within the table(relation) 
PriorityQueue represented as the foriegn key.
************************************************************/
CREATE TABLE PriorityQueue
(
    PQID INT AUTO_INCREMENT,
    FileID INT,
    Time TIME,
    FOREIGN KEY (PQID) REFERENCES PQUser(PQUser),
    FOREIGN KEY (FileID) REFERENCES KaraokeFile(FileID)
);
