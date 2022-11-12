
CREATE OR REPLACE FUNCTION tables()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    DROP TABLE IF EXISTS Categories;
	CREATE TABLE Categories(
	id SERIAL PRIMARY KEY,
	category VARCHAR(15)
	);
    DROP TABLE IF EXISTS Song;
	CREATE TABLE Song(
		id SERIAL PRIMARY KEY,
		name VARCHAR(30)
	);
    DROP TABLE IF EXISTS Artist;
	CREATE TABLE Artist(
		id SERIAL PRIMARY KEY,
		name VARCHAR(15)
	);
    DROP TABLE IF EXISTS Album;
	CREATE TABLE Album(
		id SERIAL PRIMARY KEY,
		name VARCHAR(30),
		releasedate DATE
	);
    DROP TABLE IF EXISTS Producer;
	CREATE TABLE Producer(
		id SERIAL PRIMARY KEY,
		name VARCHAR(15)
	);
    END;
$function$;

select tables();
-------------------------------------------

CREATE OR REPLACE FUNCTION Album_Songs()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    DROP TABLE IF EXISTS Album_Songs;
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

    END;
$function$;

CREATE OR REPLACE FUNCTION Produced_By()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    DROP TABLE IF EXISTS Produced_By;
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
    END;
$function$;


CREATE OR REPLACE FUNCTION Album_Details()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    DROP TABLE IF EXISTS Album_Details;
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
    END;
$function$;

CREATE OR REPLACE FUNCTION Singles()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    DROP TABLE IF EXISTS Singles;
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
 
    END;
$function$;