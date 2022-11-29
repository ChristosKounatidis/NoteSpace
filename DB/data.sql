CREATE OR REPLACE FUNCTION new_Producer(producer_name VARCHAR(30))
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    insert into Producer(name) values ($1);
    END;
$function$;

CREATE OR REPLACE FUNCTION new_Artist(artist_name VARCHAR(30))
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    insert into Artist(name) values ($1);
    END;
$function$;

CREATE OR REPLACE FUNCTION new_Album(album_name VARCHAR(30),releasedate DATE,artist int)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    insert into Album(name,releasedate,artist) values ($1,$2,$3);
    END;
$function$;

CREATE OR REPLACE FUNCTION new_Song(song_name VARCHAR(30),artists VARCHAR(100),producer_name int,album int,category VARCHAR(30))
 RETURNS void
 LANGUAGE plpgsql
AS $function$
declare
song VARCHAR(30);
    BEGIN
    insert into Song(name,producer,album,category) values ($1,$3,$4,$5::Category);
	song := (select id from Song where name=$1);

    
    insert into Artist_Song(artist,song) values ($2,song::int);
    END;
$function$;

CREATE OR REPLACE FUNCTION new_User(Username VARCHAR(20),pass VARCHAR(20))
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    insert into Users(username,pwd) values ($1,$2);
    END;
$function$;

CREATE OR REPLACE FUNCTION producers()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    perform new_Producer('Tillman Gyles');
    perform new_Producer('Akeem Mcilvenny');
    perform new_Producer('Ainsleigh Kluss');
    perform new_Producer('Elimelech Olvey');
    perform new_Producer('Alyn Seider');
    END;
$function$;

CREATE OR REPLACE FUNCTION artists()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    perform new_Artist('Edvard Bacon');
    perform new_Artist('Wassily Kandinsky');
    perform new_Artist('Claude Picasso');
    perform new_Artist('Georges Rodin');
    perform new_Artist('Keith Basquiat');
    END;
$function$;

CREATE OR REPLACE FUNCTION albums()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    --year ,month ,day
    perform new_Album('Spilled beans','1999-03-26',1);
    perform new_Album('Nine yards','2005-11-30',2);
    perform new_Album('Twice shy','2001-09-11',3);
    perform new_Album('Impulse reaction','1995-12-07',4);
    perform new_Album('Ghost stories','2010-04-06',5);
    END;
$function$;

CREATE OR REPLACE FUNCTION songs()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    perform new_Song('White Horse',1,3,5,'Pop');
    perform new_Song('cheery wings',2,4,1,'Country');
    perform new_Song('Little Lion Man',3,2,1,'Rock');
    perform new_Song('legendary YOUTH',3,4,2,'Hiphop');
    perform new_Song('eez-eh',1,1,1,'Country');
    perform new_Song('All My Grenade',1,1,1,'Rock');
    perform new_Song('Retro june',1,1,1,'Hiphop');
    perform new_Song('teen Flashback',1,1,1,'Pop');
    perform new_Song('easy Grenade',1,1,1,'Country');
    perform new_Song('rubber Kindness',1,1,1,'Hiphop');
    perform new_Song('Burn queen',1,1,1,'Pop');
    perform new_Song('Often Motion',1,1,1,'Country');
    perform new_Song('Alternative',1,1,null,'Pop');
    perform new_Song('The Reason',1,1,null,'Rock');
    perform new_Song('Happier Angel',1,1,null,'Hiphop');
    perform new_Song('The Same',1,1,null,'Country');
	END;
$function$;

select artists();
select producers();
select albums();
select songs();

