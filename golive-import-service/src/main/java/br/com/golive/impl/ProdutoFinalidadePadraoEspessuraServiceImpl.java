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
import br.com.golive.entity.finalidadepadraoespessura.model.ProdutoFinalidadePadraoEspessuraModel;
import br.com.golive.entity.finalidadepadraoespessura.repositorio.ProdutoFinalidadePadraoEspessuraJPA;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.filter.GoliveFilter;
import br.com.golive.interceptor.EntityManagerInjectionInterceptor;
import br.com.golive.interceptor.LogAuditoriaInterceptor;
import br.com.golive.navigation.component.KeySubQueries;
import br.com.golive.navigation.component.LazyModel;
import br.com.golive.navigation.component.OrderByDynamicColumn;
import br.com.golive.service.ProdutoFinalidadePadraoEspessuraService;

@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class ProdutoFinalidadePadraoEspessuraServiceImpl implements ProdutoFinalidadePadraoEspessuraService {

	@Inject
	private Logger logger;
	
	@Inject
	private ProdutoFinalidadePadraoEspessuraJPA produtoFinalidadePadraoEspessuraJPA;
	
	@Override
	@CrudOperation(type = Operation.INSERT)
	@Interceptors({ EntityManagerInjectionInterceptor.class, LogAuditoriaInterceptor.class })
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void salvar(Usuario usuario, Empresa empresa, ProdutoFinalidadePadraoEspessuraModel entity) {
		logger.info("Salvando FinalidadePadraoEspessura ={}", entity);
		produtoFinalidadePadraoEspessuraJPA.save(entity);
	}

	@Override
	@CrudOperation(type = Operation.UPDATE)
	@Interceptors({ EntityManagerInjectionInterceptor.class, LogAuditoriaInterceptor.class })
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void atualizar(Usuario usuario, Empresa empresa, ProdutoFinalidadePadraoEspessuraModel entity) {
		logger.info("Atualizando FinalidadePadraoEspessura ={}", entity.getId());
		produtoFinalidadePadraoEspessuraJPA.update(entity);
	}

	@Override
	@CrudOperation(type = Operation.DELETE)
	@Interceptors({ EntityManagerInjectionInterceptor.class, LogAuditoriaInterceptor.class })
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void remover(Usuario usuario, Empresa empresa, ProdutoFinalidadePadraoEspessuraModel entity) {
		logger.info("Removendo FinalidadePadraoEspessura ={}", entity.getId());
		produtoFinalidadePadraoEspessuraJPA.delete(entity);
	}

	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public void refresh(Usuario usuario, Empresa empresa, ProdutoFinalidadePadraoEspessuraModel entity) {
		produtoFinalidadePadraoEspessuraJPA.refresh(entity);
	}

	@Override
	public List<ProdutoFinalidadePadraoEspessuraModel> obterLista(Usuario usuario, Empresa empresa) {
		logger.info("Obtendo lista de FinalidadePadraoEspessura ={} ");
		return produtoFinalidadePadraoEspessuraJPA.obterLista();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public LazyModel<ProdutoFinalidadePadraoEspessuraModel> obterListaLazy(Usuario usuario, Empresa empresa, int startIndex, int pageSize, Map<String, GoliveFilter> parameters, OrderByDynamicColumn order, Map<KeySubQueries, Map<String, GoliveFilter>> subQueries, List<String> listLazy) {
		return produtoFinalidadePadraoEspessuraJPA.obterListaLazy(startIndex, pageSize, parameters, order, subQueries, listLazy);
	}
}