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
    temp1 int;
    temp2 int;
    
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
    search_key1 := CONCAT('%',artist_name,'%');
    RETURN QUERY SELECT DISTINCT a.name 
                 FROM Album a 
                 WHERE a.id 
                 IN (select album from artist s where s.name LIKE search_key1);

    --Στα πολλαπλά φ´ιλτρα πρέπει να ε´ιναι ακριβ´ως ονόματα.
    --album and song
    ELSIF artist_name is null THEN
    search_key1 := album_name;
    search_key2 := song_name;
    RETURN QUERY SELECT DISTINCT a.name 
                 FROM Album a 
                 WHERE a.name = search_key1 
                 and a.id IN (select album from song s where s.name = search_key2);
    --ok


    --song and artist
    ELSIF album_name is null THEN
    search_key1 := song_name;-- ΘΕΛΩ INT ΓΙΑ ΑΝΑΖΗΤΗΣΗ ΜΕΣΑ ΣΤΗΝ ΣΕΛΕΚΤ
    temp1 := search_item(song_name,'Song');
    temp2 := search_item(artist_name,'Artist');
    
    RETURN QUERY SELECT DISTINCT s.album
                 FROM Song s 
                 WHERE s.name =search_key2
                 AND EXISTS(select * from Artist_Song WHERE song = temp1 and artist = temp2); 
    --ok    


    --album and artist
    ELSIF song_name IS NULL THEN
    temp1 = search_item(artist_name,'Artist');
    RETURN QUERY SELECT DISTInCT 
                 FROM Album a
                 where a.name=album_name
                 and a.artist = temp1;
    --ok
    END;
$function$;

CREATE OR REPLACE FUNCTION search_song(search_key VARCHAR(30),search_method VARCHAR(30))
 RETURNS TABLE (name varchar)
 LANGUAGE plpgsql
AS $function$
DECLARE 
    temp int;

    BEGIN
    --by song name
    IF  search_method='by_name' THEN
    temp1 := perform search_item(search_key,'Song');
    RETURN QUERY SELECT s.name from Song s WHERE category=temp;
    --by album
    ELSIF search_method='by_album' THEN
    temp1 := perform search_item(search_key,'Album');
    RETURN QUERY SELECT s.name from Song s WHERE album=temp;
    --by producer 
    ELSIF search_method='by_producer' THEN
    temp1 := perform search_item(search_key,'Producer');
    RETURN QUERY SELECT s.name from Song s WHERE producer=temp;
    --by artist  
    ELSIF search_method='by_artist' THEN
    temp1 := perform search_item(search_key,'Artist');
    RETURN QUERY SELECT s.name from Song s WHERE artist=temp;
    --by category (η κατηγορία πρέπει να γραφτεί ακρ´ιβως ,combobox)
    ELSIF search_method='by_category' THEN
    RETURN QUERY SELECT s.name from Song s WHERE category=search_key;

    END IF;
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
