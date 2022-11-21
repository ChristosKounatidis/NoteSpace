DROP TABLE IF EXISTS Artist_Song;
DROP TABLE IF EXISTS Song;
DROP TABLE IF EXISTS Album;
DROP TABLE IF EXISTS Artist;
DROP TABLE IF EXISTS Producer;
DROP TYPE IF EXISTS Category;

CREATE TYPE Category AS ENUM ('Pop', 'Rock', 'Hiphop','Country');

CREATE TABLE Producer(
	id SERIAL PRIMARY KEY,
	name VARCHAR(15)
);

CREATE TABLE Artist(
	id SERIAL PRIMARY KEY,
	name VARCHAR(15)
);

CREATE TABLE Album(
	id SERIAL PRIMARY KEY,
	name VARCHAR(30),
	releasedate DATE,
	artist INT,
	CONSTRAINT fk_artist 
		FOREIGN KEY(artist) 
			REFERENCES Artist(id)
);

CREATE TABLE Song(
	id SERIAL PRIMARY KEY,
	name VARCHAR(30),
	artist INT,
	producer INT,
	album INT,
	category Category,
	CONSTRAINT fk_artist 
		FOREIGN KEY(artist) 
			REFERENCES Artist(id),
	CONSTRAINT fk_producer 
		FOREIGN KEY(producer) 
			REFERENCES Producer(id),
	CONSTRAINT fk_album 
		FOREIGN KEY(album) 
			REFERENCES Album(id)
);

CREATE TABLE Artist_Song(
	artist INT,
	song INT,
	PRIMARY KEY(artist,song),
	CONSTRAINT fk_artist 
		FOREIGN KEY(artist) 
			REFERENCES Artist(id),
	CONSTRAINT fk_song 
		FOREIGN KEY(song) 
			REFERENCES Song(id)
);
CREATE TABLE Users(
	username VARCHAR(20),
	pwd		 VARCHAR(20)
)