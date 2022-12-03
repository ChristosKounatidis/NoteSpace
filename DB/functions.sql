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

CREATE OR REPLACE FUNCTION search_album(album_name VARCHAR(30) default null ,song_name VARCHAR(30)default null ,artist_name VARCHAR(30) default null)
 RETURNS TABLE (name varchar)
 LANGUAGE plpgsql
AS $function$
DECLARE 
    search_key1 VARCHAR(40);
    search_key2 VARCHAR(40);
    search_key3 VARCHAR(40);
    temp1 int;
    temp2 int;
    temp3 int;
    
    BEGIN
    --only album
    IF song_name is null and artist_name is null THEN
    search_key1 := CONCAT('%',album_name,'%');
    RETURN QUERY SELECT DISTINCT a.name FROM Album a WHERE a.name LIKE search_key1;
    --only song
    ELSIF album_name is null and artist_name is null THEN
	search_key1 := CONCAT('%',song_name,'%');
    RETURN QUERY SELECT DISTINCT a.name 
                 FROM Album a 
                 WHERE a.id 
                 IN (select album from song s where s.name LIKE search_key1);
    --only artist
    ELSIF album_name is null and song_name is null THEN
    search_key1 := CONCAT('%',artist_name,'%');
	temp1 := search_item(artist_name, 'Artist');
    RETURN QUERY SELECT DISTINCT a.name
				from album a
				where a.artist = temp1;

    --Στα πολλαπλά φ´ιλτρα πρέπει να ε´ιναι ακριβ´ως ονόματα.
    --album and song
    ELSIF artist_name is null THEN
    
	search_key1 := CONCAT('%',album_name,'%');
	search_key2 := CONCAT('%',song_name,'%');

    RETURN QUERY SELECT DISTINCT a.name 
                 FROM Album a 
                 WHERE a.name like search_key1 
                 and a.id IN (select s.album from song s where s.name like search_key2);
				 
    --song and artist
    ELSIF album_name is null THEN
    -- ΘΕΛΩ INT ΓΙΑ ΑΝΑΖΗΤΗΣΗ ΜΕΣΑ ΣΤΗΝ ΣΕΛΕΚΤ

    search_key1 := CONCAT('%',artist_name,'%');
    search_key1 := search(search_key1,'Artist');


    RETURN QUERY SELECT DISTINCT a.name FROM album where a.id=song;
	
    --album and artist
    ELSIF song_name IS NULL THEN
	
	search_key1 := search(album_name,'Album');
	search_key2 := search(artist_name,'Artist');
    temp1 = search_item(search_key2,'Artist');
		
    RETURN QUERY SELECT DISTINCT a.name
                 FROM Album a
                 where a.name like search_key1
                 and a.artist = temp1;
    --ok
	END IF;
    END;
$function$;

CREATE OR REPLACE FUNCTION search_song(search_key VARCHAR(30),search_method VARCHAR(30))
 RETURNS TABLE (name varchar)
 LANGUAGE plpgsql
AS $function$
DECLARE 
    temp int;

    BEGIN
    --by song name (ψάχνει και με κομμάτι του ον´οματος )
    IF  search_method='by_name' THEN
    temp := perform search_item(search_key,'Song');
    RETURN QUERY SELECT s.name from Song s WHERE category=temp;
    --by album (πρέπει το όνομα να ε´ιναι ακριβώς )
    ELSIF search_method='by_album' THEN
    temp := perform search_item(search_key,'Album');
    RETURN QUERY SELECT s.name from Song s WHERE album=temp;
    --by producer (´οπως το πάνω)
    ELSIF search_method='by_producer' THEN
    temp := perform search_item(search_key,'Producer');
    RETURN QUERY SELECT s.name from Song s WHERE producer=temp;
    --by artist  (όπως το πάνω)
    ELSIF search_method='by_artist' THEN
    temp := perform search_item(search_key,'Artist');
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

CREATE OR REPLACE FUNCTION edit_item(item_id int,table_name VARCHAR(15),arguments VARCHAR(120))
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    DECLARE arg1 VARCHAR(30);
            arg2 DATE;
            arg3 int;
            arg4 int;
    BEGIN
    IF table_name = 'Artist' THEN
    arg1 := select SPLIT_PART(arguments,',',1);
    UPDATE SET WHERE id = item_id;
    ELSIF table_name = 'Producer' THEN
    arg1 := select SPLIT_PART(arguments,',',1);
    UPDATE SET WHERE id = item_id;
    
    ELSIF table_name = 'Song' THEN
    arg1 := select SPLIT_PART(arguments,',',1);
    arg3 := select SPLIT_PART(arguments,',',2);
    arg4 := select SPLIT_PART(arguments,',',3);


    UPDATE SET WHERE id = item_id;
    
    ELSIF table_name = 'Album' THEN
    UPDATE SET WHERE id = item_id;
    END IF;
    END;
$function$;