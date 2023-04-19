package Serverpk;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map.Entry;

import org.datafetching.MessageNotif;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.OnClose;
import jakarta.websocket.OnError;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;

//import jakarta.websocket.OnOpen;
//import jakarta.websocket.server.ServerEndpoint;
@ServerEndpoint("/ServerEndpoint2")
public class ServerEndpoint2 {
	private static  HashMap<Integer, Session> observers = new HashMap<Integer, Session>();
	private Session session;
	private int id;
    @OnOpen
    public void onOpen(Session session) {
    	
    	System.out.println("connnneeected");
    	this.session=session;
    	System.out.println("cc1");
    	String queryString = session.getQueryString();
    	System.out.println("cc2");
    	System.out.println(queryString);
        String[] params = queryString.split("=");
        System.out.println("cc3");
        String userID  = params[1];
        System.out.println("userId= " +userID);
        this.id=Integer.parseInt(userID);
    	System.out.println("still connnneeected");
//    	ServletContext servletContext = (ServletContext) session.getUserProperties().get(jakarta.servlet.ServletContext.class.getName());
//        HttpSession httpSession = (HttpSession) session.getUserProperties().get(HttpSession.class.getName());
//        System.out.println("httpSession: " + httpSession);
//        String id = (String) httpSession.getAttribute("id");
//        System.out.println("this is id= : " + id);

        // Store the 'a' variable in the map
//        sessions.put(1, session);
//    	int id=Integer.valueOf((String)session.getRequestParameterMap().get("id").get(0));
    	System.out.println("still connnneeected 2");
    	observers.put(this.id, session);
    	System.out.println("still connnneeected 3");
//    	System.out.println(session);
    	
        
    }
    public static HashMap<Integer, Session> getObservers(){
    	return observers;
    }
    public static void sendMsgNotif(Session session, String msg) {
    	System.out.println("yallaaaah");
    	 session.getAsyncRemote().sendText(msg);
    }
//    @OnMessage
//    public void onMessage(String message, Session session) {
//        System.out.println("received msg= "+message);
//        for (Entry<Integer, Session> entry : sessions.entrySet()) {
//            if(entry.getKey()==1) {
//            	entry.getValue().getAsyncRemote().sendText("response from server: "+message);
//            }
//          }
//

       
//    }

    @OnClose
    public void onClose() {
        // Code pour gérer la fermeture de la connexion WebSocket
    	observers.remove(this.id);
    	this.session=null;
    	this.id=-1;
    	System.out.println("closed..!");
    	
//    	HttpSession varS=request.getSession();
//		varS.setAttribute("id", resultat.getInt(2));
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        // Code pour gérer les erreurs WebSocket
    }
}

