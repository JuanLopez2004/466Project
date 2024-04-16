DROP TABLE IF EXISTS SongArtist;
DROP TABLE IF EXISTS SongWriter;
DROP TABLE IF EXISTS SongProducer;
DROP TABLE IF EXISTS Song;
DROP TABLE IF EXISTS Artist;
DROP TABLE IF EXISTS Producer;
DROP TABLE IF EXISTS Writer;

-----one to many relationships-----

CREATE TABLE Song
(
    ID INT PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE Artist
(
    ID INT PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE Producer 
(
    ID INT PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE Writer
(
    ID INT PRIMARY KEY,
    name VARCHAR(30)
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

--insert data--

INSERT INTO Song (ID, name) VALUES 
    (1, 'Go With the Flow'),
    (2, 'Sacrifice'   ),
    (3, 'Stupid Love' ),
    (4, 'Reptilia'    ),
    (5, 'Paranoid'    ),
    (6, 'Dirty Love'  ),  
    (7, '9/10'        ),
    (8, 'Eyes Wide Terrified'),
    (9, 'Saddest Song'),
    (10, 'Apartment'),
    (11, 'Never Meant'),
    (12, 'Fever and Chills'), 
    (13, 'The Bends'  ),
    (14, 'Char'       ),
    (15, 'Clarity'    ),
    (16, 'Trap Queen' ),
    (17, 'Closet'     ),
    (18, 'Jamming'    ), 
    (19, 'The Gambler'),
    (20, 'Sweet Emotion'),
    (21, 'Looking for the Perfect Beat'),
    (22, 'City of New Orleans'),
    (23, 'Highwayman' ),
    (24, 'Rainbow in the Dark'), 
    (25, 'Dangerous'  ),
    (26, 'I Write Sins Not Tragedies'),
    (27, 'Pastempomat'),
    (28, 'Immortalized'),
    (29, 'Canto Della Terra'),
    (30, 'Of The Night');

INSERT INTO Artist (ID, name) VALUES
    (1,'Queens of the Stoneage'),
    (2,'The Weeknd'),
    (3,'Lady Gaga'),
    (4,'The Strokes'),
    (5,'Black Sabbath'),
    (6,'Motörhead'), 
    (7,'Jeff Rosenstock'),
    (8,'Johnny Foreigner'),
    (9,'Streetlight Manifesto'),
    (10,'Modern Baseball'), 
    (11,'American Football'),
    (12,'Fatter Than Albert'),
    (13,'Radiohead'),
    (14,'Crystal Castles'),
    (15,'Zedd'),
    (16,'Foxes'),
    (17,'Fetty Wap'),
    (18,'Fleshwater'),
    (19,'Bob Marley & The Wailers'),
    (20,'Kenny Rogers'),
    (21,'Aerosmith'),
    (22,'Afrika Bambaataa'),
    (22,'The Soulsonic Force'),
    (23,'Willie Nelson'),
    (24,'Johnny Cash'),
    (25,'Dio'),
    (26,'David Guetta'),
    (27,'Panic At The Disco!'),
    (28,'Dawid Podsiadło'),
    (29,'Disturbed'),
    (30,'Andrea Bocelli'),
    (31,'Bastile'); 

INSERT INTO Writer (ID, name) VALUES
    (1, 'Josh Homme'),
    (1, 'Nick Oliver'),
    (2, 'Max Martin'),
    (2, 'Abel Tesfaye'),
    (2, 'Alex Hedfors'),
    (2, 'Carl Nordstrom'),
    (2, 'Kevin Duane Mccord'),
    (2, 'Oscar Holter'),
    (2, 'Sebastian Ingrosso'),
    (2, 'Steve Angello'),
    (3, 'BloodPop'),
    (3, 'Max Martin'),
    (3, 'Ely Rise'),
    (3, 'Lady Gaga'),
    (3, 'Martin Bresso'),
    (4, 'Julian Casablancas'),
    (5, 'Ozzy Osbourne'),
    (5, 'Tony Lommi'),
    (5, 'Geezer Butler'),
    (5, 'Bill Ward'),
    (6, 'Eddie Clarke'),
    (6, 'Lemmy Kilmister'),
    (6, 'Phil Taylor'),
    (7, 'Jeff Rosenstock'),
    (8, 'Alexi Berrow'),
    (9, 'Tomas Kalnoky'),
    (10, 'Brendan Taylor Francis'),
    (10, 'Jacob Starnes Ewald'),
    (10, 'Ian Daniel Farmer'),
    (10, 'Sean Edward Huber'),
    (11, 'Micheal Tomas Kinsella'),
    (11, 'Steven Joseph Lamos'),
    (11, 'Stephen Michael Holmes'),
    (12, 'Fatter Than Albert'),
    (13, 'Thom Yorke'),
    (13, 'Jonny Greenwood'),
    (13, 'Ed OBrien'),
    (13, 'Colin Greenwood'),
    (13, 'Philip Selway'),
    (14, 'Ethan Kath'),
    (15, 'Anton Zaslavski'),
    (15, 'Holly Hafermann'),
    (15, 'Matthew Koma'),
    (15, 'Porter Robinson'),
    (16, 'Willie Maxwell'),
    (17, 'Anthony Didio'),
    (17, 'Jeremy Martin'),
    (17, 'Mirsy'),
    (17, 'Matt Wood'),
    (18, 'Bob Marley'),
    (19, 'Don Alan Schlitz Jr'),
    (20, 'Rod Temperton'),
    (20, 'Steven Tyler'),
    (20, 'Tom Hamilton'),
    (21, 'A Baker'),
    (21, 'Afrika Bambaataa'),
    (21, 'Arthur Baker'),
    (21, 'E Williams'),
    (21, 'J Miller'),
    (21, 'J Robie'),
    (21, 'R Allen'),
    (21, 'The Soulsonic Force'),
    (22, 'S Goodman'),
    (23, 'Jimmy Webb'),
    (24, 'Jimmy Bain'),
    (24, 'Ronnie James Dio'),
    (24, 'Vincent Appice'),
    (24, 'Vinny Appice'),
    (24, 'Vivian Campbell'),
    (25, 'Giorgio Tuinfort'),
    (25, 'Sam Martin'),
    (25, 'Jason Evigan'),
    (25, 'Lindy Robbins'),
    (26, 'Brendon Urie'),
    (26, 'Ryan Ross'),
    (26, 'Spencer Smith'),
    (27, 'Dawid Podsiadlo'),
    (27, 'Bogdan Kondracki'),
    (28, 'Kevin Churko'),
    (28, 'Dan Donegan'),
    (28, 'Mike Wengren'),
    (28, 'David Draiman'),
    (29, 'Francesco Sartori'),
    (29, 'Lucio Quarantotto'),
    (30, 'Benito Benitez'),
    (30, 'John Garrett III'),
    (30, 'Thea Austin');

    INSERT INTO Producer (ID, name) VALUES
    (1, 'Josh Homme'),
    (2, 'Eric Valentine');

--linking tables--

-- Linking Song with Artist
INSERT INTO SongArtist (SongID, ArtistID) VALUES 
(1, 1); 

-- Linking Song with Producer
INSERT INTO SongProducer (SongID, ProducerID) VALUES 
(1, 1),
(1, 2);

-- Linking Song with Writer
INSERT INTO SongWriter (SongID, WriterID) VALUES 
(1, 1),
(1, 2);

--queries--

--select statement that shows all artists of song 1
SELECT Artist.name
    FROM Artist
    JOIN SongArtist ON Artist.ID = SongArtist.ArtistID
    JOIN Song ON Song.ID = SongArtist.SongID
    WHERE Song.ID = 1;

-- select statement that shows all producers of song 1
SELECT Producer.name
    FROM Producer
    JOIN SongProducer ON Producer.ID = SongProducer.ProducerID
    JOIN Song ON Song.ID = SongProducer.SongID
    WHERE Song.ID = 1;

-- select statement that shows all writers of song 1
SELECT Writer.name
    FROM Writer
    JOIN SongWriter ON Writer.ID = SongWriter.WriterID
    JOIN Song ON Song.ID = SongWriter.SongID
    WHERE Song.ID = 1;
