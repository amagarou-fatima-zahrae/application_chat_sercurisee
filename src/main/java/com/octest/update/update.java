package com.octest.update;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import com.octest.InfoUser;

import Securite.AESCrypter;
import connexBD.MySQLDatabase;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class update {

	
	

	public void setUserParameter(HttpServletRequest request) throws IOException {
		Connection con=MySQLDatabase.getConnexion();
		// ResultSet rs = null;
		//ResultSet rs1 = null;
		  ResultSet result = null;
		  InfoUser user = new InfoUser();
		 // System.out.print("Je suis hhhhhhhhhhhhhhhhh");
		  
			  
			try {
				//System.out.print("How");
				 //  rs = con.createStatement().executeQuery("Select * from Utilisateur where id_user = 2");
			//	System.out.print("Je suis Immmmmmmmmmmmmmmmane");
				HttpSession varS=request.getSession();
			
				int id= (Integer)varS.getAttribute("id");
				PreparedStatement statement = con.prepareStatement("Select * from Utilisateur where id_user = "+id);
		            //statement.setInt(1, userId);
                    //  System.out.print("Je suis Etudiant");
		            // Exécuter la requête SQL et récupérer les résultats
		             result = statement.executeQuery();
		           //  System.out.print("Je suis Resultat");
		             if(result.next()) {
		            	 System.out.print("HIiiiiiiiiii");
		            	// System.out.print(result.getInt("id_user"));
		            	 //System.out.print("Hiiiiiiiiiiiiii");
		            	 user.setId(result.getInt("id_user"));
		            	 user.setNom(result.getString("nom"));
		            	 user.setPassword(result.getString("password"));
		            	 user.setPrenom(result.getString("prenom"));
		            	 user.setEmail(result.getString("email"));
		            	// String date = result.getString("dateNaissance");
		            	//user.setDateNaissance(result.getDate("dateNaissance"));
		            	user.setDateNaissance(result.getString("dateNaissance"));
		            	// SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
		            	 //user.setDateNaissance(result.getString("dateNaissance"));
		            	 //System.out.print("Jesuiiiiiiiiiiiiiiiii"+result.getString("etatFamiliale"));
		            	 user.setEtatFamiliale(result.getString("etatFamiliale"));
		            	 user.setProfession(result.getString("profession"));
		            	 user.setDescription(result.getString("description")); 
		            	// System.out.println("cc"+result.getString("description"));
		            	// System.out.print("hhhhhhhhhhhhhhhhhhhhhh"+result.getString("description"));
		             }
		             request.setAttribute("user", user);
		        ///   System.out.print("hiii"+user);    
		         
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		//	System.out.println("this"+rs);
			


		 
		 
		
	}
	
	 public void updateUser(int id, String nom, String prenom, String email, String password,String dateNaissance,String etatFamiliale,String profession,String description) 
             throws SQLException {			
		 String encryptedPassword=null;
		 try {
			 encryptedPassword = AESCrypter.encrypt(password);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

     String sql = "UPDATE Utilisateur SET nom = ?, prenom = ?, email = ?,password = ?,dateNaissance=?,etatFamiliale=?,profession=?,description=? WHERE id_user = "+id;		       
    try {
    	Connection con=MySQLDatabase.getConnexion();
     
     PreparedStatement statement ;
     statement = con.prepareStatement(sql);

     
     statement = con.prepareStatement(sql);
     statement.setString(1, nom);
     statement.setString(2, prenom);
     statement.setString(3, email);
     statement.setString(4,encryptedPassword);
     statement.setString(5, dateNaissance);
     statement.setString(6, etatFamiliale);
     statement.setString(7, profession);
     statement.setString(8, description);
   
   //  statement.setInt(4, 1);
    
     statement.executeUpdate();}
    catch (SQLException e) {

		e.printStackTrace();

}
    
   
	
}
	
	
}

