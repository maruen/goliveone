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
import br.com.golive.entity.colecoes.model.ColecoesModel;
import br.com.golive.entity.empresas.empresa.model.Empresa;
import br.com.golive.entity.especialidades.model.CorProdutoModel;
import br.com.golive.entity.especialidades.repository.CorProdutoJPA;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.filter.GoliveFilter;
import br.com.golive.interceptor.EntityManagerInjectionInterceptor;
import br.com.golive.interceptor.LogAuditoriaInterceptor;
import br.com.golive.navigation.component.KeySubQueries;
import br.com.golive.navigation.component.LazyModel;
import br.com.golive.navigation.component.OrderByDynamicColumn;
import br.com.golive.service.CorProdutoService;

@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class CorProdutoServiceImpl implements CorProdutoService {

	@Inject
	private CorProdutoJPA corProdutoJPA;

	@Inject
	private Logger logger;

	@Override
	@CrudOperation(type = Operation.INSERT)
	@Interceptors({ EntityManagerInjectionInterceptor.class, LogAuditoriaInterceptor.class })
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void salvar(final Usuario usuario, final Empresa empresa, final CorProdutoModel model) {
		logger.info("Salvando corProdutoModel");
		corProdutoJPA.refreshModel(model.getDepartamentoSelected());
		corProdutoJPA.refreshModel(model.getGrupoProdutoSelected());
		corProdutoJPA.refreshModel(model.getSubGrupoProdutoSelected());
		corProdutoJPA.refreshModel(model.getColecaoSelected());
		corProdutoJPA.save(model);
	}

	@Override
	@CrudOperation(type = Operation.UPDATE)
	@Interceptors({ EntityManagerInjectionInterceptor.class, LogAuditoriaInterceptor.class })
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void atualizar(final Usuario usuario, final Empresa empresa, final CorProdutoModel model) {
		corProdutoJPA.update(model);
	}

	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public List<CorProdutoModel> obterLista(final Usuario usuario, final Empresa empresa) {
		return corProdutoJPA.findAllWithoutLazy("subGrupoProdutoSelected", "grupoProdutoSelected", "departamentoSelected", "colecaoSelected");
	}

	@Override
	@CrudOperation(type = Operation.DELETE)
	@Interceptors({ EntityManagerInjectionInterceptor.class, LogAuditoriaInterceptor.class })
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void remover(final Usuario usuario, final Empresa empresa, final CorProdutoModel departamentoModel) {
		corProdutoJPA.delete(departamentoModel);
	}

	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public void refresh(final Usuario usuario, final Empresa empresa, final CorProdutoModel model) {
		corProdutoJPA.refresh(model);
	}

	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public List<CorProdutoModel> obterPorColecao(final Usuario usuario, final Empresa empresa, final ColecoesModel colecoesModel) {
		logger.info("Obtendo Lista de cores por colecao");
		return corProdutoJPA.obterListaPorColecao(colecoesModel);
	}

	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public LazyModel<CorProdutoModel> obterListaLazy(final Usuario usuario, final Empresa empresa, final int startIndex, final int pageSize, final Map<String, GoliveFilter> parameters, final OrderByDynamicColumn order, final Map<KeySubQueries, Map<String, GoliveFilter>> subQueries, final List<String> lazy) {
		return corProdutoJPA.obterListaLazy(startIndex, pageSize, parameters, order, subQueries, lazy);
	}
}
