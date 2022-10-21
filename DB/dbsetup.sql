DROP TABLE IF EXISTS Producer;
CREATE TABLE IF NOT EXISTS Producer(
	id INT NOT NULL,
	name VARCHAR(15),
	PRIMARY KEY (id)
);

DROP TABLE IF EXISTS Artist;
CREATE TABLE IF NOT EXISTS Artist(
	id INT NOT NULL,
	name VARCHAR(15),
	category INT,	
	PRIMARY KEY (id)
);

DROP TABLE IF EXISTS Categories;
CREATE TABLE IF NOT EXISTS Categories(
	id INT NOT NULL,
	category VARCHAR(15),
	PRIMARY KEY (id)
);

DROP TABLE IF EXISTS Album;
CREATE TABLE IF NOT EXISTS Album(
	id INT NOT NULL,
	name VARCHAR(30),
	category INT,
	releasedata DATE,
	artist INT,
	PRIMARY KEY (id),
	CONSTRAINT fk_artist 
		FOREIGN KEY(artist) 
			REFERENCES Artist(id)
);

DROP TABLE IF EXISTS Track;
CREATE TABLE IF NOT EXISTS Track(
	id INT NOT NULL,
	name VARCHAR(30),
	producerid INT,
	albumid INT,
	category INT,
	PRIMARY KEY (id),
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

DROP TABLE IF EXISTS songArtist;
CREATE TABLE IF NOT EXISTS songArtist(
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


