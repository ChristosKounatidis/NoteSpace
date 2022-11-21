DROP TABLE IF EXISTS Artist_Song;
DROP TABLE IF EXISTS Song;
DROP TABLE IF EXISTS Album;
DROP TABLE IF EXISTS Artist;
DROP TABLE IF EXISTS Producer;
DROP TYPE IF EXISTS Category;

CREATE TYPE Category AS ENUM ('Pop', 'Rock', 'Hiphop','Country');

CREATE OR REPLACE FUNCTION create_Producers()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    DROP TABLE if EXISTS Producer;
    CREATE TABLE Producer(
	id SERIAL PRIMARY KEY,
	name VARCHAR(15)
    );
    END;
$function$;

CREATE OR REPLACE FUNCTION create_Artist()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    DROP TABLE if EXISTS Artist;
    CREATE TABLE Artist(
	id SERIAL PRIMARY KEY,
	name VARCHAR(15)
    );
    END;
$function$;



CREATE OR REPLACE FUNCTION create_Song()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    DROP TABLE if EXISTS Song;
    CREATE TABLE Song(
	id SERIAL PRIMARY KEY,
	name VARCHAR(30),
	artist INT,
	producer INT,
	album INT default null,
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
    END;
$function$;

CREATE OR REPLACE FUNCTION create_Album()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    DROP TABLE if EXISTS Album;
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
    END;
$function$;

CREATE OR REPLACE FUNCTION create_Artist_Song()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    DROP TABLE if EXISTS Artist_Song;
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
    END;
$function$;

CREATE OR REPLACE FUNCTION create_users()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    DROP TABLE if EXISTS Users;
    CREATE TABLE Users(
	username VARCHAR(20),
	pwd		 VARCHAR(20)
    );
    END;
$function$;