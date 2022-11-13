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



select new_song('Lobby');
select * from Song;