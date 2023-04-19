package web;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class Refuser
 */
public class Refuser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		

		try {
			  Class.forName("com.mysql.cj.jdbc.Driver");
			  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/application_chat_reseau", "root", "");
			  
				PreparedStatement pst=con.prepareStatement("Delete from  invitation  where id_invit=?");
				pst.setString(1,id);
			
				pst.executeUpdate();
			
				response.sendRedirect("show_invit.jsp");
		

				
			
			
			pst.close();
			con.close();
			
		}catch(Exception e){
			System.out.print(e);
		}
	}

}
