package br.com.golive.utils;

import java.lang.reflect.Field;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import br.com.golive.constants.Criptografia;
import br.com.golive.perfil.ConfiguracaoOrdemColunas;


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

	public static Class<?> getClazz(final Class<?> clazz, final String fieldName) throws NoSuchFieldException, SecurityException {
		return clazz.getDeclaredField(fieldName).getType();
	}

	public static boolean verificarColuna(final List<ConfiguracaoOrdemColunas> colunas, final String nomeCampo) {
		for (final ConfiguracaoOrdemColunas conf : colunas) {
			if (conf.getColuna().equals(nomeCampo)) {
				return true;
			}
		}
		return false;
	}

	public static boolean obterColumnName(final String nomeColunaConf, final Field[] fields) {
		for (final Field field : fields) {
			if (nomeColunaConf.equals(field.getName())) {
				return true;
			}
		}
		return false;
	}

}
