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
 RETURNS Boolean
 LANGUAGE plpgsql
AS $function$
DECLARE search_key VARCHAR(40);
    BEGIN
	search_key := CONCAT('%',artist_name,'%');
    SELECT * FROM Artist WHERE name IS LIKE search_key;
    END;
$function$;

CREATE OR REPLACE FUNCTION search_producer()
 RETURNS Boolean
 LANGUAGE plpgsql
AS $function$
    BEGIN
    
    END;
$function$;

CREATE OR REPLACE FUNCTION search_album()
 RETURNS Boolean
 LANGUAGE plpgsql
AS $function$
    BEGIN
    
    END;
$function$;

CREATE OR REPLACE FUNCTION search_song()
 RETURNS Boolean
 LANGUAGE plpgsql
AS $function$
    BEGIN
    
    END;
$function$;

