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
import br.com.golive.entity.unidade.model.UnidadeModel;
import br.com.golive.entity.unidade.repositorio.UnidadeJPA;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.filter.GoliveFilter;
import br.com.golive.interceptor.EntityManagerInjectionInterceptor;
import br.com.golive.interceptor.LogAuditoriaInterceptor;
import br.com.golive.navigation.component.KeySubQueries;
import br.com.golive.navigation.component.LazyModel;
import br.com.golive.navigation.component.OrderByDynamicColumn;
import br.com.golive.service.UnidadeService;

@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class UnidadeServiceImpl implements UnidadeService {

	@Inject
	private Logger logger;

	@Inject
	private UnidadeJPA unidadeJPA;

	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public List<UnidadeModel> obterLista(final Usuario usuario, final Empresa empresa) {
		logger.info("Obtendo Lista de Unidades");
		return unidadeJPA.findAllWithoutLazy();
	}

	@Override
	@CrudOperation(type = Operation.INSERT)
	@Interceptors({ EntityManagerInjectionInterceptor.class, LogAuditoriaInterceptor.class })
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void salvar(final Usuario usuario, final Empresa empresa, final UnidadeModel unidadeModel) {
		logger.info("Salvando unidade ={}", unidadeModel);
		unidadeJPA.save(unidadeModel);
	}

	@Override
	@CrudOperation(type = Operation.UPDATE)
	@Interceptors({ EntityManagerInjectionInterceptor.class, LogAuditoriaInterceptor.class })
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void atualizar(final Usuario usuario, final Empresa empresa, final UnidadeModel unidadeModel) {
		logger.info("Atualizando unidade ={}", unidadeModel);
		unidadeJPA.update(unidadeModel);
	}

	@Override
	@CrudOperation(type = Operation.DELETE)
	@Interceptors({ EntityManagerInjectionInterceptor.class, LogAuditoriaInterceptor.class })
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void remover(final Usuario usuario, final Empresa empresa, final UnidadeModel unidadeModel) {
		logger.info("Removendo unidade ={}", unidadeModel);
		unidadeJPA.delete(unidadeModel);
	}

	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public void refresh(final Usuario usuario, final Empresa empresa, final UnidadeModel unidadeModel) {
		logger.info("Revertendo propriedades da unidade ={}", unidadeModel);
		unidadeJPA.refresh(unidadeModel);
	}

	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public LazyModel<UnidadeModel> obterListaLazy(final Usuario usuario, final Empresa empresa, final int startIndex, final int pageSize, final Map<String, GoliveFilter> parameters, final OrderByDynamicColumn order, final Map<KeySubQueries, Map<String, GoliveFilter>> subQueries, final List<String> lazy) {
		return unidadeJPA.obterListaLazy(startIndex, pageSize, parameters, order, subQueries, lazy);
	}

}
