package notespace;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.ArrayList;
import javax.swing.JPanel;

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
        Managment login = new Managment();
        login.setVisible(true);
    }
    public static boolean checkUser(String un, String password) throws Exception{
        boolean userexist = false;
        try {
            Class.forName (driverClassName);
            dbConnection = DriverManager.getConnection (url, username, passwd);
            statement    = dbConnection.createStatement();
            
            String selectString = "select checkuser('"+un+"','"+password+"');";
            rs = statement.executeQuery(selectString);
            while(rs.next()) {
                    userexist = rs.getBoolean("checkuser");
                    Connection.statement.close();
                    Connection.dbConnection.close();
		    return(userexist);
            }
        } catch (Exception e){System.out.println(e);}     
        return false;
    }
    
    public static ArrayList<String> search(String keyword, String table) throws Exception{
        ArrayList<String> names = new ArrayList<>();
        try {
            Class.forName (driverClassName);
            dbConnection = DriverManager.getConnection (url, username, passwd);
            statement    = dbConnection.createStatement();
            
            String selectString = "select search('"+keyword+"','"+table+"');";
            rs = statement.executeQuery(selectString);
            while(rs.next()) {
                names.add(rs.getString("search"));
            }
            Connection.statement.close();
            Connection.dbConnection.close();
            return names;
        } catch (Exception e){System.out.println(e);}     
        return null;
    }
    public static void delete(String keyword, JPanel table){
        try {
            Class.forName (driverClassName);
            dbConnection = DriverManager.getConnection (url, username, passwd);
            statement    = dbConnection.createStatement();
            
            if(table==Managment.getPanel)
            {
                System.out.println("This panelis artist")
            }



            String selectString = "select delete_artist('"+keyword+"','"+table+"');";
            rs = statement.executeQuery(selectString);
            
            Connection.statement.close();
            Connection.dbConnection.close();
        } catch (Exception e){System.out.println(e);}
    }
}
