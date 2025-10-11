-- ЗАДАНИЕ 2

-- 1. Самый длинный трек (учитываем возможность нескольких треков с одинаковой максимальной длиной)
SELECT '1. Самый длинный трек:' as query_name;
SELECT Title, Duration 
FROM Tracks 
WHERE Duration = (SELECT MAX(Duration) FROM Tracks)
ORDER BY Title;

-- 2. Треки не менее 3.5 минут
SELECT '2. Треки ≥ 3.5 минут:' as query_name;
SELECT Title, Duration 
FROM Tracks 
WHERE Duration >= 210 
ORDER BY Duration DESC;

-- 3. Сборники 2018-2020
SELECT '3. Сборники 2018-2020:' as query_name;
SELECT Title, ReleaseYear 
FROM Compilations 
WHERE ReleaseYear BETWEEN 2018 AND 2020 
ORDER BY ReleaseYear;

-- 4. Исполнители из одного слова
SELECT '4. Исполнители из одного слова:' as query_name;
SELECT Name 
FROM Artists 
WHERE Name NOT LIKE '% %';

-- 5. Треки с "мой" или "my"
SELECT '5. Треки с "мой" или "my":' as query_name;
SELECT Title 
FROM Tracks 
WHERE LOWER(Title) LIKE '%мой%' OR LOWER(Title) LIKE '%my%';
