package br.com.golive.utils;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Iterator;
import java.util.List;

import javax.persistence.Column;

import br.com.golive.annotation.Filter;
import br.com.golive.constants.Criptografia;
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

	//
	// public static List<ColunaPerfil> obterListaColunaTabela(final Class<?>
	// clazz, final Usuario usuario, final Empresa empresaSeleciona) {
	// final List<ColunaPerfil> colunasPagina = new ArrayList<ColunaPerfil>();
	// if (clazz == null) {
	// throw new GoLiveException("Erro ao obter colunas da pagina");
	// }
	// Long cont = 1L;
	// cont = obterColunasEntity(colunasPagina, clazz.getSuperclass(),
	// clazz.getAnnotation(Table.class).name(), usuario, empresaSeleciona,
	// cont);
	// cont = obterColunasEntity(colunasPagina, clazz,
	// clazz.getAnnotation(Table.class).name(), usuario, empresaSeleciona,
	// cont);
	// return colunasPagina;
	// }

//	private static Long obterColunasEntity(final List<ColunaPerfil> colunasPagina, final Class<?> clazz, final String tableName, final Usuario usuario, final Empresa empresaSeleciona, Long cont) {
//		for (final Field field : clazz.getDeclaredFields()) {
//			if (!field.isAnnotationPresent(Transient.class)) {
//				if (field.isAnnotationPresent(Column.class)) {
//					if(field.isAnnotationPresent(Label.class)){
//						colunasPagina.add(new ColunaPerfil(usuario, cont++, empresaSeleciona, tableName, field.getAnnotation(Column.class).name(), TipoFiltro.IGUAL.name()));
//					} else {
//						throw new GoLiveException("Campo nao possui anotação de Label = " + tableName + "." + field.getName());
//					}
//				}
//			}
//		}
//		return cont;
//	}

	public static String getFieldNameByColumn(final String nameColumn, final Class<?>... classes) throws GoLiveException {

		for (final Class<?> clazz : classes) {
			for (final Field field : clazz.getDeclaredFields()) {
				if (field.isAnnotationPresent(Column.class)) {
					if (field.getAnnotation(Column.class).name().equals(nameColumn)) {
						return field.getName();
					}
				}
			}
		}

		throw new GoLiveException("Classe nao possui anotação");
	}

	public static Field getFilter(final String widgetName, final Class<?> clazz) throws GoLiveException {
		for (final Field field : clazz.getDeclaredFields()) {
			if ((field.isAnnotationPresent(Filter.class)) && (field.getAnnotation(Filter.class).name().equals(widgetName))) {
				return field;
			}
		}
		throw new GoLiveException("Não foi possivel encontrar o filtro");
	}

	@SuppressWarnings("rawtypes")
	public static String explode(final List<Long> ids) {
		final StringBuffer sbf = new StringBuffer();
		final Iterator it = ids.iterator();
		while (it.hasNext()) {
			sbf.append(it.next()).append(",");
		}
		sbf.replace(sbf.lastIndexOf(","), sbf.length(), "");
		return sbf.toString();
	}

}
