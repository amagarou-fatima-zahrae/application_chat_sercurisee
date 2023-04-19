package com.chaApp.models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import Securite.AESCrypter;
import Securite.CesarEncryptionUtil;
import Securite.CryptageAES;
import connexBD.MySQLDatabase;

public class MessageRecus {

	public  ArrayList<Message> recupererMessages(int id_rec,int emet){
		 ArrayList<Message> messagesRecus=new ArrayList<Message>();
		 
		 PreparedStatement ps = null;
		 ResultSet rs = null;
		 String contenuDecrypte ="";
		 Connection conn = MySQLDatabase.getConnexion();
		 try {
			ps = conn.prepareStatement("select * from message where id_user_recepteur=? and id_user_emetteur=?");
			ps.setInt(1,id_rec);
			ps.setInt(2,emet);
			rs = ps.executeQuery();			
			while(rs.next()) {
				int id_msg = rs.getInt("id_msg");
				int id_user_emetteur=rs.getInt("id_user_emetteur");
				int id_user_recepteur=rs.getInt("id_user_recepteur");
				String type_msg= rs.getString("type_msg") ;
				String date_envoi=rs.getString("date_envoi") ;
				String cle = CesarEncryptionUtil.decrypt(rs.getString("cle_sym")) ;
				System.out.println("message recus select=> key avant decryptage : "+rs.getString("cle_sym")+ "aprés decryptage: "+cle);
				String contenu=rs.getString("contenu");
				try {
					byte[] decodedKey = Base64.getDecoder().decode(cle);
					 SecretKey key = new SecretKeySpec(decodedKey, 0, decodedKey.length, "AES");
					 
					 String[] byteValues =contenu.substring(1, contenu.length() - 1).split(", ");
				     byte[] messageBytes = new byte[byteValues.length];
				     for (int i = 0; i < byteValues.length; i++) {
				    	 messageBytes[i] = Byte.parseByte(byteValues[i]);
				     }
					
					 contenuDecrypte = CryptageAES.dechiffrerMessage(messageBytes, key);
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				Message m = new Message(type_msg,contenuDecrypte, id_user_recepteur, id_user_emetteur, date_envoi);
				messagesRecus.add(m);
			}
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 return messagesRecus;
	}
	
	public int nombreMessages(int id_rec,int id_emet){
		int  count=0; 
		
		 PreparedStatement ps = null;
		 ResultSet rs = null;
		 Connection conn = MySQLDatabase.getConnexion();
		 try {
			ps = conn.prepareStatement("select count(*) as nbr from message where id_user_recepteur=? and id_user_emetteur=?");
			ps.setInt(1,id_rec);
			ps.setInt(2,id_emet);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				count =rs.getInt("nbr");
			}
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return count;
	}
	
	public ArrayList<Message> derniersMessages(int id_rec) {
		ArrayList<Message> derniersMessages=new ArrayList<Message>();
		Message m=null;
		PreparedStatement ps = null;
		 ResultSet rs = null;
		 Connection conn = MySQLDatabase.getConnexion();
		 System.out.println("dernier messg");
		 String contenuDecrypte="";
		 try {
			ps = conn.prepareStatement("SELECT m.* FROM message m,(SELECT id_user_emetteur, MAX(STR_TO_DATE(date_envoi, '%d-%m-%Y %H:%i:%s')) AS max_date FROM message WHERE id_user_recepteur = ? GROUP BY id_user_emetteur ) t where m.id_user_recepteur = ? and  m.id_user_emetteur = t.id_user_emetteur AND STR_TO_DATE(m.date_envoi, '%d-%m-%Y %H:%i:%s') = t.max_date;");
			ps.setInt(1,id_rec);
			ps.setInt(2,id_rec);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int id_msg = rs.getInt("id_msg");
				int id_user_emetteur=rs.getInt("id_user_emetteur");
				int id_user_recepteur=rs.getInt("id_user_recepteur");
				String type_msg= rs.getString("type_msg") ;
				String date_envoi=rs.getString("date_envoi");
				String cle = CesarEncryptionUtil.decrypt(rs.getString("cle_sym")) ;
				System.out.println("message recus dernier => key avant decryptage : "+rs.getString("cle_sym")+ "aprés decryptage: "+cle);
				String contenu="";
				try {
					
					contenu =rs.getString("contenu");
					byte[] decodedKey = Base64.getDecoder().decode(cle);
					 SecretKey key = new SecretKeySpec(decodedKey, 0, decodedKey.length, "AES");
					 
					 String[] byteValues =contenu.substring(1, contenu.length() - 1).split(", ");
				     byte[] messageBytes = new byte[byteValues.length];
				     for (int i = 0; i < byteValues.length; i++) {
				    	 messageBytes[i] = Byte.parseByte(byteValues[i]);
				     }
					
					 contenuDecrypte = CryptageAES.dechiffrerMessage(messageBytes, key);
				     
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				 m = new Message(type_msg,contenuDecrypte, id_user_recepteur, id_user_emetteur, date_envoi);
				 derniersMessages.add(m);
			}
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return derniersMessages;
		
	}
	
public void insertMessage(String typeMsg, String contenu, int id_recepteur, int id_emetteur, String date_envoi,String cle) {
	 ResultSet rs = null;
	 PreparedStatement ps = null;
	Connection conn = MySQLDatabase.getConnexion();
	
    try {
		ps = conn.prepareStatement("INSERT INTO message( id_user_emetteur, id_user_recepteur, type_msg, date_envoi, contenu,cle_sym) VALUES (?,?,?,?,?,?)");
		ps.setInt(1, id_emetteur);
	    ps.setInt(2, id_recepteur);
	    ps.setString(3, typeMsg);
	    ps.setString(4, date_envoi);
	    ps.setString(5,contenu);
	    System.out.println("en insert cle = "+cle);
	    ps.setString(6,cle);
	    ps.executeUpdate();

	    conn.close();
    } catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    
	}
//////////////////////////////////
public void supprimerMessages(int id_rec,int id_emet) {
	 ResultSet rs = null;
	 PreparedStatement ps = null;
	Connection conn = MySQLDatabase.getConnexion();
	System.out.println("suppr");
   try {
		ps = conn.prepareStatement("delete from message where id_user_recepteur=? and id_user_emetteur=?");
	    ps.setInt(1, id_rec);
	    ps.setInt(2, id_emet);
	    ps.executeUpdate();
	    System.out.println("fin supp");
	    conn.close();
   } catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
  }
	
}
