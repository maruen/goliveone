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
import br.com.golive.entity.Model;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.empresas.empresa.model.Empresa;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.entity.grupoprodutos.repositorio.GrupoProdutoJPA;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.filter.GoliveFilter;
import br.com.golive.interceptor.EntityManagerInjectionInterceptor;
import br.com.golive.interceptor.LogAuditoriaInterceptor;
import br.com.golive.navigation.component.KeySubQueries;
import br.com.golive.navigation.component.LazyModel;
import br.com.golive.navigation.component.OrderByDynamicColumn;
import br.com.golive.service.GrupoProdutoService;

@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class GrupoProdutoServiceImpl implements GrupoProdutoService {

	@Inject
	private Logger logger;

	@Inject
	private GrupoProdutoJPA grupoProdutoJPA;

	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public List<GrupoProdutosModel> obterLista(final Usuario usuario, final Empresa empresa) {
		logger.info("Obtendo lista de grupos de produto");
		return grupoProdutoJPA.obterLista();
	}

	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public GrupoProdutosModel obterGrupoProdutoAtual(final Usuario usuario, final Empresa empresa, final Model model) {
		logger.info("Obtendo objeto atual de grupos de produto");
		return grupoProdutoJPA.findByIdWithLazys(model.getId(), "departamentoModel");
	}

	@Override
	@CrudOperation(type = Operation.INSERT)
	@Interceptors({ EntityManagerInjectionInterceptor.class, LogAuditoriaInterceptor.class })
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void salvar(final Usuario usuario, final Empresa empresa, final GrupoProdutosModel grupoProdutosModel) {
		logger.info("Salvando grupo produto = {}", grupoProdutosModel);
		grupoProdutoJPA.refreshModel(grupoProdutosModel.getDepartamentoModel());
		grupoProdutoJPA.save(grupoProdutosModel);
	}

	@Override
	@CrudOperation(type = Operation.UPDATE)
	@Interceptors({ EntityManagerInjectionInterceptor.class, LogAuditoriaInterceptor.class })
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void atualizar(final Usuario usuario, final Empresa empresa, final GrupoProdutosModel grupoProdutosModel) {
		logger.info("Atualizando grupo produto = {}", grupoProdutosModel.getId());
		grupoProdutoJPA.update(grupoProdutosModel);
	}

	@Override
	@CrudOperation(type = Operation.DELETE)
	@Interceptors({ EntityManagerInjectionInterceptor.class, LogAuditoriaInterceptor.class })
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void remover(final Usuario usuario, final Empresa empresa, final GrupoProdutosModel grupoProdutosModel) {
		logger.info("Excluindo grupo produto = {}", grupoProdutosModel.getId());
		grupoProdutoJPA.removeModel(grupoProdutosModel);
	}

	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public List<GrupoProdutosModel> obterGrupoProdutoDepartamentoPorDepartamento(final Usuario usuario, final Empresa empresa, final DepartamentoModel departamentoModel) {
		logger.info("Obtendo Grupo de produtos por departamento = {}");
		return grupoProdutoJPA.obterListaPorDepartamento(departamentoModel);
	}

	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public void refresh(final Usuario usuario, final Empresa empresa, final GrupoProdutosModel model) {
		grupoProdutoJPA.refresh(model);

	}

	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public LazyModel<GrupoProdutosModel> obterListaLazy(final Usuario usuario, final Empresa empresa, final int startIndex, final int pageSize, final Map<String, GoliveFilter> parameters, final OrderByDynamicColumn order, final Map<KeySubQueries, Map<String, GoliveFilter>> subQueries, final List<String> lazy) {
		return grupoProdutoJPA.obterListaLazy(startIndex, pageSize, parameters, order, subQueries, lazy);
	}
}
