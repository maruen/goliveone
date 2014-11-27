package br.com.golive.utils;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import br.com.golive.annotation.LogList;
import br.com.golive.annotation.StandardColumn;
import br.com.golive.annotation.TransientColumn;
import br.com.golive.constants.Criptografia;
import br.com.golive.constants.TipoFiltro;
import br.com.golive.entity.Model;
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

	public static List<ColunaPerfil> obterColunasPagina(final Usuario usuario, final String managedBeanName, final List<Class<?>> classes) {
		final List<ColunaPerfil> colunasPagina = new ArrayList<ColunaPerfil>();
		for (final Class<?> clazz : classes) {
			obterColunasEntity(colunasPagina, clazz.getAnnotation(Table.class).name(), usuario, managedBeanName, clazz, clazz.getSuperclass());
		}
		return colunasPagina;
	}

	public static void reordernar(final List<ColunaPerfil> configuracaoPerfil) {
		Long count = 1L;
		for (final ColunaPerfil perfil : configuracaoPerfil) {
			perfil.setOrdem(count++);
		}
	}

	public static String[] getNameTablesByClasses(final List<Class<?>> classes) {
		final String[] tabelas = new String[classes.size()];

		for (int i = 0; i < tabelas.length; i++) {
			tabelas[i] = classes.get(i).getAnnotation(Table.class).name();
		}
		return tabelas;
	}

	private static void obterColunasEntity(final List<ColunaPerfil> colunasPagina, final String nameTable, final Usuario usuario, final String managedBeanName, final Class<?>... classes) {
		Long count = 1L;
		for (final Class<?> clazz : classes) {
			count = obterColunas(colunasPagina, usuario, managedBeanName, count, clazz, nameTable);
		}
	}

	private static Long obterColunas(final List<ColunaPerfil> colunasPagina, final Usuario usuario, final String managedBeanName, Long count, final Class<?> clazz, final String nameTable) {
		for (final Field field : clazz.getDeclaredFields()) {
			if (!field.isAnnotationPresent(TransientColumn.class)) {
				if (isNotRelationShip(field)) {
					if (field.isAnnotationPresent(Column.class)) {
						if (field.isAnnotationPresent(Column.class)) {
							colunasPagina.add(new ColunaPerfil(new ColunaPerfilId(usuario.getId(), nameTable, field.getAnnotation(Column.class).name(), managedBeanName), TipoFiltro.IGUAL.getDescricao(), count++, field.isAnnotationPresent(StandardColumn.class), 300L));
						} else {
							throw new GoLiveException("Campo nao possui anotaÃ§Ã£o de Label = "
									+ clazz.getAnnotation(Table.class).name()
									+ "." + field.getName());
						}
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

	public static Field getFieldByNameColumn(final String nameColumn, final Class<?> clazz) {
		Class<?> atual = clazz;

		while (atual != null) {
			for (final Field field : atual.getDeclaredFields()) {
				if ((field.isAnnotationPresent(Column.class))
						&& (field.getAnnotation(Column.class).name().equals(nameColumn))) {
					return field;
				}
			}
			atual = atual.getSuperclass();
		}
		return null;
	}

	public static Field getFieldByNameColumn(final ColunaPerfil coluna, final Class<?> clazz) {
		Class<?> atual = clazz;
		while (atual != null) {
			for (final Field field : atual.getDeclaredFields()) {
				if ((atual.equals(Model.class))
						|| (atual.getAnnotation(Table.class).name().equals(coluna.getId().getTabela()))) {
					if ((field.isAnnotationPresent(Column.class))
							&& (field.getAnnotation(Column.class).name().equals(coluna.getId().getColuna()))) {
						return field;
					}
				} else {
					if (field.isAnnotationPresent(JoinTable.class)) {
						if (field.getType().getAnnotation(Table.class).name().equals(coluna.getId().getTabela())) {
							return getFieldByNameColumn(coluna, field.getType());
						}
					}
				}
			}
			atual = atual.getSuperclass();
		}

		return null;
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

	public static Object invoke(final Field field, final Object instance) throws IllegalArgumentException, IllegalAccessException {
		field.setAccessible(true);
		return field.get(instance);
	}

	public static boolean getRelationShip(final Field field) {
		final boolean ret = !isNotRelationShip(field);
		return ((!field.isAnnotationPresent(Transient.class)) && (ret) && (!field.isAnnotationPresent(LogList.class)));
	}

	public static boolean validarCamposNulos(final Object... objects) {
		for (final Object object : objects) {
			if (object == null) {
				return false;
			}
		}
		return true;
	}

	public static String getPathEntityByColumnWithClass(final Class<?> clazz, final ColunaPerfil coluna) {
		if (clazz.getAnnotation(Table.class).name().toLowerCase().equals(coluna.getId().getTabela().toLowerCase())) {
			return getFieldNameByColumn(clazz, coluna.getId().getColuna());
		} else {
			return findJoinTableByName(clazz.getDeclaredFields(), coluna);
		}
	}

	public static String findJoinTableByName(final Field[] fields, final ColunaPerfil coluna) {
		final StringBuilder sb = new StringBuilder();
		for (final Field field : fields) {
			if (field.getType().isAnnotationPresent(Table.class)) {
				if (field.getType().getAnnotation(Table.class).name().toLowerCase().equals(coluna.getId().getTabela().toLowerCase())) {
					sb.append(field.getName().concat("."));
					sb.append(getFieldNameByColumn(field.getType(), coluna.getId().getColuna()));
					return sb.toString();
				}
			}
		}
		return null;
	}

	public static String getFieldNameByColumn(final Class<?> clazz, final String fieldName) {
		for (final Field field : clazz.getDeclaredFields()) {
			if (field.getName().toLowerCase().equals(fieldName.toLowerCase())) {
				return field.getName();
			}
		}

		if (clazz.getSuperclass() != null) {
			return getFieldNameByColumn(clazz.getSuperclass(), fieldName);
		}

		return null;
	}

}
