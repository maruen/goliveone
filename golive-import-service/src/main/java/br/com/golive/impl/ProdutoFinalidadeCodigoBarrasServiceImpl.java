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
import br.com.golive.entity.finalidadecodigobarras.model.ProdutoFinalidadeCodigoBarrasModel;
import br.com.golive.entity.finalidadecodigobarras.repositorio.ProdutoFinalidadeCodigoBarrasJPA;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.filter.GoliveFilter;
import br.com.golive.interceptor.EntityManagerInjectionInterceptor;
import br.com.golive.interceptor.LogAuditoriaInterceptor;
import br.com.golive.navigation.component.KeySubQueries;
import br.com.golive.navigation.component.LazyModel;
import br.com.golive.navigation.component.OrderByDynamicColumn;
import br.com.golive.service.ProdutoFinalidadeCodigoBarrasService;

@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class ProdutoFinalidadeCodigoBarrasServiceImpl implements
		ProdutoFinalidadeCodigoBarrasService {

	@Inject
	private Logger logger;

	@Inject
	private ProdutoFinalidadeCodigoBarrasJPA produtoFinalidadeCodigoBarrasJPA;

	@Override
	@CrudOperation(type = Operation.INSERT)
	@Interceptors({ EntityManagerInjectionInterceptor.class,
			LogAuditoriaInterceptor.class })
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void salvar(Usuario usuario, Empresa empresa,
			ProdutoFinalidadeCodigoBarrasModel entity) {
		logger.info("Salvando FinalidadeCodigoBarras ={}", entity);
		produtoFinalidadeCodigoBarrasJPA.save(entity);
	}

	@Override
	@CrudOperation(type = Operation.UPDATE)
	@Interceptors({ EntityManagerInjectionInterceptor.class, LogAuditoriaInterceptor.class })
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void atualizar(Usuario usuario, Empresa empresa,
			ProdutoFinalidadeCodigoBarrasModel entity) {
		logger.info("Atualizando FinalidadeCodigoBarras ={}", entity.getId());
		produtoFinalidadeCodigoBarrasJPA.update(entity);
	}

	@Override
	@CrudOperation(type = Operation.DELETE)
	@Interceptors({ EntityManagerInjectionInterceptor.class, LogAuditoriaInterceptor.class })
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void remover(Usuario usuario, Empresa empresa,
			ProdutoFinalidadeCodigoBarrasModel entity) {
		logger.info("Removendo FinalidadeCodigoBarras ={}", entity.getId());
		produtoFinalidadeCodigoBarrasJPA.delete(entity);
	}

	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public void refresh(Usuario usuario, Empresa empresa,
			ProdutoFinalidadeCodigoBarrasModel entity) {
		produtoFinalidadeCodigoBarrasJPA.refresh(entity);
	}

	@Override
	public List<ProdutoFinalidadeCodigoBarrasModel> obterLista(Usuario usuario,
			Empresa empresa) {
		logger.info("Obtendo lista de FinalidadeCodigoBarras = {} ");
		return produtoFinalidadeCodigoBarrasJPA.obterLista();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public LazyModel<ProdutoFinalidadeCodigoBarrasModel> obterListaLazy(
			Usuario usuario, Empresa empresa, int startIndex, int pageSize,
			Map<String, GoliveFilter> parameters, OrderByDynamicColumn order,
			Map<KeySubQueries, Map<String, GoliveFilter>> subQueries,
			List<String> listLazy) {
		return produtoFinalidadeCodigoBarrasJPA.obterListaLazy(startIndex, pageSize, parameters, order, subQueries, listLazy);
	}
}