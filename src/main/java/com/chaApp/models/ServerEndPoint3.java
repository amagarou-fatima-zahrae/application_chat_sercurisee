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

import com.google.gson.Gson;

import Securite.CesarEncryptionUtil;
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
@ServerEndpoint("/ServerEndPoint3")
public class ServerEndPoint3 {
	private Session session;
	static private HashMap<Integer, Session> sessions = new HashMap<Integer, Session>();
	private int id;
	
@OnOpen
public void onOpen(Session session) {
	 String queryString = session.getQueryString();
     String[] params = queryString.split("=");
     String userID = params[1];
     System.out.println("WebSocket liste messages connection opened by userID " + userID);   
	 this.session=session;
	 this.id=Integer.parseInt(userID);
     sessions.put(this.id, session);
    
    System.out.println("connnneeected page liste user"+ this.id);
    System.out.println("sessions liste "+sessions);
}

public static void communication_servers(int id_emet, String messageR) {
	Session userSession=null;
	int userId=0;
    System.out.println("Received text message au serv3: " + messageR);
    JSONParser parser = new JSONParser(messageR);
 try {
	  Object obj = parser.parse();
	  LinkedHashMap msg = (LinkedHashMap)obj;

	  int id_rec =Integer.parseInt((String)msg.get("recepteurId"));
	  String message = (String)msg.get("content");
	  String type = (String)msg.get("type");
	  String key = (String)msg.get("key");
	 // String sub= message.substring(0,message.length()-4);
	  userSession = sessions.get(Integer.valueOf(id_rec));	
	  Timestamp timestamp = new Timestamp(System.currentTimeMillis());
	   SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
	    String dateEnvoi = dateFormat.format(timestamp);
	    Utilisateur user = (new DAOUser()).recupererUser(id_emet);
//	    if(!type.equals("text")) {
//	    	message=sub;
//	    }
	     MessageJson messg = new MessageJson(key,id_rec,message,type,id_emet,dateEnvoi,user.getNom(),user.getPrenom(),user.getPhoto());
	     Gson gson = new Gson();
	     System.out.println("message serv3 "+message.length());
	  String msgjson = gson.toJson(messg);
      System.out.println("msgjson "+msgjson);
      //System.out.println("message "+message+" ,sub "+sub);
		MessageRecus ms = new MessageRecus();
   	  if ((userSession != null))
     	   {
     		System.out.println("found ouvert liste des discussions");
     		userSession.getAsyncRemote().sendText(msgjson);
     		 
     		} 
     	    else 
     	   {
     	    	System.out.println("NOT found ouvert liste des discussions => BD");
 		
    		}
   	  String cleCr = CesarEncryptionUtil.encrypt(key);
   	System.out.println("server 3 => key avant cryptage : "+key + "aprés cryptage: "+cleCr);
   	      ms.insertMessage(type,message,id_rec ,id_emet, dateEnvoi,cleCr);
        }catch (ParseException e) {
        	// TODO Auto-generated catch block
        	e.printStackTrace();
        }
}

@OnClose
public void onClose(Session session) {
    // Code pour gérer la fermeture de la connexion WebSocket
	sessions.remove(this.id, session);
	this.session=null;
	System.out.println("closed.liste messages.!");
	 System.out.println("sessions apres close liste "+sessions);
}

}