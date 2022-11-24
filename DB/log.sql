CREATE OR REPLACE FUNCTION create_log()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    DROP TABLE if EXISTS Log;
    CREATE TABLE Log(
	method enum('d','u','i'),
	table_name	VARCHAR(20),
	moment timestamp
    );
    END;
$function$;

CREATE OR REPLACE FUNCTION create_log()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    DROP TABLE if EXISTS Log;
    CREATE TABLE Log(
	method enum('d','u','i'),
	table_name	VARCHAR(20),
	moment timestamp
    );
    END;
$function$;

CREATE OR REPLACE FUNCTION create_log()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    DROP TABLE if EXISTS Log;
    CREATE TABLE Log(
	method enum('d','u','i'),
	table_name	VARCHAR(20),
	moment timestamp
    );
    END;
$function$;

CREATE OR REPLACE FUNCTION create_log()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    DROP TABLE if EXISTS Log;
    CREATE TABLE Log(
	method enum('d','u','i'),
	table_name	VARCHAR(20),
	moment timestamp
    );
    END;
$function$;

CREATE OR REPLACE FUNCTION create_log()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    DROP TABLE if EXISTS Log;
    CREATE TABLE Log(
	method enum('d','u','i'),
	table_name	VARCHAR(20),
	moment timestamp
    );
    END;
$function$;

CREATE OR REPLACE FUNCTION create_log()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    DROP TABLE if EXISTS Log;
    CREATE TABLE Log(
	method enum('d','u','i'),
	table_name	VARCHAR(20),
	moment timestamp
    );
    END;
$function$;

CREATE OR REPLACE FUNCTION createlog () 
RETURNS TRIGGER AS $$
BEGIN
IF (TG_OP = 'DELETE') THEN
INSERT INTO Log SELECT 'D', now();
RETURN OLD;
ELSIF (TG_OP = 'UPDATE') THEN
INSERT INTO Log SELECT 'U', now();
RETURN NEW;
ELSIF (TG_OP = 'INSERT') THEN
INSERT INTO Log SELECT 'I', now();
RETURN NEW;
END IF;
RETURN NULL; 
END;
$$ 
LANGUAGE plpgsql;

CREATE TRIGGER keeplog
AFTER INSERT OR UPDATE OR DELETE ON Log
FOR EACH ROW EXECUTE PROCEDURE createlog();

