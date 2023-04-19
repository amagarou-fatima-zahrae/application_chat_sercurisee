package com.chaApp.models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connexBD.MySQLDatabase;

public class DAOUser {
	
	public static Utilisateur recupererUser(int id){
		Utilisateur u = null;
		 PreparedStatement ps = null;
		 ResultSet rs = null;
		 Connection conn = MySQLDatabase.getConnexion();
		 try {
			ps = conn.prepareStatement("select * from utilisateur where id_user=?");
			ps.setInt(1, id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				String nom = rs.getString("nom");
				String prenom = rs.getString("prenom");
				String email = rs.getString("email");
				String photo= rs.getString("photo");
				u = new Utilisateur(nom, prenom, email,photo);
				
			}
		 } catch (SQLException e) {
			System.out.println("error DAOuser");
			e.printStackTrace();
		}
		
		 return u;
	}
}
