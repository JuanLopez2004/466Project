DROP TABLE IF EXISTS SongArtist;
DROP TABLE IF EXISTS SongWriter;
DROP TABLE IF EXISTS SongProducer;
DROP TABLE IF EXISTS KaraokeFile;
DROP TABLE IF EXISTS PQInput;
DROP TABLE IF EXISTS FIFOInput;
DROP TABLE IF EXISTS Song;
DROP TABLE IF EXISTS Artist;
DROP TABLE IF EXISTS Producer;
DROP TABLE IF EXISTS Writer;
DROP TABLE IF EXISTS PriorityQueue;
DROP TABLE IF EXISTS FIFOQueue;
DROP TABLE IF EXISTS PQUser;
DROP TABLE IF EXISTS FUser;
/*****Single Relation Tables*****/


CREATE TABLE Song  /*Creates a table for the relation Song.*/
(
    ID INT PRIMARY KEY,
    Title VARCHAR(30)
);

CREATE TABLE Artist  /*Creates a table for the relation Artist.*/ 
(
    ID INT PRIMARY KEY,
    Artist_Name VARCHAR(30)
);

CREATE TABLE Producer /*Creates a table for the relation Producer*/
(
    ID INT PRIMARY KEY,
    Prod_name VARCHAR(30)
);

CREATE TABLE Writer  /*Creates a table for the relation Writer*/
(
    ID INT PRIMARY KEY,
    Writer_Name VARCHAR(30)
);

CREATE TABLE PriorityQueue  /*Creates a table for the relation PriorityQueue*/
(
    PQID INT AUTO_INCREMENT PRIMARY KEY,
    Pledge INT(6) NOT NULL
);

