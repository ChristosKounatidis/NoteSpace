--check user gia to LOGIN

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
--search Album me parametrous

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
    temp1 := search_item(search_key1,'Artist');

    search_key2 := CONCAT('%',song_name,'%');
    search_key2 := search(search_key2,'Song');
    temp2 := search_item(search_key2,'Song');

    temp3 := (select a.song from Artist_Song a where temp1=a.artist and temp2=a.song);

    RETURN QUERY SELECT DISTINCT a.name FROM album a where a.id=temp3::int;
	
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

-----------------------------------------------------------------------------------------------------
--search Song me parametro tous allous pinakes

CREATE OR REPLACE FUNCTION search_song(search_key VARCHAR(30),search_method VARCHAR(30))
 RETURNS TABLE (name varchar)
 LANGUAGE plpgsql
AS $function$
DECLARE 
    temp int;
	temp2 varchar(30);
	
    BEGIN
    --by song name (ψάχνει και με κομμάτι του ον´οματος )
    IF  search_method='by_name' THEN
    temp2 := search(search_key,'Song');
    RETURN QUERY SELECT s.name from Song s WHERE s.name=temp2;
    --by album (πρέπει το όνομα να ε´ιναι ακριβώς )
    ELSIF search_method='by_album' THEN
    temp := search_item(search_key,'Album');
    RETURN QUERY SELECT s.name from Song s WHERE s.album=temp;
    --by producer (´οπως το πάνω)
    ELSIF search_method='by_producer' THEN
    temp := search_item(search_key,'Producer');
    RETURN QUERY SELECT s.name from Song s WHERE s.producer=temp;
    --by artist  (όπως το πάνω)
    ELSIF search_method='by_artist' THEN
    temp := search_item(search_key,'Artist');
    RETURN QUERY SELECT DISTINCT s.name 
                 FROM song s 
                 WHERE s.id 
                 IN (SELECT s.song from Artist_song s WHERE s.artist=temp);
    --by category (η κατηγορία πρέπει να γραφτεί ακρ´ιβως ,combobox)
    ELSIF search_method='by_category' THEN
    RETURN QUERY SELECT s.name from Song s WHERE s.category=search_key::category;

    END IF;
    END;
$function$;

-----------------------------------------------------------------------------------------------------
--search pou epistrefei id OXI NAME

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
--Anazhthsh gia Artist kai Producer directly kai Album kai Song emmesa

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
--delete(douleuei gia OLA)

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
--edit item (gia OLA)

CREATE OR REPLACE FUNCTION edit_item(old_data varchar(30),arguments VARCHAR(120),table_name VARCHAR(15))
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    DECLARE 
            search_key int;
            arg1 VARCHAR(30);
            arg2 VARCHAR(30);
            arg3 VARCHAR(30);
            arg4 VARCHAR(30)
            arg6 int;
            arg7 int;
            arg8 int;
    BEGIN
    arg1 := SPLIT_PART(arguments,',',1);
    arg2 := SPLIT_PART(arguments,',',2);
    arg3 := SPLIT_PART(arguments,',',3);
    arg4 := SPLIT_PART(arguments,',',4);

    IF table_name = 'Artist' THEN
    search_key := search_item(old_data,'Artist');
    UPDATE Artist a SET a.name=arg1 WHERE a.id = search_key;

    ELSIF table_name = 'Producer' THEN
    search_key := search_item(old_data,'Producer');

    UPDATE Producer p SET p.name=arg1 WHERE p.id = search_key;
    
    ELSIF table_name = 'Song' THEN
    search_key := search_item(old_data,'Song');
    //onoma
    //album
    //artist
    //producer
    arg6 = search_item(arg2,'Album');
    arg7 = search_item(arg4,'Producer');
    arg8 = search_item(arg3,'Artist');

    UPDATE Song s SET s.name=arg1 s.producer=arg7 s.album=arg6  WHERE s.id = search_key;

    UPDATE Artist_Song a SET a.artist=arg8 WHERE song = search_key;
    
    ELSIF table_name = 'Album' THEN
    search_key := search_item(old_data,'Album');
    --onoma
    --artist
    --date
    arg6 := search_item(arg6,'Album');
    

    UPDATE Album a SET a.name=arg1 a.artist=arg6 a.date=arg3::date WHERE a.id = search_key;
    
    END IF;
    END;
$function$;