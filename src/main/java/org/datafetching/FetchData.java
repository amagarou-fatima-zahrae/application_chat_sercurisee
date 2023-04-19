package org.datafetching;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FetchData extends HttpServlet {
    private static final long serialVersionUID = 1L;

//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Connection conn = null;
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/application_chat_reseau", "root", "");
//            HttpSession varS=request.getSession();
//			int id= (Integer)varS.getAttribute("id");
//            PreparedStatement ps = conn.prepareStatement("select nom, prenom, id_contact,state from contact join utilisateur on contact.id_contact=utilisateur.id_user where contact.id_user="+id);
//            ResultSet rs = ps.executeQuery();
//            PrintWriter out = response.getWriter();
//
//           
//
//            while (rs.next()) {
//                int id2 = rs.getInt(3);
//                String nom = rs.getString(1);
//                String prenom = rs.getString(2);
//                String stateInit=(rs.getInt(4)==1)?"Connecte":"Deconnecte";
//               
//            }
//
//            out.println("</table>");
//            out.println("<script>");
//            out.println("function supprimerLigne(button, id) {");
//            out.println("var row = button.parentNode.parentNode;");
//            out.println("row.parentNode.removeChild(row);");
//            out.println("var xhr = new XMLHttpRequest();");
//            out.println("xhr.open('GET', 'FetchData?id2=' + id, true);");
//            out.println("xhr.send();");
//            out.println("}");
//            out.println("let socket = new WebSocket(\"ws://localhost:8082/chatApp/ServerEndpoint2?userID="+id+"\");\r\n"
//            		+ "	 socket.onopen = function(e) {\r\n"
//            		+ "		  console.log(\"[open] Connection established\");\r\n"
//            		+ "		  console.log(\"Sending to server\");\r\n"
//            		+ "		};"
//            		+ "socket.onmessage=function(event){\r\n"
//            		+ "			console.log(\"nouveau\");\r\n"
//            		+ "			  const Data = event.data;\r\n"
//            		+ "			  var objectR = JSON.parse(Data);\r\n"
//            		+ "console.log(objectR);\r\n"
//            		+ "let td=document.getElementById(objectR.id);\r\n"
//            		+ "if(objectR.state){\r\n"
//            		+ "td.textContent=\"Connecte\";\r\n"
//            		+ "}else{\r\n"
//            		+ "td.textContent=\"Deconnecte\";"
//            		+ "}}");
//            
//            out.println("</script>");
//            out.println("</body>");
//            out.println("</html>");
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                if (conn != null) {
//                    conn.close();
//                }
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 HttpSession varS=request.getSession();
		int id= (Integer)varS.getAttribute("id");
        String id2 = request.getParameter("id2");
        

        if (id2 != null && !id2.isEmpty()) {
        	int id3=Integer.parseInt(id2);
            Connection conn = null;
            PreparedStatement ps = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/application_chat_reseau", "root", "");
                ps = conn.prepareStatement("DELETE FROM contact WHERE (id_user = ? and id_contact=?) or (id_user = ? and id_contact=?)");
                ps.setInt(1, id);
                ps.setInt(2, id3);
                ps.setInt(3, id3);
                ps.setInt(4, id);
                ps.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (ps != null) {
                        ps.close();
                    }

                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            response.sendRedirect("FetchData");
        }
        request.setAttribute("id_user", id);
        
        this.getServletContext().getRequestDispatcher("/WEB-INF/display_contact.jsp").forward(request, response);
//
//        
    }
}