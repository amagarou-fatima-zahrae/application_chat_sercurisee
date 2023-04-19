package Compte;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import connexBD.MySQLDatabase;

/**
 * Servlet implementation class SuppMonCompte
 */
public class SuppMonCompte extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuppMonCompte() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			System.out.println("in do delete");
			Connection conn=MySQLDatabase.getConnexion();
			HttpSession varS=request.getSession();
			int id=(Integer)varS.getAttribute("id");
			PreparedStatement stmt1=conn.prepareStatement("delete from invitation where id_user_emetteur=? or id_user_recepteur=?");
			stmt1.setInt(1, id);
			stmt1.setInt(2,id);
			
			stmt1.executeUpdate();
			PreparedStatement stmt2=conn.prepareStatement("delete from contact where id_user=? or id_contact=?");
			
			stmt2.setInt(1,id);
			stmt2.setInt(2,id);
			stmt2.executeUpdate();
			PreparedStatement stmt3=conn.prepareStatement("delete from message where id_user_emetteur=? or id_user_recepteur=?");
			stmt3.setInt(1,id);
			stmt3.setInt(2,id);
			stmt3.executeUpdate();
			PreparedStatement stmt=conn.prepareStatement("delete from utilisateur where id_user=?");
			
				stmt.setInt(1,id);
				
				stmt.executeUpdate();
				System.out.println("delete done");

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

}
