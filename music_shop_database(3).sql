-- ЗАДАНИЕ 3

-- 1. Количество исполнителей в каждом жанре
SELECT '1. Количество исполнителей в каждом жанре:' as query_name;
SELECT g.Name AS Genre, COUNT(ag.ArtistID) AS ArtistCount
FROM Genres g
LEFT JOIN ArtistGenres ag ON g.GenreID = ag.GenreID
GROUP BY g.GenreID, g.Name
ORDER BY ArtistCount DESC;

-- 2. Количество треков, вошедших в альбомы 2019–2020 годов
SELECT '2. Количество треков в альбомах 2019-2020:' as query_name;
SELECT COUNT(t.TrackID) AS TrackCount
FROM Tracks t
JOIN Albums a ON t.AlbumID = a.AlbumID
WHERE a.ReleaseYear BETWEEN 2019 AND 2020;

-- 3. Средняя продолжительность треков по каждому альбому
SELECT '3. Средняя продолжительность треков по альбомам:' as query_name;
SELECT a.Title AS Album, 
       ROUND(AVG(t.Duration), 2) AS AvgDuration,
       COUNT(t.TrackID) AS TrackCount
FROM Albums a
JOIN Tracks t ON a.AlbumID = t.AlbumID
GROUP BY a.AlbumID, a.Title
ORDER BY AvgDuration DESC;
