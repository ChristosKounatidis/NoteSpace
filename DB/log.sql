CREATE OR REPLACE FUNCTION create_log()
RETURNS void
LANGUAGE plpgsql
AS $function$
    BEGIN
    DROP TABLE if EXISTS Log;
    CREATE TABLE Log(
	method enum('d','u','i'),
    old_data VARCHAR(100),
    new_data VARCHAR(100),
	table_name	VARCHAR(10),
	moment timestamp
    );
    END;
$function$;

CREATE or REPLACE FUNCTION logger() 
RETURNS trigger AS $$ 
    BEGIN
    IF TG_OP = 'DELETE' THEN
        INSERT INTO Log(method,old_data,new_data,table_name,moment)
        VALUES ('d',(select old::text),'',TG_TABLE_NAME,now());
        RETURN OLD;            
    ELSIF TG_OP = 'INSERT' THEN
        INSERT INTO Log(method,old_data,new_data,table_name,moment)
        VALUES ('i','',(select new::text),TG_TABLE_NAME,now());
        RETURN NEW;
    ELSIF  TG_OP = 'UPDATE' THEN
        INSERT INTO Log(method,old_data,new_data,table_name,moment)
        VALUES ('u',(select old::text),(select new::text),TG_TABLE_NAME,now());
        RETURN NEW;
    END IF;
    END;
$$ LANGUAGE 'plpgsql';


CREATE TRIGGER log_producer 
AFTER INSERT OR UPDATE OR DELETE ON Producer
FOR EACH ROW EXECUTE PROCEDURE logger();

CREATE TRIGGER log_artist 
AFTER INSERT OR UPDATE OR DELETE ON Artist
FOR EACH ROW EXECUTE PROCEDURE logger();

CREATE TRIGGER log_album 
AFTER INSERT OR UPDATE OR DELETE ON Album
FOR EACH ROW EXECUTE PROCEDURE logger();

CREATE TRIGGER log_song 
AFTER INSERT OR UPDATE OR DELETE ON Song
FOR EACH ROW EXECUTE PROCEDURE logger();

CREATE TRIGGER log_artist_song
AFTER INSERT OR UPDATE OR DELETE ON Artist_Song
FOR EACH ROW EXECUTE PROCEDURE logger();

CREATE TRIGGER log_users
AFTER INSERT OR UPDATE OR DELETE ON Users
FOR EACH ROW EXECUTE PROCEDURE logger();

