package com.octest.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.websocket.server.PathParam;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemIterator;
import org.apache.tomcat.util.http.fileupload.FileItemStream;
import org.apache.tomcat.util.http.fileupload.FileUploadBase;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;


import com.octest.inscription.inscription;

/**
 * Servlet implementation class UserI
 */

@MultipartConfig
public class UserI extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserI() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		this.getServletContext().getRequestDispatcher("/WEB-INF/FormeInscription.jsp").forward(request, response);
//		 String htmlForm = "<form method='post'>" +
//                 "Nom: <input type='text' name='nom'><br>" +
//                 "Prénom: <input type='text' name='prenom'><br>" +
//                 "<input type='submit' value='Envoyer'>" +
//                 "</form>";

// Envoyer le formulaire en réponse à la demande de l'utilisateur
//response.setContentType("text/html");
PrintWriter out = response.getWriter();
out.println("Fomulaire envoyer");
	}

	/**
	 
	 * @throws ServletException 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
	    String date = request.getParameter("daten");
	    String etat = request.getParameter("etat");
	    String profession = request.getParameter("profession");
	    String description = request.getParameter("review");
	    //************************************************
	    String uploadFolder ="D:/projet/WebChat/src/main/webapp/photos"; // replace with the actual path to your folder
	    Part filePart = request.getPart("file");
	    String fileName = filePart.getSubmittedFileName();
	     Path filePath = Paths.get(uploadFolder, fileName);
	     String path = "photos/" + fileName;
	     Files.copy(filePart.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
//	     if (Files.exists(filePath)) {
//	    	    System.out.println("File already exists!");
//	    	} else {
//	    	//	Files.copy(filePart.getInputStream(), filePath);
//	    	    System.out.println("File added!");
//	    	}
 	     
	  System.out.println("path"+getServletContext().getRealPath("/photos"));
 
	//System.out.println("work"+getServletContext().getInitParameter("javax.servlet.context.tempdir"));

		System.out.println("filePart : "+filePart);
		System.out.println("fileName : "+fileName);
		inscription innsc = new inscription();
		try {
			innsc.setUserParameter(nom, prenom, email, password, date, etat, profession, description,path);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		//setUserParameter
		System.out.print("Les infos sont bien enregistres");
//
		this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);

	}

}
