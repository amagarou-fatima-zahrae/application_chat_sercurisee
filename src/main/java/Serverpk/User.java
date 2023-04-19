package Serverpk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.datafetching.MessageNotif;

import com.google.gson.*;

import connexBD.MySQLDatabase;
import jakarta.websocket.Session;

public class User {
//	private int id;
	private static ArrayList<Integer> usersConnectes = new ArrayList<Integer>();
//	public int getId() {
//		return id;
//	}
//	public void setId(int id) {
//		this.id = id;
//	}
	public static void addUser(int id) {
		
		usersConnectes.add(id);
//		System.out.println(usersConnectes);
		System.out.println("user ajoute !!!");
		notifyContacts(id, 1);
		ChangeStateBD(id, 1);
	}
	public static void ChangeStateBD(int id, int state) {
		
		try {
			Connection conn=MySQLDatabase.getConnexion();
			PreparedStatement stmt;
			stmt = conn.prepareStatement("update utilisateur set state=? where id_user=?");
			stmt.setInt(1,state);
			stmt.setInt(2, id);
			stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public static void removeUser(Integer id) {
		System.out.println("start removing");
		usersConnectes.remove(id);
		System.out.println("start removing2");
		notifyContacts(id, 0);
		System.out.println("start removing3");
		ChangeStateBD(id, 0);
		System.out.println("finish removing");
	}
	public static ArrayList<Integer> fetchContacts(int id) {
		try {
		ArrayList<Integer> contacts = new ArrayList<Integer>();
		Connection conn=MySQLDatabase.getConnexion();
		PreparedStatement stmt=conn.prepareStatement("select id_contact from contact where id_user=?");
		stmt.setInt(1,id);
		ResultSet resultat=stmt.executeQuery();
		if(resultat.next()) {
			contacts.add(resultat.getInt(1));
		}
		return contacts;
		} catch (SQLException e) {
			System.out.println("Probleme dans la fonction fetchContacts");
			return null;
		}
	}
	public static void notifyContacts(int id, int state) {
		ArrayList<Integer> contacts = fetchContacts(id);
		 
		if(contacts!=null) {
			for (Integer contact : contacts) {
				System.out.println( ServerEndpoint2.getObservers());
			      if(ServerEndpoint2.getObservers().containsKey(contact)) {
			    	  Session session=ServerEndpoint2.getObservers().get(contact);
			    	  MessageNotif msg=new MessageNotif(id, state);
			    	  System.out.println(session);
			    	  System.out.println("msg vers id= "+msg);
			    	  Gson gson = new Gson();
			    	  
			    	  String msgjson = gson.toJson(msg);
			    	  ServerEndpoint2.sendMsgNotif(session, msgjson);
			    	  System.out.println("doooone!!!");
			      }
			      System.out.println("in!!!");
			    }
			System.out.println("out!!!");
		}
		
		
	}
	
	
}