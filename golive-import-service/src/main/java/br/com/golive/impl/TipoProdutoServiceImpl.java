package br.com.golive.impl;

import java.util.List;
import java.util.Map;

import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.inject.Inject;
import javax.interceptor.Interceptors;

import org.slf4j.Logger;

import br.com.golive.annotation.CrudOperation;
import br.com.golive.constants.Operation;
import br.com.golive.entity.empresas.empresa.model.Empresa;
import br.com.golive.entity.tipoproduto.model.TipoProdutoModel;
import br.com.golive.entity.tipoproduto.repositorio.TipoProdutoJPA;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.filter.GoliveFilter;
import br.com.golive.interceptor.EntityManagerInjectionInterceptor;
import br.com.golive.interceptor.LogAuditoriaInterceptor;
import br.com.golive.navigation.component.KeySubQueries;
import br.com.golive.navigation.component.LazyModel;
import br.com.golive.navigation.component.OrderByDynamicColumn;
import br.com.golive.service.TipoProdutoService;

@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class TipoProdutoServiceImpl implements TipoProdutoService {

	@Inject
	private Logger logger;

	@Inject
	private TipoProdutoJPA tipoProdutoJPA;

	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public List<TipoProdutoModel> obterLista(final Usuario usuario, final Empresa empresa) {
		logger.info("Obtendo Lista de TipoProdutoModel");
		return tipoProdutoJPA.findAllWithoutLazy();
	}

	@Override
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	@CrudOperation(type = Operation.INSERT)
	@Interceptors({ EntityManagerInjectionInterceptor.class, LogAuditoriaInterceptor.class })
	public void salvar(final Usuario usuario, final Empresa empresa, final TipoProdutoModel model) {
		logger.info("Salvando TipoProduto = {}", model);
		tipoProdutoJPA.save(model);
	}

	@Override
	@CrudOperation(type = Operation.UPDATE)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	@Interceptors({ EntityManagerInjectionInterceptor.class, LogAuditoriaInterceptor.class })
	public void atualizar(final Usuario usuario, final Empresa empresa, final TipoProdutoModel model) {
		logger.info("Atualizando TipoProduto = {}", model);
		tipoProdutoJPA.update(model);
	}

	@Override
	@CrudOperation(type = Operation.DELETE)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	@Interceptors({ EntityManagerInjectionInterceptor.class, LogAuditoriaInterceptor.class })
	public void remover(final Usuario usuario, final Empresa empresa, final TipoProdutoModel model) {
		logger.info("Removendo TipoProduto = {}", model);
		tipoProdutoJPA.delete(model);
	}

	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public void refresh(final Usuario usuario, final Empresa empresa, final TipoProdutoModel model) {
		logger.info("Refresh TipoProduto = {}", model);
		tipoProdutoJPA.refresh(model);
	}

	@SuppressWarnings("rawtypes")
	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public LazyModel<TipoProdutoModel> obterListaLazy(final Usuario usuario, final Empresa empresa, final int startIndex, final int pageSize, final Map<String, GoliveFilter> parameters, final OrderByDynamicColumn order, final Map<KeySubQueries, Map<String, GoliveFilter>> subQueries, final List<String> lazy) {
		return tipoProdutoJPA.obterListaLazy(startIndex, pageSize, parameters, order, subQueries, lazy);
	}
}