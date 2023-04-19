package web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class AcceptInvit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		

		try {
			  Class.forName("com.mysql.cj.jdbc.Driver");
			  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/application_chat_reseau", "root", "");

			
				
				PreparedStatement sel=con.prepareStatement("SELECT * FROM invitation WHERE id_invit=?");
				sel.setString(1,id);
				ResultSet rs=sel.executeQuery();
				
				  PreparedStatement pst=con.prepareStatement("Delete from  invitation  where id_invit=?");
					pst.setString(1,id);
					pst.executeUpdate();
				
				if(rs.next()) {
					PreparedStatement ins=con.prepareStatement("INSERT INTO contact(id_user,id_contact) VALUES (?,?) ");
					ins.setInt(1,rs.getInt(2));
					ins.setInt(2,rs.getInt(3));
					ins.executeUpdate();
					ins.close();
					PreparedStatement ins2=con.prepareStatement("INSERT INTO contact(id_user,id_contact) VALUES (?,?) ");
					ins2.setInt(1,rs.getInt(3));
					ins2.setInt(2,rs.getInt(2));
					ins2.executeUpdate();
					ins2.close();
					response.sendRedirect("show_invit.jsp");
				}
				
				
				
			
		

				
			
			
			pst.close();
			con.close();
			
		}catch(Exception e){
			System.out.print(e);
		}
	}


}
