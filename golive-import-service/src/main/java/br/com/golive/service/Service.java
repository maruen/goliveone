package br.com.golive.service;

import java.util.List;

public interface Service<T> {

	public List<T> obterLista();

	public List<T> obterListaLazy(final Long lastId);

	public void salvar(final T entity);

	public void atualizar(final T entity);

	public void remover(final T entity);

	public void refresh(final T entity);

}
