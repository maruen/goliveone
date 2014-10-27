package br.com.golive.utils;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.lang.WordUtils;
import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.annotation.Label;
import br.com.golive.annotation.StandardColumn;
import br.com.golive.constants.Criptografia;
import br.com.golive.constants.TipoFiltro;
import br.com.golive.entity.empresas.empresa.model.Empresa;
import br.com.golive.entity.perfilconfiguracao.model.ColunaPerfil;
import br.com.golive.entity.perfilconfiguracao.model.ColunaPerfilId;
import br.com.golive.entity.usuario.model.Usuario;
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

	public static List<ColunaPerfil> obterListaColunaTabela(final Class<?> clazz, final Usuario usuario, final Empresa empresaSeleciona) {
		final List<ColunaPerfil> colunasPagina = new ArrayList<ColunaPerfil>();
		if (clazz == null) {
			throw new GoLiveException("Erro ao obter colunas da pagina");
		}
		Long cont = 1L;
		cont = obterColunasEntity(colunasPagina, clazz.getSuperclass(), clazz.getAnnotation(Table.class).name(), usuario, empresaSeleciona, cont);
		cont = obterColunasEntity(colunasPagina, clazz, clazz.getAnnotation(Table.class).name(), usuario, empresaSeleciona, cont);
		return colunasPagina;
	}

	private static Long obterColunasEntity(final List<ColunaPerfil> colunasPagina, final Class<?> clazz, final String tableName, final Usuario usuario, final Empresa empresaSeleciona, Long cont) {
		for (final Field field : clazz.getDeclaredFields()) {
			if (!field.isAnnotationPresent(Transient.class)) {
				if (field.isAnnotationPresent(Column.class)) {
					if (field.isAnnotationPresent(Label.class)) {
						colunasPagina.add(new ColunaPerfil(new ColunaPerfilId(usuario.getId(), tableName, field.getAnnotation(Column.class).name()), TipoFiltro.IGUAL.getDescricao(), cont++, field.isAnnotationPresent(StandardColumn.class)));
					} else {
						throw new GoLiveException("Campo nao possui anotação de Label = " + tableName + "." + field.getName());
					}
				}
			}
		}
		return cont;
	}

	public static Field getFilter(final String widgetName, final Class<?>... clazzes) {
		for (final Class<?> clazz : clazzes) {
			for (final Field field : clazz.getDeclaredFields()) {
				if ((field.isAnnotationPresent(Filter.class)) && (field.getAnnotation(Filter.class).name().equals(widgetName))) {
					return field;
				}
			}
		}
		return null;
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

	public static Object invokeGetterByField(final Field field, final Object instance, final Logger logger, final Class<?>... classes) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		Method getter = null;
		for (final Class<?> clazz : classes) {
			try {
				if (getter == null) {
					getter = clazz.getMethod("get" + WordUtils.capitalize(field.getName()));
				}
			} catch (NoSuchMethodException | SecurityException e) {
				logger.warn("Getter nao encontrado");
			}
		}
		return getter.invoke(instance);
	}
}
