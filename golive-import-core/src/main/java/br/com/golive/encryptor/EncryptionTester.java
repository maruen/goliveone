package br.com.golive.encryptor;

public class EncryptionTester {

	public static void main(String[] args) {
		
		encrypt("acaopersianas");
		decrypt("kSwGsLmgel451TXU9kGXXQ");

	}

	private static void encrypt(String password) {
		String passwordEncrypted = new String(password);
		try {
			passwordEncrypted = Encryption.encrypt(password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("Password Encrypted: " + passwordEncrypted);
	}
	
	
	private static void decrypt(String password) {
		String passwordDecrypted = new String(password);
		try {
			passwordDecrypted = Encryption.decrypt(password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("Password Decrypted: " + passwordDecrypted);
	}
	
	

}
