package notespace;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.Statement;

public class Connection {
        
    static String     driverClassName = "org.postgresql.Driver" ;
    static String     url = "jdbc:postgresql://dblabs.it.teithe.gr:5432/it174940" ;
    static java.sql.Connection dbConnection = null;
    static String     username = "it174940";
    static String     passwd = "4Kz_hxTw";
    static Statement  statement = null;

}
