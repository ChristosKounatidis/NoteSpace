CREATE TABLE IF NOT EXISTS Producer(
	id INT NOT NULL,
	name VARCHAR(15),
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Artist(
	id INT NOT NULL,
	name VARCHAR(15),
	category INT,	
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Categories(
	id INT NOT NULL,
	category VARCHAR(15),
	PRIMARY KEY (id)
);

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
