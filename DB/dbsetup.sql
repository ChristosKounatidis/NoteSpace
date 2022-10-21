DROP TABLE IF EXISTS Track;
DROP TABLE IF EXISTS Album;
DROP TABLE IF EXISTS songArtist;
DROP TABLE IF EXISTS Artist;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Producer;

CREATE TABLE Producer(
	id SERIAL PRIMARY KEY,
	name VARCHAR(15)
);

CREATE TABLE Artist(
	id SERIAL PRIMARY KEY,
	name VARCHAR(15),
	category INT
);

CREATE TABLE Categories(
	id SERIAL PRIMARY KEY,
	category VARCHAR(15)
);

CREATE TABLE Album(
	id SERIAL PRIMARY KEY,
	name VARCHAR(30),
	category INT,
	releasedata DATE,
	artist INT,
	CONSTRAINT fk_artist 
		FOREIGN KEY(artist) 
			REFERENCES Artist(id)
);

CREATE TABLE Track(
	id INT NOT NULL,
	name VARCHAR(30),
	producerid INT,
	albumid INT,
	category INT,
	CONSTRAINT fk_producer 
		FOREIGN KEY(producerid) 
			REFERENCES Producer(id),
	CONSTRAINT fk_album 
		FOREIGN KEY(albumid) 
			REFERENCES Album(id),
	CONSTRAINT fk_category 
		FOREIGN KEY(category) 
			REFERENCES Categories(id)
);

CREATE TABLE songArtist(
    category INT NOT NULL,
    artist INT NOT NULL,
    PRIMARY KEY (category,artist),
	CONSTRAINT fk_category 
		FOREIGN KEY(category) 
			REFERENCES Categories(id),
	CONSTRAINT fk_artist 
		FOREIGN KEY(artist) 
			REFERENCES Artist(id)
);
