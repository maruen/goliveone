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
import br.com.golive.entity.colecoes.repositorio.ColecoesJPA;
import br.com.golive.entity.empresas.empresa.model.Empresa;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.filter.GoliveFilter;
import br.com.golive.interceptor.EntityManagerInjectionInterceptor;
import br.com.golive.interceptor.LogAuditoriaInterceptor;
import br.com.golive.navigation.component.KeySubQueries;
import br.com.golive.navigation.component.LazyModel;
import br.com.golive.navigation.component.OrderByDynamicColumn;
import br.com.golive.service.ColecoesService;

@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class ColecoesServiceImpl implements ColecoesService {

	@Inject
	private Logger logger;

	@Inject
	private ColecoesJPA colecoesJPA;

	@Override
	@CrudOperation(type = Operation.INSERT)
	@Interceptors({ EntityManagerInjectionInterceptor.class, LogAuditoriaInterceptor.class })
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void salvar(final Usuario usuario, final Empresa empresa, final ColecoesModel colecoesModel) {
		logger.info("Salvando ColecoesModel ={}", colecoesModel);
		colecoesJPA.save(colecoesModel);
	}

	@Override
	@CrudOperation(type = Operation.UPDATE)
	@Interceptors({ EntityManagerInjectionInterceptor.class, LogAuditoriaInterceptor.class })
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void atualizar(final Usuario usuario, final Empresa empresa, final ColecoesModel entity) {
		logger.info("Atualizando ColecoesModel ={}", entity.getId());
		colecoesJPA.update(entity);
	}

	@Override
	@CrudOperation(type = Operation.DELETE)
	@Interceptors({ EntityManagerInjectionInterceptor.class, LogAuditoriaInterceptor.class })
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void remover(final Usuario usuario, final Empresa empresa, final ColecoesModel colecoesModel) {
		logger.info("Removendo colecoesModel ={}", colecoesModel.getId());
		colecoesJPA.delete(colecoesModel);
	}

	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public void refresh(final Usuario usuario, final Empresa empresa, final ColecoesModel model) {
		colecoesJPA.refresh(model);
	}

	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public List<ColecoesModel> obterListaPorSubGrupo(final Usuario usuario, final Empresa empresa, final SubGrupoProdutoModel model) {
		logger.info("Obtendo lista de ColecoesModel por subgrupo = {} ");
		return colecoesJPA.obterListaPorSubGrupo(model);
	}

	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public List<ColecoesModel> obterLista(final Usuario usuario, final Empresa empresa) {
		return colecoesJPA.findAllWithoutLazy("grupoProdutoSelected", "departamentoSelected", "subGrupoProdutoSelected");
	}

	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public LazyModel<ColecoesModel> obterListaLazy(final Usuario usuario, final Empresa empresa, final int startIndex, final int pageSize, final Map<String, GoliveFilter> parameters, final OrderByDynamicColumn order, final Map<KeySubQueries, Map<String, GoliveFilter>> subQueries, final List<String> lazy) {
		return colecoesJPA.obterListaLazy(startIndex, pageSize, parameters, order, subQueries, lazy);

	}

}
