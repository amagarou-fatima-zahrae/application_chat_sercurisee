package web;

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

public class contactsservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/application_chat_reseau", "root", "");
            HttpSession varS=request.getSession();
			int id= (Integer)varS.getAttribute("id");
            PreparedStatement ps = conn.prepareStatement("select nom, prenom, id_contact from contact join utilisateur on contact.id_contact=utilisateur.id_user where contact.id_user="+id);
            ResultSet rs = ps.executeQuery();
            PrintWriter out = response.getWriter();

            request.setAttribute("result_set", rs);
            request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
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
            response.sendRedirect("fetchData");
        }
		this.getServletContext().getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);

        
    }
}