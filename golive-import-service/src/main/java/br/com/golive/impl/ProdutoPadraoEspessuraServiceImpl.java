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
import br.com.golive.entity.padraoespessura.model.ProdutoPadraoEspessuraModel;
import br.com.golive.entity.padraoespessura.repositorio.ProdutoPadraoEspessuraJPA;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.filter.GoliveFilter;
import br.com.golive.interceptor.EntityManagerInjectionInterceptor;
import br.com.golive.interceptor.LogAuditoriaInterceptor;
import br.com.golive.navigation.component.KeySubQueries;
import br.com.golive.navigation.component.LazyModel;
import br.com.golive.navigation.component.OrderByDynamicColumn;
import br.com.golive.service.ProdutoPadraoEspessuraService;

@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class ProdutoPadraoEspessuraServiceImpl implements ProdutoPadraoEspessuraService {

	@Inject
	private Logger logger;

	@Inject
	private ProdutoPadraoEspessuraJPA produtoPadraoEspessuraJPA;

	@Override
	public List<ProdutoPadraoEspessuraModel> obterLista(final Usuario usuario, final Empresa empresa) {
		logger.info("Obtendo Lista de ProdutoPadraoEspessuraModel");
		return produtoPadraoEspessuraJPA.findAllWithoutLazy("departamentoSelected", "grupoProdutoSelected", "subGrupoProdutoSelected", "colecaoSelected", "corProdutoSelected", "unidadeSelected");
	}

	@Override
	@CrudOperation(type = Operation.INSERT)
	@Interceptors({ EntityManagerInjectionInterceptor.class, LogAuditoriaInterceptor.class })
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void salvar(final Usuario usuario, final Empresa empresa, final ProdutoPadraoEspessuraModel model) {
		logger.info("Salvando ProdutoPadraoEspessura = {}", model);
		produtoPadraoEspessuraJPA.save(model);
	}

	@Override
	@CrudOperation(type = Operation.UPDATE)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	@Interceptors({ EntityManagerInjectionInterceptor.class, LogAuditoriaInterceptor.class })
	public void atualizar(final Usuario usuario, final Empresa empresa, final ProdutoPadraoEspessuraModel model) {
		logger.info("Atualizando ProdutoPadraoEspessura = {}", model);
		produtoPadraoEspessuraJPA.update(model);
	}

	@Override
	@CrudOperation(type = Operation.DELETE)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	@Interceptors({ EntityManagerInjectionInterceptor.class, LogAuditoriaInterceptor.class })
	public void remover(final Usuario usuario, final Empresa empresa, final ProdutoPadraoEspessuraModel model) {
		logger.info("Removendo ProdutoPadraoEspessura = {}", model);
		produtoPadraoEspessuraJPA.delete(model);
	}

	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public void refresh(final Usuario usuario, final Empresa empresa, final ProdutoPadraoEspessuraModel model) {
		logger.info("Refresh ProdutoPadraoEspessura = {}", model);
		produtoPadraoEspessuraJPA.refresh(model);
	}

	@SuppressWarnings("rawtypes")
	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public LazyModel<ProdutoPadraoEspessuraModel> obterListaLazy(final Usuario usuario, final Empresa empresa, final int startIndex, final int pageSize, final Map<String, GoliveFilter> parameters, final OrderByDynamicColumn order, final Map<KeySubQueries, Map<String, GoliveFilter>> subQueries, final List<String> lazy) {
		return produtoPadraoEspessuraJPA.obterListaLazy(startIndex, pageSize, parameters, order, subQueries, lazy);
	}
}
