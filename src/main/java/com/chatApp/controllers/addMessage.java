package com.chatApp.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Calendar;
import java.util.UUID;

import com.chaApp.models.DAOUser;
import com.chaApp.models.Message;
import com.chaApp.models.MessageRecus;
import com.chaApp.models.Utilisateur;

import connexBD.MySQLDatabase;


public class addMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public addMessage() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		HttpSession session = request.getSession();
		int id_cli = (Integer)session.getAttribute("id");
		MessageRecus messageRecus = new MessageRecus();
		request.setAttribute("Messages", messageRecus.recupererMessages(id_cli,Integer.parseInt(id)));
		
		request.setAttribute("id_rec",id);
		request.setAttribute("id",id_cli);
		 Utilisateur user_rec = DAOUser.recupererUser(id_cli);
         Utilisateur user_emet = DAOUser.recupererUser(Integer.parseInt(id));
         request.setAttribute("user_emet",user_emet);
 		 request.setAttribute("user_rec",user_rec);
 		 
		this.getServletContext().getRequestDispatcher("/addMessage.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//this.getServletContext().getRequestDispatcher("/WEB-INF/hello.jsp").forward(request, response);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}   
	}

}