-- Наполнение данными

-- Наполнение исполнителей
INSERT INTO artist (artist_name) VALUES ('Eminem');
INSERT INTO artist (artist_name) VALUES ('SchoolBoyQ');
INSERT INTO artist (artist_name) VALUES ('Kanye West');
INSERT INTO artist (artist_name) VALUES ('Drake');

-- Наполнение жанров
INSERT INTO genre (genre_name) VALUES ('rap');
INSERT INTO genre (genre_name) VALUES ('rock');
INSERT INTO genre (genre_name) VALUES ('pop');

-- Наполнение таблицы артист-жанр (многие ко многим)
-- Eminem
INSERT INTO artist_genre (artist_id, genre_id) VALUES (1, 1);
INSERT INTO artist_genre (artist_id, genre_id) VALUES (1, 2);
INSERT INTO artist_genre (artist_id, genre_id) VALUES (1, 3);

-- SchoolBoyQ
INSERT INTO artist_genre (artist_id, genre_id) VALUES (2, 1);
INSERT INTO artist_genre (artist_id, genre_id) VALUES (2, 3);

-- Kanye West
INSERT INTO artist_genre (artist_id, genre_id) VALUES (3, 1);
INSERT INTO artist_genre (artist_id, genre_id) VALUES (3, 2);
INSERT INTO artist_genre (artist_id, genre_id) VALUES (3, 3);

-- Drake
INSERT INTO artist_genre (artist_id, genre_id) VALUES (4, 1);

-- Наполнение альбомов
INSERT INTO album (album_name, album_year) VALUES ('The Eminem Show', 2002);
INSERT INTO album (album_name, album_year) VALUES ('Recovery', 2010);
INSERT INTO album (album_name, album_year) VALUES ('The Eminem Show', 2002);

-- Удаление дубликата альбома
DELETE FROM album WHERE id = 3;

INSERT INTO album (album_name, album_year) VALUES ('Oxymoron', 2014);
INSERT INTO album (album_name, album_year) VALUES ('Take Care', 2011);
INSERT INTO album (album_name, album_year) VALUES ('Views', 2016);
INSERT INTO album (album_name, album_year) VALUES ('Donda', 2022);
INSERT INTO album (album_name, album_year) VALUES ('album_2019_1', 2019);
INSERT INTO album (album_name, album_year) VALUES ('album_2019_2', 2019);
INSERT INTO album (album_name, album_year) VALUES ('album_2020_2', 2020);

-- Наполнение таблицы альбом-артист (многие ко многим)
INSERT INTO album_artist VALUES (1, 1);
INSERT INTO album_artist VALUES (3, 1);
INSERT INTO album_artist VALUES (4, 2);
INSERT INTO album_artist VALUES (4, 4);
INSERT INTO album_artist VALUES (2, 1);
INSERT INTO album_artist VALUES (2, 4);
INSERT INTO album_artist VALUES (5, 4);
INSERT INTO album_artist VALUES (6, 4);
INSERT INTO album_artist VALUES (7, 3);
INSERT INTO album_artist VALUES (7, 2);
INSERT INTO album_artist VALUES (9, 2);
INSERT INTO album_artist VALUES (10, 3);
INSERT INTO album_artist VALUES (8, 1);

-- Наполнение таблицы треки
INSERT INTO track (track_name, duration, album_id) VALUES ('track_1', 150, 1);
INSERT INTO track (track_name, duration, album_id) VALUES ('track_3', 152, 4);
INSERT INTO track (track_name, duration, album_id) VALUES ('track_8', 160, 2);
INSERT INTO track (track_name, duration, album_id) VALUES ('track_75', 164, 5);
INSERT INTO track (track_name, duration, album_id) VALUES ('track_72', 168, 7);
INSERT INTO track (track_name, duration, album_id) VALUES ('track_16', 161, 6);
INSERT INTO track (track_name, duration, album_id) VALUES ('track_100', 211, 1);
INSERT INTO track (track_name, duration, album_id) VALUES ('track_101', 218, 6);
INSERT INTO track (track_name, duration, album_id) VALUES ('goodbye my love goodbye', 219, 7);
INSERT INTO track (track_name, duration, album_id) VALUES ('мой город', 30, 1);
INSERT INTO track (track_name, duration, album_id) VALUES ('track_track', 30, 2);

-- Наполнение таблицы сборники
INSERT INTO collection (collection_name, collection_year) VALUES ('collection_1', 2023);
INSERT INTO collection (collection_name, collection_year) VALUES ('collection_2', 2018);
INSERT INTO collection (collection_name, collection_year) VALUES ('collection_3', 2024);
INSERT INTO collection (collection_name, collection_year) VALUES ('collection_4', 2019);

-- Наполнение треков для сборников
INSERT INTO track (track_name, duration, album_id) VALUES ('some_track_1', 143, 8);
INSERT INTO track (track_name, duration, album_id) VALUES ('some_track_2', 144, 8);
INSERT INTO track (track_name, duration, album_id) VALUES ('some_track_6', 142, 9);
INSERT INTO track (track_name, duration, album_id) VALUES ('some_track_56', 190, 10);
INSERT INTO track (track_name, duration, album_id) VALUES ('some_track_78', 191, 10);

-- Наполнение таблицы сборник-трек (многие ко многим)
INSERT INTO collection_track VALUES (1, 6);
INSERT INTO collection_track VALUES (1, 3);
INSERT INTO collection_track VALUES (2, 1);
INSERT INTO collection_track VALUES (2, 5);
INSERT INTO collection_track VALUES (3, 2);
INSERT INTO collection_track VALUES (3, 1);
INSERT INTO collection_track VALUES (4, 4);
INSERT INTO collection_track VALUES (4, 5);
INSERT INTO collection_track VALUES (4, 6);
