package notespace;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.ArrayList;
import java.util.Arrays;
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
        String[] args ;
        try {
            Class.forName (driverClassName);
            dbConnection = DriverManager.getConnection (url, username, passwd);
            statement    = dbConnection.createStatement();
            String selectString = "";
            if (table=="Artist" || table == "Producer") {
                selectString = "select search('"+keyword+"','"+table+"');";
                rs = statement.executeQuery(selectString);
                while(rs.next()) {
                    names.add(rs.getString("search"));
                }
                Connection.statement.close();
                Connection.dbConnection.close();
                return names;
            }
            else if(table=="Album"){
                args = keyword.split(",");
                for (int i = 0; i <args.length; i++) {
                    if(args[i].equals(" ")){
                        args[i]="null";
                    }
                    else{
                        args[i] = "\'"+args[i]+"\'";
                    }
                }
                selectString = "select search_album("+args[0]+","+args[1]+","+args[2]+");";
                rs = statement.executeQuery(selectString);
                while(rs.next()) {
                    names.add(rs.getString("search_album"));
                }
                Connection.statement.close();
                Connection.dbConnection.close();
                return names;
            }
            else if(table=="Song"){
                String filter = Managment.getSongFilter();
                
                selectString = "select search_song('"+keyword+"','";
                if(filter.equals("Name")){ 
                    selectString += "by_name"+"');";
                }
                else if(filter.equals("Album")){ 
                    selectString += "by_album"+"');";
                }
                else if(filter.equals("Artist"))
                {
                    selectString += "by_artist"+"');";
                }
                else if(filter.equals("Producer"))
                {
                    selectString += "by_song"+"');";
                }
                else if(filter.equals("Category"))
                {                
                    selectString += "by_category"+"');";
                }
                
                rs = statement.executeQuery(selectString);
                while(rs.next()) {
                    names.add(rs.getString("search_song"));
                }
                Connection.statement.close();
                Connection.dbConnection.close();
                return names;
            }
            
            Connection.statement.close();
            Connection.dbConnection.close();
            return names;
        } catch (Exception e){System.out.println(e);}     
        return null;
    }
    public static void delete(String keyword, String table){
        try {
            Class.forName (driverClassName);
            dbConnection = DriverManager.getConnection (url, username, passwd);
            statement    = dbConnection.createStatement();
            
            String selectString = "select delete('"+keyword+"','"+table+"');";
            rs = statement.executeQuery(selectString);
            
            Connection.statement.close();
            Connection.dbConnection.close();
        } catch (Exception e){System.out.println(e);}
    }
}
