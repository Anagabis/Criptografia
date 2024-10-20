import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;

public class CriptografiaAES {
    private static final String ALGORITMO = "AES";

    // Cria uma chave secreta
    public static SecretKey gerarChaveSecreta() throws Exception {
        KeyGenerator keyGen = KeyGenerator.getInstance(ALGORITMO);
        keyGen.init(128); // Tamanho da chave
        return keyGen.generateKey();
    }

    // Criptografa uma string
    public static String criptografar(String texto, SecretKey chave) throws Exception {
        Cipher cipher = Cipher.getInstance(ALGORITMO);
        cipher.init(Cipher.ENCRYPT_MODE, chave);
        byte[] textoCriptografado = cipher.doFinal(texto.getBytes());
        return Base64.getEncoder().encodeToString(textoCriptografado);
    }

    public static void main(String[] args) {
        try {
            // Gerar uma chave secreta
            SecretKey chave = gerarChaveSecreta();
            
            // Texto a ser criptografado
            String textoOriginal = "49.101.113.117";
            System.out.println("Texto original: " + textoOriginal);
            
            // Criptografar o texto
            String textoCriptografado = criptografar(textoOriginal, chave);
            System.out.println("Texto criptografado: " + textoCriptografado);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}