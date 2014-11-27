package br.com.golive.navigation.component;

import java.util.List;

public class LazyModel<T> {

	private Long count;
	
	private List<T> lista;

	public Long getCount() {
		return count;
	}

	public void setCount(Long count) {
		this.count = count;
	}

	public List<T> getLista() {
		return lista;
	}

	public void setLista(List<T> lista) {
		this.lista = lista;
	}

	public LazyModel(Long count, List<T> lista) {
		super();
		this.count = count;
		this.lista = lista;
	}

	public LazyModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
