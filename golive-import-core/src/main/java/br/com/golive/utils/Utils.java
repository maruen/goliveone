package br.com.golive.utils;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Iterator;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.Transient;

import br.com.golive.constants.Criptografia;
import br.com.golive.constants.TipoFiltro;
import br.com.golive.entity.ColunaPerfil;
import br.com.golive.entity.Usuario;
import br.com.golive.exception.GoLiveException;


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

	public static boolean obterColumnName(final String nomeColunaConf, final Field[] fields) {
		for (final Field field : fields) {
			if (nomeColunaConf.equals(field.getName())) {
				return true;
			}
		}
		return false;
	}

	public static Class<?> getClassGeneric(final Class<?> instance) {
		Type type = instance.getGenericSuperclass();
		if (!(type instanceof ParameterizedType)) {
			type = instance.getSuperclass().getGenericSuperclass();
		}
		return (Class<?>) ((ParameterizedType) type).getActualTypeArguments()[0];
	}

	public static <T> void obterLista(final List<ColunaPerfil> colunasPagina, final Class<T> clazz, final Usuario usuario, final String empresaSeleciona) {
		if ((colunasPagina == null) || (clazz == null)) {
			throw new GoLiveException("Erro ao obter colunas da pagina");
		}
		Long cont = 1L;
		for (final Field field : clazz.getDeclaredFields()) {
			if (!field.isAnnotationPresent(Transient.class)) {
				if (field.isAnnotationPresent(Column.class)) {
					colunasPagina.add(new ColunaPerfil(usuario.getId(), cont++, clazz.getAnnotation(Table.class).name(), field.getAnnotation(Column.class).name(), false, empresaSeleciona, TipoFiltro.IGUAL.getDescricao()));
				}
			}
		}
	}
	
	@SuppressWarnings("rawtypes")
	public static String explode(List<Long> ids) {
		StringBuffer sbf = new StringBuffer();
		Iterator it = ids.iterator();
		while (it.hasNext()) {
			sbf.append(it.next()).append(",");	
		}
		sbf.replace(sbf.lastIndexOf(","), sbf.length(), "");
		return sbf.toString();
	}
	
}
