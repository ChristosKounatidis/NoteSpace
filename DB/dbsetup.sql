--DROP TABLE IF EXISTS

CREATE TABLE Categories(
	id SERIAL PRIMARY KEY,
	category VARCHAR(15)
);

CREATE TABLE Song(
	id SERIAL PRIMARY KEY,
	name VARCHAR(30)
);

CREATE TABLE Artist(
	id SERIAL PRIMARY KEY,
	name VARCHAR(15)
);

CREATE TABLE Album(
	id SERIAL PRIMARY KEY,
	name VARCHAR(30),
	releasedate DATE
);

CREATE TABLE Producer(
	id SERIAL PRIMARY KEY,
	name VARCHAR(15)
);

CREATE TABLE users(
	userName VARCHAR(20) NOT NULL,
	pwd VARCHAR(20) NOT NULL
);
-------------------------------------------

CREATE TABLE Album_Songs(
	category INT,
	album INT,
	song INT,
	PRIMARY KEY (category,album,song),
	CONSTRAINT fk_category 
		FOREIGN KEY(category) 
			REFERENCES Categories(id),
	CONSTRAINT fk_album 
		FOREIGN KEY(album) 
			REFERENCES Album(id),
	CONSTRAINT fk_song 
		FOREIGN KEY(song) 
			REFERENCES Song(id)
);

CREATE TABLE Produced_By(
	category INT,
	producer INT,
	song INT,
	PRIMARY KEY (category,producer,song),
	CONSTRAINT fk_category 
		FOREIGN KEY(category) 
			REFERENCES Categories(id),
	CONSTRAINT fk_producer 
		FOREIGN KEY(producer) 
			REFERENCES Producer(id),
	CONSTRAINT fk_song 
		FOREIGN KEY(song) 
			REFERENCES Song(id)
);

CREATE TABLE Album_Details(
	category INT,
	artist INT,
	album INT,
	PRIMARY KEY (category,artist,album),
	CONSTRAINT fk_category 
		FOREIGN KEY(category) 
			REFERENCES Categories(id),
	CONSTRAINT fk_artist 
		FOREIGN KEY(artist) 
			REFERENCES Artist(id),
	CONSTRAINT fk_album 
		FOREIGN KEY(album) 
			REFERENCES Album(id)
);

CREATE TABLE Singles(
	category INT,
	artist INT,
	song INT,
	PRIMARY KEY (category,artist,album),
	CONSTRAINT fk_category 
		FOREIGN KEY(category) 
			REFERENCES Categories(id),
	CONSTRAINT fk_artist 
		FOREIGN KEY(artist) 
			REFERENCES Artist(id),
	CONSTRAINT fk_song 
		FOREIGN KEY(song) 
			REFERENCES Song(id)
);
