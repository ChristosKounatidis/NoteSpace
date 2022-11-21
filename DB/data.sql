CREATE OR REPLACE FUNCTION new_Producer(producer_name VARCHAR(15))
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    insert into Producer(name) values ($1);
    END;
$function$;

CREATE OR REPLACE FUNCTION new_Artist(artist_name VARCHAR(15))
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    insert into Artist(name) values ($1);
    END;
$function$;

CREATE OR REPLACE FUNCTION new_Album(album_name VARCHAR(30),releasedate DATE,artist int)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    insert into Album(name,releasedate,artist) values ($1,$2,$3);
    END;
$function$;

CREATE OR REPLACE FUNCTION new_Song(song_name int,producer_name int,album int,category VARCHAR(15))
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    insert into Song(name,producer,album,category) values ($1,$2,$3,$4);
    END;
$function$;

CREATE OR REPLACE FUNCTION new_Artist_Song(song_name int,producer_name int)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    insert into Artist_Song(artist,song) values ($1,$2);
    END;
$function$;

CREATE OR REPLACE FUNCTION new_Artist_Song(Username VARCHAR(20),pass VARCHAR(20))
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    insert into Users(username,pwd) values ($1,$2);
    END;
$function$;

