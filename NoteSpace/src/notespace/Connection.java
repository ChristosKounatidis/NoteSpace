package notespace;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Connection {
    static String username = "postgres";
    static String passwd = "skata1";
    static String driverClassName = "org.postgresql.Driver" ;
    static String url = "jdbc:postgresql://localhost:5432/postgres" ;
    static java.sql.Connection dbConnection = null;
    static Statement  statement = null;
    static ResultSet rs	= null;

    public static void main (String[] argv) throws Exception{
        //Class.forName (driverClassName);
        //dbConnection = DriverManager.getConnection (url, username, passwd);
        //statement    = dbConnection.createStatement();
        
        //String selectString = "select * from artist"; //test query
        
        //rs = statement.executeQuery(selectString);
        
        /* //test
        while(rs.next()) {
		int rating = rs.getInt("id");
                String mage = rs.getString("name");
		System.out.println( rating + "        " + mage );
	}
        */
        //statement.close();
        //dbConnection.close();
        NoteSpaceLogin login = new NoteSpaceLogin();
        login.setVisible(true);
    }
    public static boolean checkUser(String un, String password) throws Exception{
        try {
            Class.forName (driverClassName);
            dbConnection = DriverManager.getConnection (url, username, passwd);
            statement    = dbConnection.createStatement();
            
            String selectString = "select checkuser('"+un+"','"+password+"');";
            rs = statement.executeQuery(selectString);
            while(rs.next()) {
		return(rs.getBoolean("checkuser"));
            }
        } catch (Exception e){System.out.println(e);}     
        return false;
    }
    
    public static String searchArtist(String keyword) throws Exception{
        try {
            Class.forName (driverClassName);
            dbConnection = DriverManager.getConnection (url, username, passwd);
            statement    = dbConnection.createStatement();
            
            String selectString = "select search_artist('"+keyword+"');";
            rs = statement.executeQuery(selectString);
            String set = "";
            while(rs.next()) {
                return(rs.getString("search_artist"));
            }
            
        } catch (Exception e){System.out.println(e);}     
        return "";
    }
}
