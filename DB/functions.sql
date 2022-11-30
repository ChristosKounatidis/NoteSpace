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

CREATE OR REPLACE FUNCTION search_album(Album_name VARCHAR(30),Release_Date date,Artist_name VARCHAR(30))
 RETURNS TABLE (album_name varchar, realease_date date,artist_name varchar)
 LANGUAGE plpgsql
AS $function$
DECLARE 
search_key1 VARCHAR(40);
search_key2 INT;
    BEGIN
	--search by album name
	IF Release_Date is NULL AND Artist_name is NULL THEN
	search_key := CONCAT('%',Album_name,'%');
    RETURN QUERY SELECT DISTINCT a.name, a.releasedate,a.artist FROM album a WHERE a.name LIKE search_key;
	--search by artist name
	ELSIF  Album_name IS NULL AND Release_Date is NULL THEN
	search_key2 := search_artist2(Artist_name);
    RETURN QUERY SELECT DISTINCT a.name, a.releasedate ,a.artist FROM album a WHERE a.artist LIKE search_key2;
	--search by date
	ELSIF Album_name IS NULL AND Artist_name is NULL THEN
	RETURN QUERY SELECT DISTINCT a.name, a.releasedate ,a.artist FROM album a WHERE a.releasedate::date = Release_Date; 

    END;
$function$;

CREATE OR REPLACE FUNCTION search_song()
 RETURNS Boolean
 LANGUAGE plpgsql
AS $function$
    BEGIN
    
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


-----------------------------------------------------------------------------------------------------




CREATE OR REPLACE FUNCTION delete_artist(name VARCHAR(30))
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    DECLARE artist_id int;
    BEGIN
    artist_id:= select search_artist2(name);
    delete from Artist where id = artist_id;
    END;
$function$;

CREATE OR REPLACE FUNCTION delete_producer(name VARCHAR(30))
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    DECLARE producer_id int;
    BEGIN
    producer_id:= select search_producer2(name);
    delete from Producer where id = producer_id;
    END;
$function$;

CREATE OR REPLACE FUNCTION delete_song(name VARCHAR(30))
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    DECLARE song_id int;
    BEGIN
    song_id:= select search_song2(name);
    delete from Song where id = song_id;
    delete from Artist_Song where id = song_id;
    END;
$function$;

CREATE OR REPLACE FUNCTION delete_album(name VARCHAR(30),T1 TABLE)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    DECLARE artist_id int;
    BEGIN
    ablum_id:= select search_album2(name);
    delete from Album where id = album_id;
    END;
$function$;


-----------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION delete_album(name VARCHAR(30),T1 TABLE)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    DECLARE artist_id int;
    BEGIN
    ablum_id:= select search_album2(name);
    delete from Album where id = album_id;
    END;
$function$;
