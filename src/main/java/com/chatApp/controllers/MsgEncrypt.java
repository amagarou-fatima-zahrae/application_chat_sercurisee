package com.chatApp.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Base64;

import javax.crypto.SecretKey;

import com.chaApp.models.MessageJson;
import com.google.gson.Gson;

import Securite.AESCrypter;
import Securite.CryptageAES;

/**
 * Servlet implementation class MsgEncrypt
 */
@MultipartConfig
public class MsgEncrypt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MsgEncrypt() {
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
		// TODO Auto-generated method stub
		//doGet(request, response);
		PrintWriter pw = response.getWriter();
		String messageCrypt = request.getParameter("contenu");
		System.out.println(" avant cruptage  "+messageCrypt );
		try {
			HttpSession varS = request.getSession();
			 SecretKey key =(SecretKey) varS.getAttribute("key");
			 
			 byte[] encryptM=CryptageAES.chiffrerMessage(messageCrypt, key);
			System.out.println(" apres cruptage  "+encryptM +"avec key = "+key);
			
			String encodedKey = Base64.getEncoder().encodeToString(key.getEncoded());
			 MessageJson mesg = new MessageJson(Arrays.toString(encryptM),encodedKey);
			 System.out.println("instance  mesg "+mesg.Msg +"avec key encoded "+encodedKey);
			 Gson gson = new Gson();   
		     String msgjson = gson.toJson(mesg);
		     System.out.println("kifax "+msgjson);
			pw.print(msgjson);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
