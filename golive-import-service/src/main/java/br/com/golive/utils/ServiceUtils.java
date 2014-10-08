package br.com.golive.utils;

import java.util.Map;

import javax.faces.context.FacesContext;

import br.com.golive.constants.ChaveSessao;

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

}
