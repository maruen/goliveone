package br.com.golive.utils;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.faces.context.FacesContext;
import javax.persistence.Column;
import javax.persistence.Transient;

import br.com.golive.annotation.StandardColumn;
import br.com.golive.constants.ChaveSessao;
import br.com.golive.entity.perfilconfiguracao.model.ColunaPerfil;
import br.com.golive.exception.GoLiveException;

public class ServiceUtils {

	public static Map<String, Object> getSessionMap() {
		return FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
	}

	public static boolean verificarNaSessaoPorChave(final ChaveSessao chave) {
		return getSessionMap().containsKey(chave.getChave());
	}

	@SuppressWarnings("unchecked")
	public static <T> T obterValorPorChave(final Class<T> clazz, final ChaveSessao chave) {
		return (T) getSessionMap().get(chave.getChave());
	}

	public static void guardarObjetoSessao(final ChaveSessao chave, final Object valor) {
		getSessionMap().put(chave.getChave(), valor);
	}

	public static void guardarObjetoSessao(final String chave, final Map<String, Object> valor) {
		getSessionMap().put(chave, valor);
	}

	public static void removerObjetoSessao(final ChaveSessao chave) {
		getSessionMap().remove(chave.getChave());
	}

	public static void removerObjetoSessao(final String chave) {
		getSessionMap().remove(chave);
	}

	public static boolean verificarNaSessaoPorChave(final String chave) {
		return getSessionMap().containsKey(chave);
	}

	@SuppressWarnings("unchecked")
	public static <T> Map<String, Object> obterMapPorChave(final String chave) {
		return (Map<String, Object>) getSessionMap().get(chave);
	}

	public static List<ColunaPerfil> criarConfiguracaoPaginaUsuario(final List<ColunaPerfil> tableColunas, final Class<?>... entityClasses) {
		final List<ColunaPerfil> ret = new ArrayList<ColunaPerfil>();

		Long cont = 1L;
		for (final Class<?> entityClass : entityClasses) {
			for (final Field field : entityClass.getDeclaredFields()) {
				if (!field.isAnnotationPresent(Transient.class)) {
					if (field.isAnnotationPresent(StandardColumn.class)) {
						final String coluna = field.getAnnotation(Column.class).name();
						try {
							ret.add(getColuna(coluna, tableColunas, cont++));
						} catch (final GoLiveException e) {
							throw new GoLiveException("Classe = " + entityClass.getName() + ", coluna = " + coluna);
						}

					}
				}
			}
		}

		return ret;
	}

	private static ColunaPerfil getColuna(final String coluna, final List<ColunaPerfil> colunasTabela, final Long cont) throws GoLiveException {
		for (final ColunaPerfil colunaPerfil : colunasTabela) {
			if (colunaPerfil.getId().getColuna().equals(coluna)) {
				colunaPerfil.getId().setOrdem(cont);
				return colunaPerfil;
			}
		}
		throw new GoLiveException("Classe nao possui coluna ");
	}

}
