package com.octest.inscription;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Securite.AESCrypter;
import connexBD.MySQLDatabase;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Part;

public class inscription {
	
	public void setUserParameter(String nom, String prenom, String email, String password, String dateN, String EtatF, String Profession, String Description, String path) throws Exception {
		Connection con = MySQLDatabase.getConnexion();

		PreparedStatement ps;

		try {
			// Encrypt the password
			String encryptedPassword = AESCrypter.encrypt(password);

			ps = con.prepareStatement("INSERT INTO Utilisateur (nom, prenom, email, password, dateNaissance, etatFamiliale, profession, description, photo) VALUES (?,?,?,?,?,?,?,?,?)");

			ps.setString(1, nom);
			ps.setString(2, prenom);
			ps.setString(3, email);
			ps.setString(4, encryptedPassword);
			ps.setString(5, dateN);
			ps.setString(6, EtatF);
			ps.setString(7, Profession);
			ps.setString(8, Description);
			ps.setString(9, path);

			System.out.println("insert");
			ps.executeUpdate();

			System.out.println(path);
			System.out.println("execute");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
