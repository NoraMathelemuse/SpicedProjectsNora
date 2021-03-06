DROP TABLE IF EXISTS singers;
CREATE TABLE singers(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO singers(id, name) VALUES (1, 'Nicki Minaj'),(2, 'Lady Gaga'),(3, 'Taylor Swift'),(4, 'Tom Jones');


DROP TABLE IF EXISTS songs;

CREATE TABLE songs(
    id SERIAL PRIMARY KEY,
    song_name VARCHAR(50) NOT NULL,
    singer_id INTEGER
);

INSERT INTO songs (song_name, singer_id) VALUES ('Paparazzi', 2);
INSERT INTO songs (song_name, singer_id) VALUES ('Pokerface', 2);

FOREIGN KEY(singer_id) REFERENCES singers(id);

SELECT *
FROM singers
INNER JOIN songs 
ON singers.id=songs.singer_id; --- only shows the content that has all data

SELECT singer.name, song.name 
FROM singer
FULL JOIN songs
ON singers.id=songs.singer_id; --- joins everything 

SELECT * 
FROM singer
RIGHT JOIN songs
ON singers.id=songs.singer_id; --- joins both tables but the right table so here songs has to be completely filled out

SELECT * 
FROM singer
LEFT JOIN songs
ON singers.id=songs.singer_id; --- joins both tables but the left table so here songs has to be completely filled out

CREATE TABLE song_playlist_link(
    song_id INTEGER,
    playlist_id INTEGER,
    FOREIGN KEY(song_id) 
    REFERENCES songs(id),
    FOREIGN KEY(playlist_id)
    REFERENCES playlist(id)
);

INSERT INTO song_playlist_link VALUES (1, coding),(2,dancing),(3,eating);
