package com.chaApp.models;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.URLConnection;
import java.nio.ByteBuffer;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import org.apache.tomcat.util.json.JSONParser;
import org.apache.tomcat.util.json.ParseException;

import jakarta.websocket.EncodeException;
import jakarta.websocket.OnClose;
import jakarta.websocket.OnError;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.SendHandler;
import jakarta.websocket.SendResult;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;
import jakarta.json.*;



//import jakarta.websocket.OnOpen;
//import jakarta.websocket.server.ServerEndpoint;
@ServerEndpoint("/ServerEndPoint")
public class ServerEndPoint {
	private Session session;
	static private HashMap<Integer, Session> sessions = new HashMap<Integer, Session>();
	static private HashMap<Integer, Integer> discussions = new HashMap<Integer, Integer>();
	
	private int id;
	
@OnOpen
public void onOpen(Session session) {
	 String queryString = session.getQueryString();
     String[] params = queryString.split("=");
     String userID = params[1];
     String userDisc = params[2];
    
     System.out.println("url "+queryString);
     
     System.out.println("WebSocket connection opened by userID " + userID);
     System.out.println("WebSocket connection opened with user " +userDisc);
   
	this.session=session;
	this.id=Integer.parseInt(userID);
     sessions.put(this.id, session);
     discussions.put(this.id, Integer.parseInt(userDisc));
    
    System.out.println("connnneeected");
    
    
    System.out.println("sessions: "+sessions);
   
    System.out.println("descussions: "+discussions);
 
}
public static int peerOfMyFriend(int idf,int idm) {
	System.out.println("est ce que user en disc avec moi ");
	 int userAvec =(discussions.get(Integer.valueOf(idf))!=null)? discussions.get(Integer.valueOf(idf)):0;
	 System.out.println("userAvec "+userAvec);
	  if (userAvec==idm)
 	   {
 		  System.out.println("found");
 		   return 1;
 		 
 		} 
	  else {
		  return -1;
	  }

}
@OnMessage
public void onTextMessage(String messageR,Session session) {
	System.out.println("message json server 1 "+messageR);
	Session userSession=null;
	 int userId=0;
  System.out.println("Received text message: " + messageR);
  JSONParser parser = new JSONParser(messageR);
  try {
	  Object obj = parser.parse();
	  LinkedHashMap msg = (LinkedHashMap)obj;

	  int id_rec =Integer.parseInt((String)msg.get("recepteurId"));
	 // String message = (String)msg.get("content");
	  String type = (String)msg.get("type");
	 System.out.println("id_rec "+id_rec);
	 
	 System.out.println("message "+msg.get("content"));
	  userSession = sessions.get(Integer.valueOf(id_rec));
	 // System.out.println("res :"+discussions.get(Integer.valueOf(id_rec)));
	  int userAvec =(discussions.get(Integer.valueOf(id_rec))!=null)? discussions.get(Integer.valueOf(id_rec)):0;
	  System.out.println("userAvec "+userAvec);
    	  if ((userSession != null) && (userAvec==this.id))
      	   {
      		  System.out.println("found");
      		userSession.getAsyncRemote().sendText(messageR);
      		 
      		} 
      	    else 
      	    {
             
//      			for (Map.Entry<Integer, Session> entry : sessions.entrySet()) {
//      			    if (entry.getValue() == session) {
//      			        userId = entry.getKey();
//      			       
//      			        break;
//      			    }
//      			}
      	    	System.out.println("appel au serv3");      	    
      			ServerEndPoint3.communication_servers(this.id,messageR);
      			System.out.println("aprés appel au serv3");
      		}

} catch (ParseException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
  
}


@OnClose
public void onClose(Session session) {
    // Code pour gérer la fermeture de la connexion WebSocket
	sessions.remove(this.id, session);
	//sessions.remove(this.session);
	discussions.remove(this.id);
	this.session=null;
	System.out.println("closed..!");
	 
    System.out.println("close sessions: "+sessions);
   
    System.out.println(" close descussions: "+discussions);
}

}