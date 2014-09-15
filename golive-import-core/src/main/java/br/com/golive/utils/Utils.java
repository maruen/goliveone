package br.com.golive.utils;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.commons.lang.WordUtils;

import br.com.golive.constants.Criptografia;


public class Utils {

    public static String criptografarSenha(final String string, final Criptografia criptografia) {
        try {
            final MessageDigest md = MessageDigest.getInstance(criptografia.getCodigo());
            md.update(string.getBytes());
            return "";
        } catch (final NoSuchAlgorithmException e) {
            return null;
        }
    }
    
    public static Class<?> getClazz(final Class<?> clazz, final String fieldName) throws NoSuchFieldException, SecurityException{
		return clazz.getDeclaredField(fieldName).getType();
    }
    
}
