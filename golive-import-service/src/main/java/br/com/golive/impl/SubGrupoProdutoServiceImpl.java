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
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.entity.subgrupoprodutos.repository.SubGrupoProdutoJPA;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.filter.GoliveFilter;
import br.com.golive.interceptor.EntityManagerInjectionInterceptor;
import br.com.golive.interceptor.LogAuditoriaInterceptor;
import br.com.golive.navigation.component.KeySubQueries;
import br.com.golive.navigation.component.LazyModel;
import br.com.golive.navigation.component.OrderByDynamicColumn;
import br.com.golive.service.SubGrupoProdutoService;

@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class SubGrupoProdutoServiceImpl implements SubGrupoProdutoService {

	@Inject
	private SubGrupoProdutoJPA subGrupoProdutoJPA;

	@Inject
	private Logger logger;

	@Override
	@CrudOperation(type = Operation.INSERT)
	@Interceptors({ EntityManagerInjectionInterceptor.class, LogAuditoriaInterceptor.class })
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void salvar(final Usuario usuario, final Empresa empresa, final SubGrupoProdutoModel model) {
		logger.info("Salvando subGrupoProdutoModel");
		subGrupoProdutoJPA.refreshModel(model.getDepartamentoSelected());
		subGrupoProdutoJPA.refreshModel(model.getGrupoProdutoSelected());
		subGrupoProdutoJPA.save(model);
	}

	@Override
	@CrudOperation(type = Operation.UPDATE)
	@Interceptors({ EntityManagerInjectionInterceptor.class, LogAuditoriaInterceptor.class })
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void atualizar(final Usuario usuario, final Empresa empresa, final SubGrupoProdutoModel model) {
		logger.info("Atualizando SubgrupoProduto = {} ", model.getId());
		subGrupoProdutoJPA.update(model);
	}

	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public List<SubGrupoProdutoModel> obterLista(final Usuario usuario, final Empresa empresa) {
		return subGrupoProdutoJPA.findAllWithoutLazy("grupoProdutoSelected", "departamentoSelected");
	}

	@Override
	@CrudOperation(type = Operation.DELETE)
	@Interceptors({ EntityManagerInjectionInterceptor.class, LogAuditoriaInterceptor.class })
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void remover(final Usuario usuario, final Empresa empresa, final SubGrupoProdutoModel model) {
		logger.info("Removendo SubGrupoProduto = {} ", model.getId());
		subGrupoProdutoJPA.delete(model);
	}

	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public List<SubGrupoProdutoModel> obterSubGrupoProdutoPorGrupo(final Usuario usuario, final Empresa empresa, final GrupoProdutosModel model) {
		logger.info("obterSubGrupoProdutoPorGrupo");
		return subGrupoProdutoJPA.obterListaPorGrupo(model);
	}

	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public void refresh(final Usuario usuario, final Empresa empresa, final SubGrupoProdutoModel model) {
		subGrupoProdutoJPA.refresh(model);

	}

	@SuppressWarnings("rawtypes")
	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public LazyModel<SubGrupoProdutoModel> obterListaLazy(final Usuario usuario, final Empresa empresa, final int startIndex, final int pageSize, final Map<String, GoliveFilter> parameters, final OrderByDynamicColumn order, final Map<KeySubQueries, Map<String, GoliveFilter>> subQueries, final List<String> lazy) {
		return subGrupoProdutoJPA.obterListaLazy(startIndex, pageSize, parameters, order, subQueries, lazy);
	}

}
