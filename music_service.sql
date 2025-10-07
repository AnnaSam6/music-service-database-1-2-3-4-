-- Создаем базу данных
CREATE DATABASE music_service;
USE music_service;

-- Таблица жанров
CREATE TABLE Genres (
    GenreID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL UNIQUE
);

-- Таблица исполнителей  
CREATE TABLE Artists (
    ArtistID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Country VARCHAR(100)
);

-- Таблица для связи исполнителей и жанров (многие-ко-многим)
CREATE TABLE ArtistGenres (
    ArtistID INT,
    GenreID INT,
    PRIMARY KEY (ArtistID, GenreID),
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

-- Таблица альбомов
CREATE TABLE Albums (
    AlbumID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    ReleaseYear INT
);

-- Таблица для связи альбомов и исполнителей
CREATE TABLE AlbumArtists (
    AlbumID INT,
    ArtistID INT, 
    PRIMARY KEY (AlbumID, ArtistID),
    FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID),
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID)
);

-- Таблица треков
CREATE TABLE Tracks (
    TrackID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    AlbumID INT,
    Duration INT,
    FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID)
);

-- Таблица сборников
CREATE TABLE Compilations (
    CompilationID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    ReleaseYear INT
);

-- Таблица для связи сборников и треков
CREATE TABLE CompilationTracks (
    CompilationID INT,
    TrackID INT,
    PRIMARY KEY (CompilationID, TrackID),
    FOREIGN KEY (CompilationID) REFERENCES Compilations(CompilationID),
    FOREIGN KEY (TrackID) REFERENCES Tracks(TrackID)
);
