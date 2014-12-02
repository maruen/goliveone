package br.com.golive.service;

import java.util.List;
import java.util.Map;

import br.com.golive.entity.empresas.empresa.model.Empresa;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.filter.GoliveFilter;
import br.com.golive.navigation.component.KeySubQueries;
import br.com.golive.navigation.component.LazyModel;
import br.com.golive.navigation.component.OrderByDynamicColumn;

public interface Service<T> {

	public List<T> obterLista(final Usuario usuario, final Empresa empresa);

	public LazyModel<T> obterListaLazy(final Usuario usuario, final Empresa empresa, final int startIndex, final int pageSize, final Map<String, GoliveFilter> parameters, final OrderByDynamicColumn order, final Map<KeySubQueries, Map<String, GoliveFilter>> subQueries, final List<String> listLazy);

	public void salvar(final Usuario usuario, final Empresa empresa, final T entity);

	public void atualizar(final Usuario usuario, final Empresa empresa, final T entity);

	public void remover(final Usuario usuario, final Empresa empresa, final T entity);

	public void refresh(final Usuario usuario, final Empresa empresa, final T entity);

}
