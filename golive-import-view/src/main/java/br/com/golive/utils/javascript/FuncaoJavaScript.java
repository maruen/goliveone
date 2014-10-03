package br.com.golive.utils.javascript;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class FuncaoJavaScript {

	private final String nome;

	private List<String> parametros;

	public FuncaoJavaScript(final String nome, final String... parametros) {
		super();
		this.nome = nome;

		if (parametros != null) {
			this.parametros = Arrays.asList(parametros);
		} else {
			this.parametros = new ArrayList<String>();
		}
	}

	public List<String> getParametros() {
		return parametros;
	}

	public void setParametros(final List<String> parametros) {
		this.parametros = parametros;
	}

	public String getNome() {
		return nome;
	}

}
