CREATE OR REPLACE FUNCTION create_log()
RETURNS void
LANGUAGE plpgsql
AS $function$
    BEGIN
    DROP TABLE if EXISTS Log;
    CREATE TABLE Log(
	method VARCHAR(1),
    old_data VARCHAR(100),
    new_data VARCHAR(100),
	table_name	VARCHAR(100),
	moment timestamp
    );
    END;
$function$;

CREATE or REPLACE FUNCTION logger() 
RETURNS trigger AS $$ 
    BEGIN
    IF TG_OP = 'DELETE' THEN
        INSERT INTO Log(method,old_data,new_data,table_name,moment)
        VALUES ('d',(select old::character varying),'',TG_TABLE_NAME,now());
        RETURN OLD;            
    ELSIF TG_OP = 'INSERT' THEN
        INSERT INTO Log(method,old_data,new_data,table_name,moment)
        VALUES ('i','',(select new::character varying),TG_TABLE_NAME,now());
        RETURN NEW;
    ELSIF  TG_OP = 'UPDATE' THEN
        INSERT INTO Log(method,old_data,new_data,table_name,moment)
        VALUES ('u',(select old::character varying),(select new::text),TG_TABLE_NAME,now());
        RETURN NEW;
    END IF;
    END;
$$ LANGUAGE 'plpgsql';


CREATE OR REPLACE TRIGGER log_producer 
AFTER INSERT OR UPDATE OR DELETE ON Producer
FOR EACH ROW EXECUTE PROCEDURE logger();

CREATE OR REPLACE TRIGGER log_artist 
AFTER INSERT OR UPDATE OR DELETE ON Artist
FOR EACH ROW EXECUTE PROCEDURE logger();

CREATE OR REPLACE TRIGGER log_album 
AFTER INSERT OR UPDATE OR DELETE ON Album
FOR EACH ROW EXECUTE PROCEDURE logger();

CREATE OR REPLACE TRIGGER log_song 
AFTER INSERT OR UPDATE OR DELETE ON Song
FOR EACH ROW EXECUTE PROCEDURE logger();

CREATE OR REPLACE TRIGGER log_artist_song
AFTER INSERT OR UPDATE OR DELETE ON Artist_Song
FOR EACH ROW EXECUTE PROCEDURE logger();

CREATE OR REPLACE TRIGGER log_users
AFTER INSERT OR UPDATE OR DELETE ON Users
FOR EACH ROW EXECUTE PROCEDURE logger();

select create_log();