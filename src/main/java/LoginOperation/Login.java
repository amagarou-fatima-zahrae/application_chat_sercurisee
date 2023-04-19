package LoginOperation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.crypto.SecretKey;

import Securite.AESCrypter;
import Securite.CryptageAES;
import Serverpk.User;
import connexBD.MySQLDatabase;

public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Login() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession varS = request.getSession();
        if (varS.getAttribute("id") != null) {
            int id = (Integer) varS.getAttribute("id");
            User.removeUser(id);
            varS.invalidate();
        }
        this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SecretKey key = null;
        String email = request.getParameter("email");
        String pwd = request.getParameter("pwd");
        Connection conn = MySQLDatabase.getConnexion();

        try {
            PreparedStatement stmt = conn.prepareStatement("select password, id_user from utilisateur where email=?");
            stmt.setString(1, email);
            ResultSet resultat = stmt.executeQuery();
            if (resultat.next()) {
                String storedEncryptedPassword = resultat.getString(1);
                String storedDecryptedPassword;
                try {
                    storedDecryptedPassword = AESCrypter.decrypt(storedEncryptedPassword);
                } catch (Exception e) {
                    throw new ServletException("Erreur lors du déchiffrement du mot de passe", e);
                }

                if (pwd.equals(storedDecryptedPassword)) {
                    System.out.println("cc");
                    request.setAttribute("id", resultat.getInt(2));
                    
                    // key de session pour déchiffrer le msg
                    try {
						key = CryptageAES.genererCle();
					} catch (NoSuchAlgorithmException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
                    HttpSession varS = request.getSession();
                    varS.setAttribute("id", resultat.getInt(2));
                    varS.setAttribute("key", key);
                    System.out.println(key);
                    int id = (Integer) varS.getAttribute("id");
                    System.out.println("id " + id);
                    request.setAttribute("id", id);
                    User.addUser(id);
                    this.getServletContext().getRequestDispatcher("/ListeMessages").forward(request, response);
                } else {
                    String error = "Votre email ou votre mot de passe est incorrect";
                    request.setAttribute("msg", error);
                    this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
                }
            } else {
                String error = "Cet email n'existe pas, veuillez vous inscrire";
                request.setAttribute("msg", error);
                this.getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
