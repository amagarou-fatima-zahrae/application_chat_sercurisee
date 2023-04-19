package Securite;

import java.security.Key;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;

public class AESCrypter {
    private static final String ALGORITHM = "AES";
    private static final String KEY = "mysecretkey12345"; // 128-bit key

    public static String encrypt(String data) throws Exception {
        Key secretKey = new SecretKeySpec(KEY.getBytes(), ALGORITHM);
        Cipher cipher = Cipher.getInstance(ALGORITHM);
        cipher.init(Cipher.ENCRYPT_MODE, secretKey);
        byte[] encryptedData = cipher.doFinal(data.getBytes());
        return Base64.getEncoder().encodeToString(encryptedData);
    }

    public static String decrypt(String encryptedData) throws Exception {
        Key secretKey = new SecretKeySpec(KEY.getBytes(), ALGORITHM);
        Cipher cipher = Cipher.getInstance(ALGORITHM);
        cipher.init(Cipher.DECRYPT_MODE, secretKey);
        byte[] decryptedData = cipher.doFinal(Base64.getDecoder().decode(encryptedData));
        return new String(decryptedData);
    }

//    public static void main(String[] args) {
//      try {
//          String data = "This is my secret message.";
//          String encryptedData = encrypt(data);
//          String decryptedData = decrypt(encryptedData);
//          System.out.println("Original data: " + data);
//          System.out.println("Encrypted data: " + encryptedData);
//          System.out.println("Decrypted data: " + decryptedData);
//      } catch (Exception ex) {
//          ex.printStackTrace();
//       }
//    }
}
       