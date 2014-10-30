package br.com.golive.utils;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.lang.WordUtils;
import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.annotation.LogList;
import br.com.golive.annotation.StandardColumn;
import br.com.golive.constants.Criptografia;
import br.com.golive.constants.TipoFiltro;
import br.com.golive.entity.Model;
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

	public static List<ColunaPerfil> obterColunasPagina(final Usuario usuario, final Class<?>... classes) {
		final List<ColunaPerfil> colunasPagina = new ArrayList<ColunaPerfil>();
		for (final Class<?> clazz : classes) {
			obterColunasEntity(colunasPagina, clazz.getAnnotation(Table.class).name(), usuario, clazz, clazz.getSuperclass());
		}
		return colunasPagina;
	}

	public static String[] getNameTablesByClasses(final Class<?>... classes) {
		final String[] tabelas = new String[classes.length];

		for (int i = 0; i < tabelas.length; i++) {
			tabelas[i] = classes[i].getAnnotation(Table.class).name();
		}
		return tabelas;
	}

	@Deprecated
	public static List<ColunaPerfil> obterListaColunaTabela(final Class<?> clazz, final Usuario usuario, final Empresa empresaSeleciona) {
		// final List<ColunaPerfil> colunasPagina = new
		// ArrayList<ColunaPerfil>();
		// if (clazz == null) {
		// throw new GoLiveException("Erro ao obter colunas da pagina");
		// }
		//
		// if (clazz.isAnnotationPresent(UniqueEntity.class)) {
		// final List<Class<?>> classes = new ArrayList<Class<?>>();
		//
		// for (final Field field : clazz.getDeclaredFields()) {
		// if (field.isAnnotationPresent(EmbeddedId.class)) {
		// for (final Field fieldIdClass : field.getType().getDeclaredFields())
		// {
		// addClasses(classes, fieldIdClass);
		// }
		// } else {
		// addClasses(classes, field);
		// }
		// }
		//
		// obterColunasEntity(colunasPagina, usuario, classes);
		// } else {
		// obterColunasEntity(colunasPagina, usuario, clazz,
		// clazz.getSuperclass());
		// }
		// return colunasPagina;
		return null;
	}

	private static void addClasses(final List<Class<?>> classes, final Field field) {
		if (!field.isAnnotationPresent(Transient.class)) {
			if (field.getType().isAnnotationPresent(Entity.class)) {
				classes.add(field.getType());
			}
		}
	}

	private static void obterColunasEntity(final List<ColunaPerfil> colunasPagina, final String nameTable, final Usuario usuario, final Class<?>... classes) {
		Long count = 1L;
		for (final Class<?> clazz : classes) {
			count = obterColunas(colunasPagina, usuario, count, clazz, nameTable);
		}
	}

	private static void obterColunasEntity(final List<ColunaPerfil> colunasPagina, final Usuario usuario, final List<Class<?>> classes) {
		Long count = 1L;
		for (final Class<?> clazz : classes) {
			count = obterColunas(colunasPagina, usuario, count, clazz, clazz.getAnnotation(Table.class).name());
			if ((clazz.getSuperclass() != null) && (clazz.getSuperclass().equals(Model.class))) {
				count = obterColunas(colunasPagina, usuario, count, clazz.getSuperclass(), clazz.getAnnotation(Table.class).name());
			}
		}
	}

	private static Long obterColunas(final List<ColunaPerfil> colunasPagina, final Usuario usuario, Long count, final Class<?> clazz, final String nameTable) {
		for (final Field field : clazz.getDeclaredFields()) {
			if (isNotRelationShip(field)) {
				if (field.isAnnotationPresent(Column.class)) {
					if (field.isAnnotationPresent(Column.class)) {
						colunasPagina.add(new ColunaPerfil(new ColunaPerfilId(usuario.getId(), nameTable, field.getAnnotation(Column.class).name()), TipoFiltro.IGUAL.getDescricao(), count++, field.isAnnotationPresent(StandardColumn.class)));
					} else {
						throw new GoLiveException("Campo nao possui anotaÃ§Ã£o de Label = " + clazz.getAnnotation(Table.class).name() + "." + field.getName());
					}
				}
			}
		}
		return count;
	}

	private static boolean isNotRelationShip(final Field field) {

		if (field.isAnnotationPresent(Transient.class)) {
			return false;
		}
		if (field.isAnnotationPresent(OneToOne.class)) {
			return false;
		}
		if (field.isAnnotationPresent(ManyToOne.class)) {
			return false;
		}
		if (field.isAnnotationPresent(OneToMany.class)) {
			return false;
		}
		if (field.isAnnotationPresent(ManyToMany.class)) {
			return false;
		}
		return true;

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

	@Deprecated
	public static Field getFilter(final Class<?> instance, final ColunaPerfil coluna, final Class<?>... clazzes) {
		for (final Class<?> clazz : clazzes) {
			for (final Field field : clazz.getDeclaredFields()) {
				if ((field.isAnnotationPresent(Filter.class)) && (field.getAnnotation(Filter.class).name().equals(coluna.getId().getColuna()))) {
					if (!field.getAnnotation(Filter.class).path().equals("")) {
						if (getChildField(field.getAnnotation(Filter.class), clazz, coluna, instance)) {
							return field;
						}
					} else {
						return field;
					}
				}
			}
		}
		return null;
	}

	public static Field getFilterField(final Class<?> instance, final ColunaPerfil coluna, final Class<?>... clazzes) {
		for (final Class<?> clazz : clazzes) {
			for (final Field field : clazz.getDeclaredFields()) {
				if ((field.isAnnotationPresent(Filter.class)) && (field.getAnnotation(Filter.class).name().equals(coluna.getId().getColuna()))) {
					return field;
				}
			}
		}
		return null;
	}

	private static boolean getChildField(final Filter filter, final Class<?> clazz, final ColunaPerfil coluna, final Class<?> instance) {
		final List<String> campos = Arrays.asList(filter.path().replace(".", "_").split("_"));
		Class<?> localInstance = null;
		Field field = null;
		for (final String string : campos) {
			if (localInstance == null) {
				field = getField(string, instance, instance.getSuperclass());
				localInstance = field.getType();
			} else {
				field = getField(string, localInstance, localInstance.getSuperclass());
				localInstance = field.getType();
			}

			if (field.isAnnotationPresent(Column.class)) {
				if (!localInstance.isAnnotationPresent(Entity.class)) {
					return field.getAnnotation(Column.class).name().equals(filter.name());
				}
			}

		}
		return false;
	}

	private static Field getField(final String string, final Class<?>... classes) {
		Field field = null;
		for (final Class<?> clazz : classes) {
			try {
				field = clazz.getDeclaredField(string);
				if (field != null) {
					return field;
				}
			} catch (NoSuchFieldException | SecurityException e) {
				// e.printStackTrace();
			}
		}
		return field;
	}

	public static boolean possuePropriedade(final List<String> list, final String string) {
		return list.contains(string);
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

	public static boolean getRelationShip(final Field field) {
		final boolean ret = !isNotRelationShip(field);
		return ((!field.isAnnotationPresent(Transient.class)) && (ret) && (!field.isAnnotationPresent(LogList.class)));
	}
}
