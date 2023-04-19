package com.chatApp.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.chaApp.models.MessageRecus;

/**
 * Servlet implementation class ListeMessages
 */
public class ListeMessages extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListeMessages() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession varS=request.getSession();
		
		int id_client= (Integer)varS.getAttribute("id");
//		session.setAttribute("id_client", 1);
		System.out.println("liste de dernier messages");
		MessageRecus messageRecus = new MessageRecus();
		request.setAttribute("id",id_client);
		request.setAttribute("derniersMessages", messageRecus.derniersMessages(id_client));
		this.getServletContext().getRequestDispatcher("/WEB-INF/views/listeMessages.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}