CREATE OR REPLACE FUNCTION checkuser(user VARCHAR(30),pass VARCHAR(30))
 RETURNS Boolean
 LANGUAGE plpgsql
AS $function$
    BEGIN
    select * from user where user=username and pass=pwd;
    END;
$function$;

select checkuser('xristos','skata1');