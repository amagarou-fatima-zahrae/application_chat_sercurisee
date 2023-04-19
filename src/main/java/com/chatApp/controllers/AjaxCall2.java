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
 * Servlet implementation class AjaxCall2
 */
public class AjaxCall2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCall2() {
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
		//doGet(request, response);
		response.setHeader("Access-Control-Allow-Origin","*");
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			System.out.println("ajax call 2");
			System.out.println("id descussion "+id);
			//HttpSession session = request.getSession();
			//System.out.println("(Integer)session.getAttribute(\"id\") "+(Integer)session.getAttribute("id"));
			//int id_cli = (Integer)session.getAttribute("id");
			int id_cli=Integer.parseInt(request.getParameter("id2"));
			System.out.println("id_cli"+id_cli);
			System.out.println("hi i'm quit");
		    new MessageRecus().supprimerMessages(id_cli,id);
		    System.out.println("After call supp");
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
