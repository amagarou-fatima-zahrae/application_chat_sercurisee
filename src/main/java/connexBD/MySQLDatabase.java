package connexBD;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class  MySQLDatabase{
	
	   public static Connection getConnexion(){
		   Connection conn=null;
	        try {
	            Class.forName("com.mysql.jdbc.Driver");
	            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/application_chat_reseau", "root", "");

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        
			return  conn;
	    }
}