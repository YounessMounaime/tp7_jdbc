package com.example.tp7_jdbc.dao;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;

public class PasswordUtil {

    private static final String ALGORITHM = "AES";
    private static final String TRANSFORMATION = "AES";
    // Une clé fixe de 16 bytes pour AES (128 bits). Utilisez une clé sécurisée et stockez-la en toute sécurité.
    private static final String FIXED_KEY = "1234567890123456";

    // Encrypt the password
    public static String encrypt(String password) throws Exception {
        SecretKeySpec keySpec = new SecretKeySpec(FIXED_KEY.getBytes(), ALGORITHM);
        Cipher cipher = Cipher.getInstance(TRANSFORMATION);
        cipher.init(Cipher.ENCRYPT_MODE, keySpec);
        byte[] encryptedBytes = cipher.doFinal(password.getBytes());
        return Base64.getEncoder().encodeToString(encryptedBytes);
    }

    // Decrypt the password
    public static String decrypt(String encryptedPassword) throws Exception {
        SecretKeySpec keySpec = new SecretKeySpec(FIXED_KEY.getBytes(), ALGORITHM);
        Cipher cipher = Cipher.getInstance(TRANSFORMATION);
        cipher.init(Cipher.DECRYPT_MODE, keySpec);
        byte[] decryptedBytes = cipher.doFinal(Base64.getDecoder().decode(encryptedPassword));
        return new String(decryptedBytes);
    }
}

