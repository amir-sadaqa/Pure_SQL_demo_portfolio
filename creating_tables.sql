create table if not exists genre (
    id serial primary key,
    genre_name varchar(60) unique not null
);

create table if not exists artist (
    id serial primary key,
    artist_name varchar(100) not null
);

create table if not exists artist_genre (
    artist_id integer references artist(id),
    genre_id integer references genre(id),
    constraint pk primary key (artist_id, genre_id)
);

create table if not exists album (
    id serial primary key,
    album_name varchar(100) not null,
    album_year integer
);

create table if not exists album_artist (
    album_id int references album(id),
    artist_id int references artist(id),
    constraint pk_2 primary key (album_id, artist_id)
);

-- Изменение поведения таблицы artist_genre для каскадного удаления
-- Удаление внешних ключей
alter table artist_genre
drop constraint artist_genre_artist_id_fkey,
drop constraint artist_genre_genre_id_fkey;

-- Добавление новых внешних ключей с каскадным удалением
alter table artist_genre
add constraint artist_genre_artist_id_fkey
foreign key (artist_id) references artist(id) on delete cascade;

alter table artist_genre
add constraint artist_genre_genre_id_fkey
foreign key (genre_id) references genre(id) on delete cascade;

-- То же самое для связки album_artist
alter table album_artist
drop constraint album_artist_album_id_fkey,
drop constraint album_artist_artist_id_fkey;

alter table album_artist
add constraint album_artist_album_id_fkey
foreign key (album_id) references album(id) on delete cascade;

alter table album_artist
add constraint album_artist_artist_id_fkey
foreign key (artist_id) references artist(id) on delete cascade;

create table if not exists track (
    id serial primary key,
    track_name varchar(80) not null,
    duration int not null,
    album_id int,
    foreign key (album_id) references album(id) on delete cascade
);

create table if not exists collection (
    id serial primary key,
    collection_name varchar(100) not null,
    collection_year int
);

create table if not exists collection_track (
    collection_id int references collection(id) on delete cascade,
    track_id int references track(id) on delete cascade,
    constraint pk_3 primary key (collection_id, track_id)
);
