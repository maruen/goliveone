package br.com.golive.encryptor;

import java.util.Date;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.inject.Inject;

import org.slf4j.Logger;

/**
 * 
 * @author James Rugno
 *
 */
public class Encryption {   
	
   /**
    * 
    * Constante Chave de Criptografia
    * 
    */
    private static final String PASSFRASE = "13shuaAlMessiah";  
    
	@Inject
	private static Logger logger;

    
    
      
   /**
    * Criptografia - cript
    * 
    * @param  String str 
    * @return String strCript - Retorna a String criptografada
    * @throws Exception
    * @throws FactoryException 
    */
   public static String encrypt(String str) throws Exception {   
      String strCript = str;   
         
      try {
    	  
         Cipher ch    = Cipher.getInstance("Blowfish");   
         SecretKey k1 = new SecretKeySpec(PASSFRASE.getBytes(), "Blowfish");   
         ch.init(Cipher.ENCRYPT_MODE, k1);  
         
         byte b[]  = ch.doFinal(strCript.getBytes());   
         
         String s1 = EncryptionConversion.byteArrayToBase64String(b);   
         strCript  = s1;   
      } catch(Exception e) {   
		 logger.debug("Erro Criptografia.crip - Data: " + new Date(), e);  
      }   
      
      
      if(strCript.contains("==")) { //to solve URL problems
    	  strCript = strCript.substring(0,(strCript.lastIndexOf("=")-1));
      } else if(strCript.contains("=")) {
    	  strCript = strCript.substring(0,strCript.lastIndexOf("="));
      }
      
      return strCript;   
   }   
      
   /**
    * Decriptografia de String
    * 
    * @param  String str
    * @return String strDecript - Retorna a String descriptografada
    * @throws Exception
    * @throws FactoryException 
    */
   public static String decrypt(String str) throws Exception {  
	   String strDecript = str;
		 
      Cipher ch    = Cipher.getInstance("Blowfish");   
      SecretKey k1 = new SecretKeySpec(PASSFRASE.getBytes(), "Blowfish");   
      ch.init(Cipher.DECRYPT_MODE, k1);   
     
      byte b[]  = EncryptionConversion.base64StringToByteArray(strDecript);   
      byte b1[] = ch.doFinal(b);   
     
      String s1 = new String(b1);   
      strDecript = s1;   
      
      return strDecript;   
   }   
}
