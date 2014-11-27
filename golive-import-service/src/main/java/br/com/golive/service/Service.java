package br.com.golive.service;

import java.util.List;
import java.util.Map;

import br.com.golive.filter.GoliveFilter;
import br.com.golive.navigation.component.LazyModel;
import br.com.golive.navigation.component.OrderByDynamicColumn;

public interface Service<T> {

	public List<T> obterLista();

	public LazyModel<T> obterListaLazy(final int startIndex, final int pageSize, final Map<String, GoliveFilter> parameters, final OrderByDynamicColumn order);

	public void salvar(final T entity);

	public void atualizar(final T entity);

	public void remover(final T entity);

	public void refresh(final T entity);

}
