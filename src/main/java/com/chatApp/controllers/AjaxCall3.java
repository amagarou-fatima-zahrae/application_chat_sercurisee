package com.chatApp.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import Securite.AESCrypter;
import Securite.CryptageAES;

/**
 * Servlet implementation class AjaxCall3
 */
public class AjaxCall3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCall3() {
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
		response.setHeader("Access-Control-Allow-Origin","*");
		 HttpSession varS = request.getSession();
		// SecretKey key =(SecretKey) varS.getAttribute("key");
		 PrintWriter pw = response.getWriter();
		  String contenu = request.getParameter("contenu");
		  System.out.println("contenu : "+request.getParameter("contenu")+"  key: "+request.getParameter("key"));
		  String keyString = request.getParameter("key");
		// Decode base64-encoded key string
//		byte[] keyBytes = Base64.getDecoder().decode(keyString);
//
//		  // Construct SecretKey object from key bytes
//		  SecretKey key = new SecretKeySpec(keyBytes, "AES");
		  byte[] decodedKey = Base64.getDecoder().decode(keyString);
		  SecretKey key = new SecretKeySpec(decodedKey, 0, decodedKey.length, "AES");
		  System.out.println("key encoded "+keyString+" decoded "+key);
		 
		  
		  System.out.println("ajax call 3 "+contenu);
		  
		  String contenuDecrypte = null;
		try {
			// Decode base64-encoded message string to byte array
		//	byte[] messageBytes = Base64.getDecoder().decode(contenu);
			 String[] byteValues =contenu.substring(1, contenu.length() - 1).split(", ");
		     byte[] messageBytes = new byte[byteValues.length];
		     for (int i = 0; i < byteValues.length; i++) {
		    	 messageBytes[i] = Byte.parseByte(byteValues[i]);
		     }
			 System.out.println("ajax call 3  msg bytes"+messageBytes);
			contenuDecrypte = CryptageAES.dechiffrerMessage(messageBytes, key);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("apres ajax call 3 "+contenuDecrypte);
		 pw.print(contenuDecrypte);
		  
	}

}