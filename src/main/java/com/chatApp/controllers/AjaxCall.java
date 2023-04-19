package com.chatApp.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Arrays;
import java.util.Base64;

import javax.crypto.SecretKey;

import jakarta.servlet.http.Part;

import com.chaApp.models.MessageJson;
import com.chaApp.models.MessageRecus;
import com.google.gson.Gson;

import Securite.AESCrypter;
import Securite.CryptageAES;

/**
 * Servlet implementation class AjaxCall
 */
@MultipartConfig
public class AjaxCall extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCall() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
//		response.setHeader("Access-Control-Allow-Origin","*");
//		try {
//			int id = Integer.parseInt(request.getParameter("id"));
//			System.out.println("ajax call 1");
//			System.out.println("id descussion "+id);
//			HttpSession session = request.getSession();
//			int id_cli = (Integer)session.getAttribute("id");
//			System.out.println(id_cli);
//			System.out.println("hi i'm quit");
//		    new MessageRecus().supprimerMessages(id_cli,id);
//		    System.out.println("After call supp");
//		}catch(Exception e) {
//			System.out.println(e.getMessage());
//		}
	  // this.getServletContext().getRequestDispatcher("/WEB-INF/views/header.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setHeader("Access-Control-Allow-Origin","*");
		    System.out.println("ajax call 1"); 
		    PrintWriter pw = response.getWriter();
		    Part filePart = request.getPart("message");
		    String fileName = filePart.getSubmittedFileName();
		    System.out.println("filePart :"+filePart);
		    System.out.println("fileName :"+fileName);
		    try {
		    	String uploadFolder ="D:/projet/WebChat/src/main/webapp/uploads"; // replace with the actual path to your folder
			   
			    Path filePath = Paths.get(uploadFolder, fileName);
			    String p=uploadFolder+"/"+fileName;
		        File file = new File(p);
		        
		        if (file.exists()) {
		            System.out.println("File exists!");
		        } else {
		        	 Files.copy(filePart.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
		            System.out.println("File does not exist.");
		        }
			     String path = "uploads/" + fileName;
			    System.out.println("folder :"+uploadFolder);
			   
			    System.out.println("path :"+filePath);
			    System.out.println(" avant cruptage path "+path);
			    
			     HttpSession varS = request.getSession();
				 SecretKey key =(SecretKey) varS.getAttribute("key");
				 byte[] encryptM=CryptageAES.chiffrerMessage(path, key);
			    System.out.println(" apres cruptage path "+encryptM);
			    
			    String encodedKey = Base64.getEncoder().encodeToString(key.getEncoded());
			    MessageJson mesg = new MessageJson(Arrays.toString(encryptM),encodedKey);
				 Gson gson = new Gson();   
			     String msgjson = gson.toJson(mesg);
				pw.print(msgjson);
			  
		    }catch(Exception e) {
		    	System.out.println("Erreur Ajax call "+e.getMessage());
		    }
		    // Store the file path in a database
	}

}