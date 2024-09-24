-- ВЫБОРКА ДАННЫХ

-- 1. Простые запросы

-- Название и продолжительность самого длительного трека
SELECT 
    track_name, 
    duration 
FROM 
    track
WHERE 
    duration = (
        SELECT 
            MAX(duration)
        FROM 
            track
    );

-- Название треков, продолжительность которых не менее 3,5 минут
SELECT 
    track_name 
FROM 
    track
WHERE 
    duration >= 210;

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT 
    collection_name 
FROM 
    collection 
WHERE 
    collection_year BETWEEN 2018 AND 2020;

-- Исполнители, чьё имя состоит из одного слова
SELECT 
    artist_name 
FROM 
    artist 
WHERE 
    artist_name NOT LIKE '% %';

-- Название треков, которые содержат слово «мой» или «my»
SELECT 
    track_name 
FROM 
    track
WHERE 
    track_name LIKE '%мой%' OR track_name LIKE '%my%';

-- 2. Join-запросы

-- Количество исполнителей в каждом жанре
SELECT 
    g.genre_name, 
    COUNT(artist_name) 
FROM 
    artist_genre ag 
LEFT JOIN 
    artist a ON ag.artist_id = a.id
LEFT JOIN 
    genre g ON ag.genre_id = g.id
GROUP BY 
    g.genre_name;

-- Количество треков, вошедших в альбомы 2019–2020 годов
SELECT 
    album_year, 
    COUNT(track_name) 
FROM 
    album a
LEFT JOIN 
    track t ON a.id = t.album_id
WHERE 
    album_year BETWEEN 2019 AND 2020
GROUP BY 
    album_year;

-- Средняя продолжительность треков по каждому альбому
SELECT 
    album_name, 
    AVG(duration) AS avg
FROM 
    album a 
LEFT JOIN 
    track t ON a.id = t.album_id
GROUP BY 
    album_name
ORDER BY 
    avg DESC;

-- Все исполнители, которые не выпустили альбомы в 2020 году
SELECT 
    artist_name 
FROM 
    artist
WHERE 
    artist_name NOT IN (
        SELECT 
            artist_name 
        FROM 
            artist a 
        LEFT JOIN 
            album_artist aa ON a.id = aa.artist_id
        LEFT JOIN 
            album a2 ON aa.album_id = a2.id
        WHERE 
            a2.album_year = 2020
    );

-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами)
SELECT 
    c.collection_name 
FROM 
    album_artist aa 
LEFT JOIN 
    artist a ON aa.artist_id = a.id
LEFT JOIN 
    track t ON aa.album_id = t.album_id
LEFT JOIN 
    collection_track ct ON t.id = ct.track_id
LEFT JOIN 
    collection c ON ct.collection_id = c.id
WHERE 
    a.id = 1 AND c.collection_name IS NOT NULL;

-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра
SELECT 
    album_name
FROM 
    album
WHERE 
    id IN (
        SELECT 
            aa.album_id 
        FROM (
            SELECT 
                artist_id,
                artist_name,
                COUNT(genre_id)
            FROM 
                artist a
            LEFT JOIN 
                artist_genre ag ON a.id = ag.artist_id
            GROUP BY 
                artist_id,
                artist_name
            HAVING 
                COUNT(genre_id) > 1
        ) h_t
        LEFT JOIN 
            album_artist aa ON aa.artist_id = h_t.artist_id
    );

-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек
SELECT 
    artist_name 
FROM 
    artist 
WHERE 
    id IN (
        SELECT 
            artist_id 
        FROM 
            album_artist aa 
        WHERE 
            aa.album_id IN (
                SELECT 
                    album_id
                FROM 
                    track
                WHERE 
                    duration = (
                        SELECT 
                            MIN(duration)
                        FROM 
                            track
                    )
            )
    );

-- Названия альбомов, содержащих наименьшее количество треков
SELECT 
    album_name
FROM 
    album
WHERE 
    id IN (
        SELECT 
            album_id
        FROM (
            SELECT 
                album_id, 
                COUNT(track_name) AS count
            FROM 
                track
            GROUP BY 
                album_id
        ) t1
        WHERE 
            count = (
                SELECT 
                    MIN(count) 
                FROM (
                    SELECT 
                        album_id, 
                        COUNT(track_name) AS count
                    FROM 
                        track
                    GROUP BY 
                        album_id
                ) t2
            )
    );
