-- Создание базы данных музыкального магазина

-- 1. Создание таблицы исполнителей
CREATE TABLE Artists (
    ArtistID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL
);

-- 2. Создание таблицы жанров
CREATE TABLE Genres (
    GenreID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL
);

-- 3. Создание таблицы связей исполнитель-жанр
CREATE TABLE ArtistGenres (
    ArtistID INTEGER,
    GenreID INTEGER,
    PRIMARY KEY (ArtistID, GenreID),
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

-- 4. Создание таблицы альбомов
CREATE TABLE Albums (
    AlbumID INTEGER PRIMARY KEY AUTOINCREMENT,
    Title TEXT NOT NULL,
    ReleaseYear INTEGER,
    ArtistID INTEGER,
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID)
);

-- 5. Создание таблицы треков
CREATE TABLE Tracks (
    TrackID INTEGER PRIMARY KEY AUTOINCREMENT,
    Title TEXT NOT NULL,
    Duration INTEGER,
    AlbumID INTEGER,
    FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID)
);

-- 6. Создание таблицы сборников
CREATE TABLE Compilations (
    CompilationID INTEGER PRIMARY KEY AUTOINCREMENT,
    Title TEXT NOT NULL,
    ReleaseYear INTEGER
);

-- 7. Создание таблицы связей сборник-трек
CREATE TABLE CompilationTracks (
    CompilationID INTEGER,
    TrackID INTEGER,
    PRIMARY KEY (CompilationID, TrackID),
    FOREIGN KEY (CompilationID) REFERENCES Compilations(CompilationID),
    FOREIGN KEY (TrackID) REFERENCES Tracks(TrackID)
);

-- Заполнение базы данных 

-- 1. Добавление исполнителей
INSERT INTO Artists (Name) VALUES 
('The Beatles'),
('Queen'),
('Metallica'),
('Daft Punk');

-- 2. Добавление жанров
INSERT INTO Genres (Name) VALUES 
('Rock'),
('Pop'),
('Metal'),
('Electronic');

-- 3. Добавление связей исполнитель-жанр
INSERT INTO ArtistGenres (ArtistID, GenreID) VALUES 
(1, 1),
(1, 2),
(2, 1),
(3, 3),
(4, 4);

-- 4. Добавление альбомов
INSERT INTO Albums (Title, ReleaseYear, ArtistID) VALUES 
('Abbey Road', 1969, 1),
('A Night at the Opera', 1975, 2),
('Master of Puppets', 1986, 3),
('Random Access Memories', 2013, 4);

-- 5. Добавление треков
INSERT INTO Tracks (Title, Duration, AlbumID) VALUES 
('Come Together', 259, 1),
('Something', 182, 1),
('Here Comes the Sun', 185, 1),
('Bohemian Rhapsody', 354, 2),
('You''re My Best Friend', 172, 2),
('Battery', 312, 3),
('Master of Puppets', 515, 3),
('Welcome Home (Sanitarium)', 387, 3),
('Get Lucky', 369, 4),
('Instant Crush', 337, 4);

-- 6. Добавление сборников
INSERT INTO Compilations (Title, ReleaseYear) VALUES 
('Best of Rock', 2020),
('Metal Ballads', 2018),
('Electronic Hits', 2022),
('Legendary Classics', 2015);

-- 7. Добавление связей сборник-трек
INSERT INTO CompilationTracks (CompilationID, TrackID) VALUES 
(1, 1),
(1, 4),
(2, 7),
(2, 8),
(3, 9),
(3, 10),
(4, 1),
(4, 4),
(4, 6);

-- Проверка заполнения базы данных
SELECT 'Проверка заполнения базы данных:' as result;
SELECT 'Исполнители: ' || COUNT(*) FROM Artists
UNION ALL SELECT 'Жанры: ' || COUNT(*) FROM Genres
UNION ALL SELECT 'Альбомы: ' || COUNT(*) FROM Albums
UNION ALL SELECT 'Треки: ' || COUNT(*) FROM Tracks
UNION ALL SELECT 'Сборники: ' || COUNT(*) FROM Compilations
UNION ALL SELECT 'Связи исполнитель-жанр: ' || COUNT(*) FROM ArtistGenres
UNION ALL SELECT 'Связи сборник-трек: ' || COUNT(*) FROM CompilationTracks;