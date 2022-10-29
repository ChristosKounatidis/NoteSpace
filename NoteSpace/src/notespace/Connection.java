package notespace;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.Statement;

public class Connection {
    Credentials login = new Credentials();
    
    static String driverClassName = "org.postgresql.Driver" ;
    static String url = "jdbc:postgresql://dblabs.it.teithe.gr:5432/it174940" ;
    static java.sql.Connection dbConnection = null;
    String username = login.getUsername();
    String passwd = login.getPasswd();
    static Statement  statement = null;

}
