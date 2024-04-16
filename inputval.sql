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
