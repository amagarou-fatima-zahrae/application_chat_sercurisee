package com.octest.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.octest.inscription.inscription;
import com.octest.update.update;

/**
 * Servlet implementation class Update
 */
@WebServlet("/Update")

public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

    public Update() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    update up = new update();
	    up.setUserParameter(request);
//		
     this.getServletContext().getRequestDispatcher("/WEB-INF/Update.jsp").forward(request, response);

	

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		update up = new update();
		String nom = request.getParameter("nom");
	    String prenom = request.getParameter("prenom");
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    String date = request.getParameter("daten");
	    String Etat = request.getParameter("etat");
	    String Profession = request.getParameter("profession");
	    String Description = request.getParameter("review");
		
	  
	    
		try {
		//	up.setUserParameter(request);
			HttpSession varS=request.getSession();
			
			int id= (Integer)varS.getAttribute("id");
			up.updateUser(id, nom, prenom, email, password,date,Etat,Profession,Description);
			//System.out.print("Donnes enregistrer");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		this.getServletContext().getRequestDispatcher("/Show").forward(request, response);
		
		
	}

}
