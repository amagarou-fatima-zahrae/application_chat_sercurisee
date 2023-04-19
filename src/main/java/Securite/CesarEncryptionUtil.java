package Securite;

public class CesarEncryptionUtil {

	 private static final int SHIFT = 3; // Nombre de décalage
	    private static final String ALPHABET = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-=_+[]{}|;':\",.<>?/ \t\n"; // Alphabet utilisé, incluant les caractères spéciaux

	    public static String encrypt(String plaintext) {
	        StringBuilder ciphertext = new StringBuilder();
	        for (char c : plaintext.toCharArray()) {
	            int index = (ALPHABET.indexOf(c) + SHIFT) % ALPHABET.length();
	            ciphertext.append(ALPHABET.charAt(index));
	        }
	        return ciphertext.toString();
	    }

	    public static String decrypt(String ciphertext) {
	        StringBuilder plaintext = new StringBuilder();
	        for (char c : ciphertext.toCharArray()) {
	            int index = (ALPHABET.indexOf(c) - SHIFT + ALPHABET.length()) % ALPHABET.length();
	            plaintext.append(ALPHABET.charAt(index));
	        }
	        return plaintext.toString();
	    }
}
