package notespace;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.Statement;

public class Connection {
    static String username = "postgres";
    static String passwd = "skata1";
    static String driverClassName = "org.postgresql.Driver" ;
    static String url = "jdbc:postgresql://localhost:5432/postgres" ;
    static java.sql.Connection dbConnection = null;
    static Statement  statement = null;
    static ResultSet rs	= null;

    public static void main (String[] argv) throws Exception{
        Class.forName (driverClassName);
        dbConnection = DriverManager.getConnection (url, username, passwd);
        statement    = dbConnection.createStatement();
        
        String selectString = "select * from artist";
        
        rs = statement.executeQuery(selectString);
        
        while(rs.next()) {
		int rating = rs.getInt("id");
                String mage = rs.getString("name");
		System.out.println( rating + "        " + mage );
	}

        statement.close();
        
        dbConnection.close();
    }

}
