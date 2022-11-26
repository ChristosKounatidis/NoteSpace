CREATE OR REPLACE FUNCTION checkuser(un VARCHAR(30),pass VARCHAR(30))
 RETURNS Boolean
 LANGUAGE plpgsql
AS $function$
	DECLARE rs varchar(30) := '' ;
    BEGIN
    rs := (select username from users where un=username and pass=pwd);
	IF rs != '' THEN 
	RETURN TRUE;
	ELSE
	RETURN FALSE;
	END IF;
    END;
$function$;


----------------------------------------------------------
--search functions for data
CREATE OR REPLACE FUNCTION search_artist(artist_name VARCHAR(30))
 RETURNS TABLE (name varchar)
 LANGUAGE plpgsql
AS $function$
DECLARE search_key VARCHAR(40);
    BEGIN
	search_key := CONCAT('%',artist_name,'%');
    RETURN QUERY SELECT DISTINCT a.name FROM Artist a WHERE a.name LIKE search_key;
    END;
$function$;

CREATE OR REPLACE FUNCTION search_producer(producer_name VARCHAR(30))
 RETURNS TABLE (name varchar)
 LANGUAGE plpgsql
AS $function$
DECLARE search_key VARCHAR(40);
    BEGIN
	search_key := CONCAT('%',producer_name,'%');
    RETURN QUERY SELECT DISTINCT a.name FROM producer a WHERE a.name LIKE search_key;
    END;
$function$;

CREATE OR REPLACE FUNCTION search_album(album_name VARCHAR(30))
 RETURNS TABLE (name varchar, realeasedate date)
 LANGUAGE plpgsql
AS $function$
DECLARE search_key VARCHAR(40);
    BEGIN
	search_key := CONCAT('%',album_name,'%');
    RETURN QUERY SELECT DISTINCT a.name, a.releasedate FROM album a WHERE a.name LIKE search_key;
    END;
$function$;

CREATE OR REPLACE FUNCTION search_song()
 RETURNS Boolean
 LANGUAGE plpgsql
AS $function$
    BEGIN
    
    END;
$function$;

