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

CREATE OR REPLACE FUNCTION new_Song(song_name VARCHAR(30),producer_name VARCHAR(15),category VARCHAR(15))
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    insert into Song(name,producer,category) values ($1,$2,$3);
    END;
$function$;
