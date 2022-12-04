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
	name VARCHAR(30)
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
	name VARCHAR(30)
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
	releasedate DATE,
	artist INT,
	CONSTRAINT fk_artist 
		FOREIGN KEY(artist) 
			REFERENCES Artist(id) ON DELETE CASCADE
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
	producer INT,
	album INT default null,
	category Category,
	CONSTRAINT fk_producer 
		FOREIGN KEY(producer) 
			REFERENCES Producer(id) ON DELETE CASCADE,
	CONSTRAINT fk_album 
		FOREIGN KEY(album) 
			REFERENCES Album(id) ON DELETE CASCADE
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
			REFERENCES Artist(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_song 
		FOREIGN KEY(song) 
			REFERENCES Song(id) ON DELETE CASCADE ON UPDATE CASCADE
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


SELECT create_Artist();
SELECT create_Producers();
SELECT create_Album();
SELECT create_Song();
SELECT create_users();
SELECT create_Artist_Song();
