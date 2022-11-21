CREATE OR REPLACE FUNCTION new_Producer(producer_name VARCHAR(15))
 RETURNS void
 LANGUAGE plpgsql
AS $function$
    BEGIN
    insert into Producer(name) values ($1);
    END;
$function$;