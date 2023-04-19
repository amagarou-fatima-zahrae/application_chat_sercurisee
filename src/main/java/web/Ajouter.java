package web;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//@WebServlet("/Ajouter")
public class Ajouter extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession varS=request.getSession();
		int id_user_emetteur= (Integer)varS.getAttribute("id");
//		PrintWriter out = response.getWriter();
//		out.println(id_user_emetteur);
		// TODO Auto-generated method stub
		this.getServletContext().getRequestDispatcher("/Ajouter.jsp").forward(request, response);

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
        response.setContentType("text/html");
		String email=request.getParameter("email");
		
		HttpSession varS=request.getSession();
		int id_user_emetteur= (Integer)varS.getAttribute("id");
	
		String etat="attente";
		
		
        final String username = "amagaroufatimazahrae@gmail.com";//your email id
        final String password = "wtgmxibeajrpwizc";// your password
        Properties props = new Properties();
        props.put("mail.smtp.auth", true);
        props.put("mail.smtp.starttls.enable", true);
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

		try {
			 Class.forName("com.mysql.cj.jdbc.Driver");
			 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/application_chat_reseau", "root", "");

			PreparedStatement pst=con.prepareStatement("SELECT id_user FROM utilisateur WHERE email=?");
			pst.setString(1,email);
			ResultSet rs=pst.executeQuery();

			if(rs.next()) {
				if (id_user_emetteur==rs.getInt(1)) {
					response.sendRedirect("Ajouter.jsp");
					
									
				}else {
					
					

					PreparedStatement pst1=con.prepareStatement("SELECT id_invit FROM invitation WHERE id_user_emetteur=? and id_user_recepteur=?");
					pst1.setInt(1,id_user_emetteur);
					pst1.setInt(2,rs.getInt(1));
					ResultSet rs1=pst1.executeQuery();
					
					PreparedStatement pst2=con.prepareStatement("SELECT id_invit FROM invitation WHERE id_user_emetteur=? and id_user_recepteur=?");
					pst2.setInt(1,rs.getInt(1));
					pst2.setInt(2,id_user_emetteur);
					ResultSet rs2=pst2.executeQuery();
					
					PreparedStatement pst3=con.prepareStatement("SELECT id FROM contact WHERE id_user=? and id_contact=?");
					pst3.setInt(1,id_user_emetteur);
					pst3.setInt(2,rs.getInt(1));
					ResultSet rs3=pst3.executeQuery();
					
					PreparedStatement pst4=con.prepareStatement("SELECT id FROM contact WHERE id_user=? and id_contact=?");
					pst4.setInt(1,rs.getInt(1));
					pst4.setInt(2,id_user_emetteur);
					ResultSet rs4=pst4.executeQuery();
					

					
					
					if(rs1.next() || rs2.next() ) {
						response.sendRedirect("Ajouter.jsp");
						
					}
					
					else if(rs3.next() || rs4.next()) {
						response.sendRedirect("Ajouter.jsp");
						
					}

					else {
						PreparedStatement ins=con.prepareStatement("INSERT INTO invitation(id_user_emetteur,id_user_recepteur,etat) VALUES (?,?,?) ");
						ins.setInt(1,id_user_emetteur);
						ins.setInt(2,rs.getInt(1));
						
						ins.setString(3,etat);
						ins.executeUpdate();
					
						ins.close();
						
						
						response.sendRedirect("show_invit.jsp");
						
					}

					
				}
				
					

				
				}


				
			else {
				
				   Message message = new MimeMessage(session);
		            message.setFrom(new InternetAddress(email));
		            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
		            MimeBodyPart textPart = new MimeBodyPart();
		            Multipart multipart = new MimeMultipart();
		            String final_Text = " nous vous invite à rejoindre l'application de chat le plus tot possible";
		            textPart.setText(final_Text);
		            message.setSubject(email);
		            multipart.addBodyPart(textPart);
		            message.setContent(multipart);
		            message.setSubject("Contact Details");
		            //out.println("Sending");
		            Transport.send(message);
		            out.println("<center><h2 style='color:green;'>Email Sent Successfully.</h2>");
		            out.println("Thank you " + email + ", your message has been submitted to us.</center>");
		            request.getSession().setAttribute("successMessage", "L'utilisateur a été ajouté avec succès !");
		            response.sendRedirect("Ajouter.jsp");

			}
			
			rs.close();
			pst.close();
			con.close();
			
		}catch(Exception e){
			System.out.print(e);
		}

	


	}
	
	

}