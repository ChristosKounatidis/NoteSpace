CREATE OR REPLACE FUNCTION new_song(character varying)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    INSERT INTO Song(name) VALUES($1);
    END;
$function$;

CREATE OR REPLACE FUNCTION new_Artist(character varying)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    INSERT INTO Artist(name) VALUES($1);
    END;
$function$;

CREATE OR REPLACE FUNCTION new_Album(character varying,date)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    INSERT INTO Album(name,releasedate) VALUES($1,$2);
    END;
$function$;

CREATE OR REPLACE FUNCTION new_Producer(character varying)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    INSERT INTO Producer(name) VALUES($1);
    END;
$function$;

CREATE OR REPLACE FUNCTION new_Category(character varying)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    INSERT INTO Categories(name) VALUES($1);
    END;
$function$;
















CREATE OR REPLACE FUNCTION new_Album_Details(numeric,numeric,numeric)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    INSERT INTO Album_Details(category,artist,album) VALUES($1,$2,$3);
    END;
$function$;

CREATE OR REPLACE FUNCTION new_Single(numeric,numeric,numeric)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    INSERT INTO Singles(category,artist,song) VALUES($1,$2,$3);
    END;
$function$;

CREATE OR REPLACE FUNCTION new_Produced_by(numeric,numeric,numeric)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    INSERT INTO Produced_by(category,producer,song) VALUES($1,$2,$3);
    END;
$function$;


CREATE OR REPLACE FUNCTION new_Album_Songs(numeric,numeric,numeric)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    INSERT INTO Produced_by(category,album,song) VALUES($1,$2,$3);
    END;
$function$;







select new_song('Lobby');
select * from Song;