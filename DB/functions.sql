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

CREATE OR REPLACE FUNCTION search_album(album_name VARCHAR(30),song_name VARCHAR(30),artist_name VARCHAR(30))
 RETURNS TABLE (name varchar)
 LANGUAGE plpgsql
AS $function$
DECLARE 
    search_key1 VARCHAR(40);
    search_key2 VARCHAR(40);
    search_key3 VARCHAR(40);
    
    BEGIN
    --only album
    IF song_name is null and artist_name is null THEN
    search_key1 := CONCAT('%',album_name,'%');
    RETURN QUERY SELECT DISTINCT a.name FROM Album a WHERE a.name LIKE search_key1;
    --only song
    ELSIF producer_name is null and artist_name is null THEN
	search_key1 := CONCAT('%',song_name,'%');
    RETURN QUERY SELECT DISTINCT a.name 
                 FROM Album a 
                 WHERE a.id 
                 IN (select album from song s where s.name LIKE search_key1);
    --only artist
    ELSIF producer_name is null and song_name is null THEN
    search_key1 := CONCAT('%',song_name,'%');
    RETURN QUERY SELECT DISTINCT a.name 
                 FROM Album a 
                 WHERE a.id 
                 IN (select album from artist s where s.name LIKE search_key1);
    --album and song
    ELSIF artist_name is null THEN
    search_key1 := CONCAT('%',album_name,'%');
    search_key2 := CONCAT('%',song_name,'%');
    RETURN QUERY SELECT DISTINCT a.name 
                 FROM Album a 
                 WHERE a.name LIKE search_key1 
                 and a.id IN (select album from song s where s.name LIKE search_key2);
    --song and artist
    ELSIF artist_name is null THEN
    search_key1 := CONCAT('%',song_name,'%');
    search_key2 := CONCAT('%',artist_name,'%');
    RETURN QUERY SELECT DISTINCT a.name 
                 FROM Album a 
                 WHERE a.id IN (select album from song s where s.name LIKE search_key1);
                 and   a.id IN (select id from album s where s.artist LIKE search_key2);
                 and   EXISTS IN(select )



	search_key := CONCAT('%',producer_name,'%');
    RETURN QUERY SELECT DISTINCT a.name FROM producer a WHERE a.name LIKE search_key;
    END;
$function$;

-----------------------------------------------------------------------------------------------------
--search_x2 ,functions only to used in other functions

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

CREATE OR REPLACE FUNCTION search(item_name VARCHAR(30),Tname VARCHAR(30))
 RETURNS TABLE (name varchar(30))
 LANGUAGE plpgsql
AS $function$
DECLARE search_key VARCHAR(40);
    BEGIN
	search_key := CONCAT('%',item_name,'%');
    
    IF Tname = 'Artist' THEN

    RETURN QUERY SELECT DISTINCT a.name FROM Artist a WHERE a.name LIKE search_key;

    ELSIF Tname = 'Song' THEN

    RETURN QUERY SELECT DISTINCT a.name FROM Song a WHERE a.name LIKE search_key;

    ELSIF Tname = 'Producer' THEN
	
    RETURN QUERY SELECT DISTINCT a.name FROM Producer a WHERE a.name LIKE search_key;

    ELSIF Tname = 'Album' THEN

    RETURN QUERY SELECT DISTINCT a.name FROM Album a WHERE a.name LIKE search_key;

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
