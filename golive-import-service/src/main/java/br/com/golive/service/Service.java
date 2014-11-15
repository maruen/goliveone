package br.com.golive.service;

import java.util.List;

public interface Service<T> {

	public List<T> obterLista();

	public void salvar(T entity);

	public void atualizar(T entity);

	public void remover(T entity);

	public void refresh(T entity);

}
