package Securite;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import java.nio.charset.StandardCharsets;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Base64;

public class CryptageAES {

    public static void main(String[] args) throws Exception {
        String message = "Le message a crypter";
       
        // Générer une nouvelle clé AES
        SecretKey cle = genererCle();
        
        // Chiffrer le message
        byte[] messageChiffre = chiffrerMessage(message, cle);
        String encodedKey = Base64.getEncoder().encodeToString(cle.getEncoded());
        
        byte[] decodedKey = Base64.getDecoder().decode(encodedKey);
		 SecretKey key = new SecretKeySpec(decodedKey, 0, decodedKey.length, "AES");
       // String msg = messageChiffre.toString();
        // Déchiffrer le message
        String msg = Arrays.toString(messageChiffre);

     // Convert the string back to a byte array
     String[] byteValues = msg.substring(1, msg.length() - 1).split(", ");
     byte[] originalMessageChiffre = new byte[byteValues.length];
     for (int i = 0; i < byteValues.length; i++) {
         originalMessageChiffre[i] = Byte.parseByte(byteValues[i]);
     }
        String messageDechiffre = dechiffrerMessage( originalMessageChiffre, key);
        
        	System.out.println("Message initial : " + message);
            System.out.println("Message chiffre : " + messageChiffre);
            System.out.println("msg : " + msg);
            System.out.println(" originalMessageChiffre : " +  originalMessageChiffre);
            System.out.println("Message dechiffre : " + messageDechiffre);
            System.out.println("Cle : " + cle);
            System.out.println("encodedKey : " + encodedKey);
            System.out.println("decodedKey : " + decodedKey);
            System.out.println("key : " + key);
     
        
    }

    public static SecretKey genererCle() throws NoSuchAlgorithmException {
        KeyGenerator generateurCle = KeyGenerator.getInstance("AES");
        generateurCle.init(128); // ou 192 ou 256 bits
        return generateurCle.generateKey();
    }

    public static byte[] chiffrerMessage(String message, SecretKey cle) throws Exception {
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.ENCRYPT_MODE, cle);
        return cipher.doFinal(message.getBytes(StandardCharsets.UTF_8));
    }

    public static String dechiffrerMessage(byte[] messageChiffre, SecretKey cle) throws Exception {
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.DECRYPT_MODE, cle);
        byte[] messageDechiffre = cipher.doFinal(messageChiffre);
        return new String(messageDechiffre, StandardCharsets.UTF_8);
    }
}