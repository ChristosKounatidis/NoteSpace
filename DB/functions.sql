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

-----------------------------------------------------------------------------------------------------
--search_x2 ,functions only to used in other functions

CREATE OR REPLACE FUNCTION search_artist2(artist_name VARCHAR(30))
 RETURNS TABLE (id int)
 LANGUAGE plpgsql
AS $function$
DECLARE search_key VARCHAR(40);
    BEGIN
	search_key := CONCAT('%',artist_name,'%');
    RETURN QUERY SELECT DISTINCT a.id FROM Artist a WHERE a.name LIKE search_key;
    END;
$function$;

CREATE OR REPLACE FUNCTION search_album2(album_name VARCHAR(30))
 RETURNS TABLE (id int)
 LANGUAGE plpgsql
AS $function$
DECLARE search_key VARCHAR(40);
    BEGIN
	search_key := CONCAT('%',album_name,'%');
    RETURN QUERY SELECT DISTINCT a.id FROM Album a WHERE a.name LIKE search_key;
    END;
$function$;

CREATE OR REPLACE FUNCTION search_producer2(producer_name VARCHAR(30))
 RETURNS TABLE (id int)
 LANGUAGE plpgsql
AS $function$
DECLARE search_key VARCHAR(40);
    BEGIN
	search_key := CONCAT('%',producer_name,'%');
    RETURN QUERY SELECT DISTINCT a.id FROM Producer a WHERE a.name LIKE search_key;
    END;
$function$;

CREATE OR REPLACE FUNCTION search_song2(song_name VARCHAR(30))
 RETURNS TABLE (id int)
 LANGUAGE plpgsql
AS $function$
DECLARE search_key VARCHAR(40);
    BEGIN
	search_key := CONCAT('%',song_name,'%');
    RETURN QUERY SELECT DISTINCT a.id FROM Song a WHERE a.name LIKE search_key;
    END;
$function$;

CREATE OR REPLACE FUNCTION search_item(item_name VARCHAR(30),Tname VARCHAR(30))
 RETURNS TABLE (id int)
 LANGUAGE plpgsql
AS $function$
DECLARE search_key VARCHAR(40);
    BEGIN
	search_key := CONCAT('%',item_name,'%');
    
    IF Tname = 'Artist' THEN

    RETURN QUERY SELECT DISTINCT a.id FROM Artist a WHERE a.name LIKE search_key;

    ELSIF Tname = 'Song' THEN

    RETURN QUERY SELECT DISTINCT a.id FROM Song a WHERE a.name LIKE search_key;

    ELSIF Tname = 'Producer' THEN
	
    RETURN QUERY SELECT DISTINCT a.id FROM Producer a WHERE a.name LIKE search_key;

    ELSIF Tname = 'Album' THEN

    RETURN QUERY SELECT DISTINCT a.id FROM Album a WHERE a.name LIKE search_key;

    END IF;

    END;
$function$;

-----------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION delete(name VARCHAR(30),Tname VARCHAR(15))
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    DECLARE item_id int;
    BEGIN

    IF Tname = 'Artist' THEN

    item_id:= (select search_item(name,Tname));
    delete from Artist_Song where artist = item_id;
	delete from Artist where id = item_id;

    ELSIF Tname = 'Song' THEN

    item_id:= (select search_item(name,Tname));
    delete from Artist_Song where song = item_id;
	delete from Song where id = item_id;

    ELSIF Tname = 'Producer' THEN
	
    item_id:= (select search_item(name,Tname));
    delete from Producer where id = item_id;

    ELSIF Tname = 'Album' THEN

    item_id:= (select search_item(name,Tname));
    delete from Producer where id = item_id;
    
    END IF;
    END;
$function$;

-----------------------------------------------------------------------------------------------
