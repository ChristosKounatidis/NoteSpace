CREATE OR REPLACE new_log_file()
RETURNS TRIGGER AS $$
BEGIN
    CREATE IF EXISTS TABLE log_file(
        operation char(1) not null,
         timestamp not null ,

    )
END;
$$ 
LANGUAGE plpgsql;


