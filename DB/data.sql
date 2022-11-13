
CREATE OR REPLACE FUNCTION new_song(character varying)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    INSERT INTO Song(name) VALUES($1);
    END;
$function$;
select new_song('Lobby');
select * from Song;