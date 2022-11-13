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
	releasedata DATE,
	artist INT,
	song INT,
	CONSTRAINT fk_artist 
		FOREIGN KEY(artist) 
			REFERENCES Artist(id)
);

CREATE TABLE Song(
	id SERIAL PRIMARY KEY,
	name VARCHAR(30),
	artist INT,
	producer INT,
	category Category,
	CONSTRAINT fk_artist 
		FOREIGN KEY(artist) 
			REFERENCES Artist(id),
	CONSTRAINT fk_producer 
		FOREIGN KEY(producer) 
			REFERENCES Producer(id)
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