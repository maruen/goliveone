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
		return (T) getSessionMap().get(chave);
	}

	public static void guardarObjetoSessao(final ChaveSessao chave, final Object valor) {
		getSessionMap().put(chave.getChave(), valor);
	}
}