CREATE TABLE FIFOQueue /*Create a table for the relation FIFOQueue*/
(
    FQID INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE PQUser  /*Creates a table for the relation PQUser*/
(
    PQUser INT AUTO_INCREMENT PRIMARY KEY,
    PQFName VARCHAR(30) NOT NULL,
    PQLName VARCHAR(30) NOT NULL
);

CREATE TABLE FUser  /*Creates a table for the relation FUser*/
(
    FIUser INT AUTO_INCREMENT PRIMARY KEY,
    FIFName VARCHAR(30) NOT NULL,
    FILName VARCHAR(30) NOT NULL
);

/***one to many relationships***/

CREATE TABLE KaraokeFile  /*Creates a table for the relation KaraokeFile*/
(   
    FileName INT AUTO_INCREMENT PRIMARY KEY,
    ID INT NOT NULL,
    FOREIGN KEY (ID) REFERENCES Song(ID)
);

/***many to many relationships***/

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

/*****************************NOTE**************************************
If you reference an auto-incremented primary key form one table
as a foreign key in another table, the foreign key column in the second
table will inherit the auto-incremented behavior of the primary key.
************************************************************************/

/***Greater than Binary Relations***/

CREATE TABLE PQInput /***Creates a table for the relation PQInput**/
(
    PQUser INT NOT NULL,
    PQID INT NOT NULL,
    FileName INT NOT NULL,
    Time TIME,
    FOREIGN KEY (PQUser) REFERENCES PQUser(PQUser),
    FOREIGN KEY (PQID) REFERENCES PriorityQueue(PQID),
    FOREIGN KEY (FileName) REFERENCES KaraokeFile(FileName)
);

CREATE TABLE FIFOInput /***Creates a table for the relation FIFOInput**/
(
    FIUser INT NOT NULL,
    FQID INT NOT NULL,
    FileName INT NOT NULL,
    Time TIME,
    FOREIGN KEY (FIUser) REFERENCES FUser(FIUser),
    FOREIGN KEY (FQID) REFERENCES FIFOQueue(FQID),
    FOREIGN KEY (FileName) REFERENCES KaraokeFile(FileName)
);

---insert song title---
INSERT INTO Song (ID, Title) VALUES 
    (1, 'Go With the Flow'),
    (2, 'Sacrifice'),
    (3, 'Stupid Love'),
    (4, 'Reptilia'),
    (5, 'Paranoid'),
    (6, 'Dirty Love'),  
    (7, '9/10'),
    (8, 'Eyes Wide Terrified'),
    (9, 'Saddest Song'),
    (10, 'Apartment'),
    (11, 'Never Meant'),
    (12, 'Fever and Chills'), 
    (13, 'The Bends'),
    (14, 'Char'),
    (15, 'Clarity'),
    (16, 'Trap Queen'),
    (17, 'Closet'),
    (18, 'Jamming'), 
    (19, 'The Gambler'),
    (20, 'Sweet Emotion'),
    (21, 'Looking for the Perfect Beat'),
    (22, 'City of New Orleans'),
    (23, 'Highwayman'),
    (24, 'Rainbow in the Dark'), 
    (25, 'Dangerous'),
    (26, 'I Write Sins Not Tragedies'),
    (27, 'Pastempomat'),
    (28, 'Immortalized'),
    (29, 'Canto Della Terra'),
    (30, 'Of The Night');

--insert artist name--
INSERT INTO Artist (ID, Artist_Name) VALUES 
    (1, 'Queens of the Stone Age'),     -- (1) Go With the Flow
    (2, 'The Weeknd'),                  -- (2) Sacrifice
    (3, 'Lady Gaga'),                   -- (3) Stupid Love
    (4, 'The Strokes'),                 -- (4) Reptilia
    (5, 'Black Sabbath'),               -- (5) Paranoid
    (6, 'Motörhead'),                   -- (6) Dirty Love
    (7, 'Jeff Rosenstock'),             -- (7) 9/10
    (8, 'Johnny Foreigner'),            -- (8) Eyes Wide Terrified
    (9, 'Streetlight Manifesto'),       -- (9) Saddest Song
    (10, 'Modern Baseball'),            -- (10) Apartment
    (11, 'American Football'),          -- (11) Never Meant
    (12, 'Fatter Than Albert'),         -- (12) Fever and Chills
    (13, 'Radiohead'),                  -- (13) The Bends
    (14, 'Crystal Castles'),            -- (14) Char
    (15, 'Zedd'),                       -- (15) Clarity
    (16, 'Foxes'),                      -- (15) Clarity
    (17, 'Fetty Wap'),                  -- (16) Trap Queen
    (18, 'Fleshwater'),                 -- (17) Closet
    (19, 'Bob Marley & The Wailers'),   -- (18) Jamming
    (20, 'Kenny Rogers'),               -- (19) The Gambler
    (21, 'Aerosmith'),                  -- (20) Sweet Emotion
    (22, 'Afrika Bambaataa'),           -- (21) Looking for the Perfect Beat
    (23, 'The Soulsonic Force'),        -- (21) Looking for the Perfect Beat
    (24, 'Willie Nelson'),              -- (22) City of New Orleans
    (25, 'Johnny Cash'),                -- (23) Highwayman
    (26, 'Dio'),                        -- (24) Rainbow in the Dark
    (27, 'David Guetta'),               -- (25) Dangerous
    (28, 'Panic At The Disco!'),        -- (26) I Write Sins Not Tragedies
    (29, 'Dawid Podsiadło'),            -- (27) Pastempomat
    (30, 'Disturbed'),                  -- (28) Immortalized
    (31, 'Andrea Bocelli'),             -- (29) Canto Della Terra
    (32, 'Bastile');                    -- (30) Of The Night

--insert producer name--
INSERT INTO Producer (ID, Prod_name) VALUES
    (1, 'Josh Homme'),                  -- (1) Go With the Flow
    (2, 'Eric Valentine'),              -- (1) Go With the Flow
    (3, 'Swedish House Mafia'),         -- (2) Sacrifice
    (4, 'Max Martin'),                  -- (2) Sacrifice
    (5, 'Oscar Holter'),                -- (2) Sacrifice
    (6, 'The Weeknd'),                  -- (2) Sacrifice
    (7, 'Carl Nordström'),              -- (2) Sacrifice
    (8, 'BloodPop'),                    -- (3) Stupid Love
    (9, 'Tchami'),                      -- (3) Stupid Love
    (10, 'Max Martin'),                 -- (3) Stupid Love
    (11, 'Gordan Raphael'),             -- (4) Reptilia
    (12, 'Rodger Bain'),                -- (5) Paranoid
    (13, 'Vic Maile'),                  -- (6) Dirty Love
    (14, 'Jack Shirley'),               -- (7) 9/10 
    (15, 'Gene "Machine" Freeman'),     -- (8) Eyes Wide Terrified
    (16, 'Tomas Kalnoky'),              -- (9) Saddest Song
    (17, 'Modern Baseball'),            -- (10) Apartment 
    (18, 'Brendan Gamble'),             -- (11) Never Meant
    (19, 'Nick Lauve'),                 -- (12) Fever and Chills
    (20, 'Matt Aguiluz'),               -- (12) Fever and Chills
    (21, 'John Leckie'),                -- (13) The Bends
    (22, 'Ethan Kath'),                 -- (14) Char
    (23, 'Zedd'),                       -- (15) Clarity
    (24, 'Tony Fadd'),                  -- (16) Trap Queen
    (25, 'Kurt Ballou'),                -- (17) Closet
    (26, 'Stephen Marley'),             -- (18) Jamming
    (27, 'Larry Butler'),               -- (19) The Gambler
    (28, 'Jack Douglas'),               -- (20) Sweet Emotion
    (29, 'Arthur Baker'),               -- (21) Looking for the Perfect Beat
    (30, 'John Robie'),                 -- (21) Looking for the Perfect Beat
    (31, 'Chips Moman'),                -- (22) City of New Orleans
    (32, 'Chips Moman'),                -- (23) Highwayman
    (33, 'Ronnie James Dio'),           -- (24) Rainbow in the Dark
    (34, 'Giorgio Tuinfort'),           -- (25) Dangerous
    (35, 'Sam Martin'),                 -- (25) Dangerous
    (36, 'Jason Evigan'),               -- (25) Dangerous
    (37, 'Matt Squire'),                -- (26) I Write Sins Not Tragedies
    (38, 'Bogdan Kondracki'),           -- (27) Pastempomat
    (39, 'Daniel Walczak'),             -- (27) Pastempomat
    (40, 'Kevin Churko'),               -- (28) Immortalized
    (41, 'Mauro Malavasi'),             -- (29) Canto Della Terra
    (42, 'Dan Smith');                  -- (30) Of The Night
    
--insert writer name--
INSERT INTO Writer (ID, Writer_Name) VALUES 
    (1, 'Josh Homme'),                  -- (1) Go With the Flow
    (2, 'Nick Oliver'),                 -- (1) Go With the Flow
    (3, 'Max Martin'),                  -- (2) Sacrifice
    (4, 'Abel Tesfaye'),                -- (2) Sacrifice
    (5, 'Alex Hedfors'),                -- (2) Sacrifice
    (6, 'Carl Nordstrom'),              -- (2) Sacrifice
    (7, 'Kevin Duane Mccord'),          -- (2) Sacrifice
    (8, 'Oscar Holter'),                -- (2) Sacrifice
    (9, 'Sebastian Ingrosso'),          -- (2) Sacrifice
    (10, 'Steve Angello'),              -- (2) Sacrifice
    (11, 'BloodPop'),                   -- (3) Stupid Love
    (12, 'Max Martin'),                 -- (3) Stupid Love
    (13, 'Ely Rise'),                   -- (3) Stupid Love
    (14, 'Lady Gaga'),                  -- (3) Stupid Love
    (15, 'Martin Bresso'),              -- (3) Stupid Love
    (16, 'Julian Casablancas'),         -- (4) Reptilia
    (17, 'Ozzy Osbourne'),              -- (5) Paranoid
    (18, 'Tony Iommi'),                 -- (5) Paranoid
    (19, 'Geezer Butler'),              -- (5) Paranoid
    (20, 'Bill Ward'),                  -- (5) Paranoid
    (21, 'Eddie Clarke'),               -- (6) Dirty Love
    (22, 'Lemmy Kilmister'),            -- (6) Dirty Love
    (23, 'Phil Taylor'),                -- (6) Dirty Love
    (24, 'Jeff Rosenstock'),            -- (7) 9/10
    (25, 'Alexi Berrow'),               -- (8) Eyes Wide Terrified
    (26, 'Tomas Kalnoky'),              -- (9) Saddest Song
    (27, 'Brendan Taylor Francis'),     -- (10) Apartment
    (28, 'Jacob Starnes Ewald'),        -- (10) Apartment
    (29, 'Ian Daniel Farmer'),          -- (10) Apartment
    (30, 'Sean Edward Huber'),          -- (10) Apartment
    (31, 'Micheal Tomas Kinsella'),     -- (11) Never Meant
    (32, 'Steven Joseph Lamos'),        -- (11) Never Meant
    (33, 'Stephen Michael Holmes'),     -- (11) Never Meant
    (34, 'Fatter Than Albert'),         -- (12) Fever and Chills
    (35, 'Thom Yorke'),                 -- (13) The Bends
    (36, 'Jonny Greenwood'),            -- (13) The Bends
    (37, 'Ed OBrien'),                  -- (13) The Bends
    (38, 'Colin Greenwood'),            -- (13) The Bends
    (39, 'Philip Selway'),              -- (13) The Bends
    (40, 'Ethan Kath'),                 -- (14) Char
    (41, 'Anton Zaslavski'),            -- (15) Clarity
    (42, 'Holly Hafermann'),            -- (15) Clarity
    (43, 'Matthew Koma'),               -- (15) Clarity
    (44, 'Porter Robinson'),            -- (15) Clarity
    (45, 'Willie Maxwell'),             -- (16) Trap Queen
    (46, 'Anthony Didio'),              -- (17) Closet
    (47, 'Jeremy Martin'),              -- (17) Closet
    (48, 'Mirsy'),                      -- (17) Closet
    (49, 'Matt Wood'),                  -- (17) Closet
    (50, 'Bob Marley'),                 -- (18) Jamming
    (51, 'Don Alan Schlitz Jr'),        -- (19) The Gambler
    (52, 'Rod Temperton'),              -- (20) Sweet Emotion
    (53, 'Steven Tyler'),               -- (20) Sweet Emotion
    (54, 'Tom Hamilton'),               -- (20) Sweet Emotion
    (55, 'A Baker'),                    -- (21) Looking for the Perfect Beat
    (56, 'Afrika Bambaataa'),           -- (21) Looking for the Perfect Beat
    (57, 'Arthur Baker'),               -- (21) Looking for the Perfect Beat
    (58, 'E Williams'),                 -- (21) Looking for the Perfect Beat
    (59, 'J Miller'),                   -- (21) Looking for the Perfect Beat
    (60, 'J Robie'),                    -- (21) Looking for the Perfect Beat
    (61, 'R Allen'),                    -- (21) Looking for the Perfect Beat
    (62, 'The Soulsonic Force'),        -- (21) Looking for the Perfect Beat
    (63, 'S Goodman'),                  -- (22) City of New Orleans
    (64, 'Jimmy Webb'),                 -- (23) Highwayman
    (65, 'Jimmy Bain'),                 -- (24) Rainbow in the Dark
    (66, 'Ronnie James Dio'),           -- (24) Rainbow in the Dark
    (67, 'Vincent Appice'),             -- (24) Rainbow in the Dark
    (68, 'Vinny Appice'),               -- (24) Rainbow in the Dark
    (69, 'Vivian Campbell'),            -- (24) Rainbow in the Dark
    (70, 'Giorgio Tuinfort'),           -- (25) Dangerous
    (71, 'Sam Martin'),                 -- (25) Dangerous
    (72, 'Jason Evigan'),               -- (25) Dangerous
    (73, 'Lindy Robbins'),              -- (25) Dangerous
    (74, 'Brendon Urie'),               -- (26) I Write Sins Not Tragedies
    (75, 'Ryan Ross'),                  -- (26) I Write Sins Not Tragedies
    (76, 'Spencer Smith'),              -- (26) I Write Sins Not Tragedies
    (77, 'Dawid Podsiadlo'),            -- (27) Pastempomat
    (78, 'Bogdan Kondracki'),           -- (27) Pastempomat
    (79, 'Kevin Churko'),               -- (28) Immortalized
    (80, 'Dan Donegan'),                -- (28) Immortalized
    (81, 'Mike Wengren'),               -- (28) Immortalized
    (82, 'David Draiman'),              -- (28) Immortalized
    (83, 'Francesco Sartori'),          -- (29) Canto Della Terra
    (84, 'Lucio Quarantotto'),          -- (29) Canto Della Terra
    (85, 'Benito Benitez'),             -- (30) Of The Night
    (86, 'John Garrett III'),           -- (30) Of The Night
    (87, 'Thea Austin');                -- (30) Of The Night

--show all 4 main tables--

SELECT * FROM Artist;
SELECT * FROM Song;
SELECT * FROM Producer;
SELECT * FROM Writer;

--###########################################################################
-- linking tables
--###########################################################################

-- Linking Song with Artist
INSERT INTO SongArtist (ArtistID, SongID) VALUES 
(1, 1),     -- [Queens of the Stone Age] linked to [Go with the Flow]
(2, 2),     -- [The Weeknd] linked to [Sacrifice]
(3, 3),     -- [Lady Gaga] linked to [Stupid Love]
(4, 4),     -- [The Strokes] linked to [Reptilia]
(5, 5),     -- [Black Sabbath] linked to [Paranoid]
(6, 6),     -- [Motörhead] linked to [Dirty Love]
(7, 7),     -- [Jeff Rosenstock] linked to [9/10]
(8, 8),     -- [Johnny Foreigner] linked to [Eyes Wide Terrified]
(9, 9),     -- [Streetlight Manifesto] linked to [Saddest Song]
(10, 10),   -- [Modern Baseball] linked to [Apartment]
(11, 11),   -- [American Football] linked to [Never Meant]
(12, 12),   -- [Fatter Than Albert] linked to [Fever and Chills]
(13, 13),   -- [Radiohead] linked to [The Bends]
(14, 14),   -- [Crystal Castles] linked to [Char]
(15, 15),   -- [Zedd] linked to [Clarity]
(16, 15),   -- [Foxes] linked to [Clarity]
(17, 16),   -- [Fetty Wap] linked to [Trap Queen]
(18, 17),   -- [Fleshwater] linked to [Closet]
(19, 18),   -- [Bob Marley & The Wailers] linked to [Jamming]
(20, 19),   -- [Kenny Rogers] linked to [The Gambler]
(21, 20),   -- [Aerosmith] linked to [Sweet Emotion]
(22, 21),   -- [Afrika Bambaataa] linked to [Looking for the Perfect Beat]
(23, 21),   -- [The Soulsonic Force] linked to [Looking for the Perfect Beat]
(24, 22),   -- [Willie Nelson] linked to [City of New Orleans]
(25, 23),   -- [Johnny Cash] linked to [Highwayman]
(26, 24),   -- [Dio] linked to [Rainbow in the Dark]
(27, 25),   -- [David Guetta] linked to [Dangerous]
(28, 26),   -- [Panic At The Disco!] linked to [I Write Sins Not Tragedies]
(29, 27),   -- [Dawid Podsiadło] linked to [Pastempomat]
(30, 28),   -- [Disturbed] linked to [Immortalized]
(31, 29),   -- [Andrea Bocelli] linked to [Canto Della Terra]
(32, 30);   -- [Bastile] linked to [Of The Night]


-- Linking Song with Producer
INSERT INTO SongProducer (ProducerID, SongID) VALUES 
(1, 1),     -- [Josh Homme] linked to [Go with the Flow]
(2, 1),     -- [Eric Valentine] linked to [Go with the Flow]
(3, 2),     -- [Swedish House Mafia] linked to [Sacrifice]
(4, 2),     -- [Max Martin] linked to [Sacrifice]
(5, 2),     -- [Oscar Holter] linked to [Sacrifice]
(6, 2),     -- [The Weeknd] linked to [Sacrifice]
(7, 2),     -- [Carl Nordström] linked to [Sacrifice]
(8, 3),     -- [BloodPop] linked to [Stupid Love]
(9, 3),     -- [Tchami] linked to [Stupid Love]
(10, 3),    -- [Max Martin] linked to [Stupid Love]
(11, 4),    -- [Gordan Raphael] linked to [Reptilia]
(12, 5),    -- [Rodger Bain] linked to [Paranoid]
(13, 6),    -- [Vic Maile] linked to [Dirty Love]
(14, 7),    -- [Jack Shirley] linked to [9/10]
(15, 8),    -- [Gene "Machine" Freeman] linked to [Eyes Wide Terrified]
(16, 9),    -- [Tomas Kalnoky] linked to [Saddest Song]
(17, 10),   -- [Modern Baseball] linked to [Apartment]
(18, 11),   -- [Brendan Gamble] linked to [Never Meant]
(19, 12),   -- [Nick Lauve] linked to [Fever and Chills]
(20, 12),   -- [Matt Aguiluz] linked to [Fever and Chills]
(21, 13),   -- [John Leckie] linked to [The Bends]
(22, 14),   -- [Ethan Kath] linked to [Char]
(23, 15),   -- [Zedd] linked to [Clarity]
(24, 15),   -- [Zedd] linked to [Clarity]
(25, 16),   -- [Tony Fadd] linked to [Trap Queen]
(26, 18),   -- [Kurt Ballou] linked to [Closet]
(27, 19),   -- [Stephen Marley] linked to [Jamming]
(28, 20),   -- [Larry Butler] linked to [The Gambler]
(29, 21),   -- [Jack Douglas] linked to [Sweet Emotion]
(30, 21),   -- [Arthur Baker] linked to [Looking for the Perfect Beat]
(31, 21),   -- [John Robie] linked to [Looking for the Perfect Beat]
(32, 22),   -- [Chips Moman] linked to [City of New Orleans]
(33, 23),   -- [Chips Moman] linked to [Highwayman]
(34, 24),   -- [Ronnie James Dio] linked to [Rainbow in the Dark]
(35, 25),   -- [Giorgio Tuinfort] linked to [Dangerous]
(36, 25),   -- [Sam Martin] linked to [Dangerous]
(37, 25),   -- [Jason Evigan] linked to [Dangerous]
(38, 26),   -- [Matt Squire] linked to [I Write Sins Not Tragedies]
(39, 27),   -- [Bogdan Kondracki] linked to [Pastempomat]
(40, 28),   -- [Kevin Churko] linked to [Immortalized]
(41, 29),   -- [Mauro Malavasi] linked to [Canto Della Terra]
(42, 30);   -- [Dan Smith] linked to [Of The Night]


-- Linking Song with Writer
INSERT INTO SongWriter (WriterID, SongID) VALUES 
(1, 1),     -- [Josh Homme] linked to [Go with the Flow]
(2, 1),     -- [Nick Oliver] linked to [Go with the Flow]
(3, 2),     -- [Max Martin] linked to [Sacrifice]
(4, 2),     -- [Abel Tesfaye] linked to [Sacrifice]
(5, 2),     -- [Alex Hedfors] linked to [Sacrifice]
(6, 2),     -- [Carl Nordstrom] linked to [Sacrifice]
(7, 2),     -- [Kevin Duane Mccord] linked to [Sacrifice]
(8, 2),     -- [Oscar Holter] linked to [Sacrifice]
(9, 2),     -- [Sebastian Ingrosso] linked to [Sacrifice]
(10, 2),    -- [Steve Angello] linked to [Sacrifice]
(11, 3),    -- [BloodPop] linked to [Stupid Love]
(12, 3),    -- [Max Martin] linked to [Stupid Love]
(13, 3),    -- [Ely Rise] linked to [Stupid Love]
(14, 3),    -- [Lady Gaga] linked to [Stupid Love]
(15, 3),    -- [Martin Bresso] linked to [Stupid Love]
(16, 4),    -- [Julian Casablancas] linked to [Reptilia]
(17, 5),    -- [Ozzy Osbourne] linked to [Paranoid]
(18, 5),    -- [Tony Lommi] linked to [Paranoid]
(19, 5),    -- [Geezer Butler] linked to [Paranoid]
(20, 5),    -- [Bill Ward] linked to [Paranoid]
(21, 6),    -- [Eddie Clarke] linked to [Dirty Love]
(22, 6),    -- [Lemmy Kilmister] linked to [Dirty Love]
(23, 6),    -- [Phil Taylor] linked to [Dirty Love]
(24, 7),    -- [Jeff Rosenstock] linked to [9/10]
(25, 8),    -- [Alexi Berrow] linked to [Eyes Wide Terrified]
(26, 9),    -- [Tomas Kalnoky] linked to [Saddest Song]
(27, 10),   -- [Brendan Taylor Francis] linked to [Apartment]
(28, 10),   -- [Jacob Starnes Ewald] linked to [Apartment]
(29, 10),   -- [Ian Daniel Farmer] linked to [Apartment]
(30, 10),   -- [Sean Edward Huber] linked to [Apartment]
(31, 11),   -- [Micheal Tomas Kinsella] linked to [Never Meant]
(32, 11),   -- [Steven Joseph Lamos] linked to [Never Meant]
(33, 11),   -- [Stephen Michael Holmes] linked to [Never Meant]
(34, 12),   -- [Fatter Than Albert] linked to [Fever and Chills]
(35, 13),   -- [Thom Yorke] linked to [The Bends]
(36, 13),   -- [Jonny Greenwood] linked to [The Bends]
(37, 13),   -- [Ed OBrien] linked to [The Bends]
(38, 13),   -- [Colin Greenwood] linked to [The Bends]
(39, 13),   -- [Philip Selway] linked to [The Bends]
(40, 14),   -- [Ethan Kath] linked to [Char]
(41, 15),   -- [Anton Zaslavski] linked to [Clarity]
(42, 15),   -- [Holly Hafermann] linked to [Clarity]
(43, 15),   -- [Matthew Koma] linked to [Clarity]
(44, 15),   -- [Porter Robinson] linked to [Clarity]
(45, 16),   -- [Willie Maxwell] linked to [Trap Queen]
(46, 17),   -- [Anthony Didio] linked to [Closet]
(47, 17),   -- [Jeremy Martin] linked to [Closet]
(48, 17),   -- [Mirsy] linked to [Closet]
(49, 17),   -- [Matt Wood] linked to [Closet]
(50, 18),   -- [Bob Marley] linked to [Jamming]
(51, 19),   -- [Don Alan Schlitz Jr] linked to [The Gambler]
(52, 20),   -- [Rod Temperton] linked to [Sweet Emotion]
(53, 20),   -- [Steven Tyler] linked to [Sweet Emotion]
(54, 20),   -- [Tom Hamilton] linked to [Sweet Emotion]
(55, 21),   -- [A Baker] linked to [Looking for the Perfect Beat]
(56, 21),   -- [Afrika Bambaataa] linked to [Looking for the Perfect Beat]
(57, 21),   -- [Arthur Baker] linked to [Looking for the Perfect Beat]
(58, 21),   -- [E Williams] linked to [Looking for the Perfect Beat]
(59, 21),   -- [J Miller] linked to [Looking for the Perfect Beat]
(60, 21),   -- [J Robie] linked to [Looking for the Perfect Beat]
(61, 21),   -- [R Allen] linked to [Looking for the Perfect Beat]
(62, 21),   -- [The Soulsonic Force] linked to [Looking for the Perfect Beat]
(63, 22),   -- [S Goodman] linked to [City of New Orleans]
(64, 23),   -- [Jimmy Webb] linked to [Highwayman]
(65, 24),   -- [Jimmy Bain] linked to [Rainbow in the Dark]
(66, 24),   -- [Ronnie James Dio] linked to [Rainbow in the Dark]
(67, 24),   -- [Vincent Appice] linked to [Rainbow in the Dark]
(68, 24),   -- [Vinny Appice] linked to [Rainbow in the Dark]
(69, 24),   -- [Vivian Campbell] linked to [Rainbow in the Dark]
(70, 25),   -- [Giorgio Tuinfort] linked to [Dangerous]
(71, 25),   -- [Sam Martin] linked to [Dangerous]
(72, 25),   -- [Jason Evigan] linked to [Dangerous]
(73, 25),   -- [Lindy Robbins] linked to [Dangerous]
(74, 26),   -- [Brendon Urie] linked to [I Write Sins Not Tragedies]
(75, 26),   -- [Ryan Ross] linked to [I Write Sins Not Tragedies]
(76, 26),   -- [Spencer Smith] linked to [I Write Sins Not Tragedies]
(77, 27),   -- [Dawid Podsiadlo] linked to [Pastempomat]
(78, 27),   -- [Bogdan Kondracki] linked to [Pastempomat]
(79, 28),   -- [Kevin Churko] linked to [Immortalized]
(80, 28),   -- [Dan Donegan] linked to [Immortalized]
(81, 28),   -- [Mike Wengren] linked to [Immortalized]
(82, 28),   -- [David Draiman] linked to [Immortalized]
(83, 29),   -- [Francesco Sartori] linked to [Canto Della Terra]
(84, 29),   -- [Lucio Quarantotto] linked to [Canto Della Terra]
(85, 30),   -- [Benito Benitez] linked to [Of The Night]
(86, 30),   -- [John Garrett III] linked to [Of The Night]
(87, 30);   -- [Thea Austin] linked to [Of The Night]
