-- ЗАДАНИЕ 4 как раз для этого задания бсхема была изменена

-- 1. Альбомы с исполнителями более чем одного жанра
SELECT '1. Альбомы с исполнителями более чем одного жанра:' as query_name;
SELECT a.Title AS Album, ar.Name AS Artist, COUNT(DISTINCT ag.GenreID) AS GenreCount
FROM Albums a
JOIN AlbumArtists aa ON a.AlbumID = aa.AlbumID
JOIN Artists ar ON aa.ArtistID = ar.ArtistID
JOIN ArtistGenres ag ON ar.ArtistID = ag.ArtistID
GROUP BY a.AlbumID, a.Title, ar.Name
HAVING COUNT(DISTINCT ag.GenreID) > 1
ORDER BY GenreCount DESC, Album;

-- 2. Треки, которые не входят в сборники
SELECT '2. Треки, не входящие в сборники:' as query_name;
SELECT t.Title AS Track, a.Title AS Album, ar.Name AS Artist, t.Duration
FROM Tracks t
JOIN Albums a ON t.AlbumID = a.AlbumID
JOIN AlbumArtists aa ON a.AlbumID = aa.AlbumID
JOIN Artists ar ON aa.ArtistID = ar.ArtistID
WHERE t.TrackID NOT IN (
    SELECT DISTINCT TrackID 
    FROM CompilationTracks
)
ORDER BY t.Duration;

-- 3. Исполнители самого короткого трека
SELECT '3. Исполнители самого короткого трека:' as query_name;
SELECT ar.Name AS Artist, t.Title AS Track, t.Duration
FROM Tracks t
JOIN Albums a ON t.AlbumID = a.AlbumID
JOIN AlbumArtists aa ON a.AlbumID = aa.AlbumID
JOIN Artists ar ON aa.ArtistID = ar.ArtistID
WHERE t.Duration = (SELECT MIN(Duration) FROM Tracks)
ORDER BY ar.Name;

-- 4. Альбомы с наименьшим количеством треков
SELECT '4. Альбомы с наименьшим количеством треков:' as query_name;
SELECT a.Title AS Album, ar.Name AS Artist, COUNT(t.TrackID) AS TrackCount
FROM Albums a
JOIN Tracks t ON a.AlbumID = t.AlbumID
JOIN AlbumArtists aa ON a.AlbumID = aa.AlbumID
JOIN Artists ar ON aa.ArtistID = ar.ArtistID
GROUP BY a.AlbumID, a.Title, ar.Name
HAVING COUNT(t.TrackID) = (
    SELECT MIN(track_count) 
    FROM (
        SELECT COUNT(TrackID) AS track_count 
        FROM Tracks 
        GROUP BY AlbumID
    ) AS album_tracks
)
ORDER BY Album;

-- ДОПОЛНИТЕЛЬНО: Названия альбомов, содержащих наибольшее количество треков
SELECT '5. Альбомы с наибольшим количеством треков:' as query_name;
SELECT a.Title AS Album, ar.Name AS Artist, COUNT(t.TrackID) AS TrackCount
FROM Albums a
JOIN Tracks t ON a.AlbumID = t.AlbumID
JOIN AlbumArtists aa ON a.AlbumID = aa.AlbumID
JOIN Artists ar ON aa.ArtistID = ar.ArtistID
GROUP BY a.AlbumID, a.Title, ar.Name
HAVING COUNT(t.TrackID) = (
    SELECT MAX(track_count) 
    FROM (
        SELECT COUNT(TrackID) AS track_count 
        FROM Tracks 
        GROUP BY AlbumID
    ) AS album_tracks
)
ORDER BY TrackCount DESC, Album;
