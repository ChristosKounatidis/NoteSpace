DROP TABLE IF EXISTS `Producer`;
CREATE TABLE Producer(
	id SERIAL PRIMARY KEY,
	name VARCHAR(15)
);

DROP TABLE IF EXISTS `Artist`;
CREATE TABLE Artist(
	id SERIAL PRIMARY KEY,
	name VARCHAR(15),
	category INT
);

DROP TABLE IF EXISTS `Categories`;
CREATE TABLE Categories(
	id SERIAL PRIMARY KEY,
	category VARCHAR(15)
);

DROP TABLE IF EXISTS `Album`;
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

DROP TABLE IF EXISTS `Track`;
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

DROP TABLE IF EXISTS `songArtist`;
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
