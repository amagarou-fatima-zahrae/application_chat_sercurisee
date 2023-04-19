package com.octest;


public class CesarCipher {
    private static final int KEY = 3;

    public static String encrypt(String password) {
        StringBuilder result = new StringBuilder();
        for (char c : password.toCharArray()) {
            if (Character.isUpperCase(c)) {
                result.append((char) ('A' + (c - 'A' + KEY) % 26));
            } else {
                result.append((char) ('a' + (c - 'a' + KEY) % 26));
            }
        }
        return result.toString();
    }

    public static String decrypt(String encryptedPassword) {
        StringBuilder result = new StringBuilder();
        for (char c : encryptedPassword.toCharArray()) {
            if (Character.isUpperCase(c)) {
                result.append((char) ('A' + (c - 'A' - KEY + 26) % 26));
            } else {
                result.append((char) ('a' + (c - 'a' - KEY + 26) % 26));
            }
        }
        return result.toString();
    }
}
