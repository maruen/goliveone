package br.com.golive.impl;

import java.util.List;
import java.util.Map;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.inject.Inject;
import javax.interceptor.Interceptors;

import org.slf4j.Logger;

import br.com.golive.entity.areaDeAtuacao.model.AreaDeAtuacaoModel;
import br.com.golive.entity.areaDeAtuacao.repositorio.AreaDeAtuacaoJPA;
import br.com.golive.entity.empresas.empresa.model.Empresa;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.filter.GoliveFilter;
import br.com.golive.interceptor.EntityManagerInjectionInterceptor;
import br.com.golive.navigation.component.KeySubQueries;
import br.com.golive.navigation.component.LazyModel;
import br.com.golive.navigation.component.OrderByDynamicColumn;
import br.com.golive.service.AreaDeAtuacaoService;

@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class AreaDeAtuacaoServiceImpl implements AreaDeAtuacaoService {

	@Inject
	private Logger logger;

	@Inject
	private AreaDeAtuacaoJPA areaDeAtuacaoJPA;

	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public List<AreaDeAtuacaoModel> obterLista(final Usuario usuario, final Empresa empresa) {
		logger.info("Obtendo Lista de Area de atuacao");
		return areaDeAtuacaoJPA.findAll();
	}

	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public void salvar(final Usuario usuario, final Empresa empresa, final AreaDeAtuacaoModel areaDeAtuacaoModel) {
		logger.info("Salvando departamento model");
		areaDeAtuacaoJPA.save(areaDeAtuacaoModel);
	}

	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public void atualizar(final Usuario usuario, final Empresa empresa, final AreaDeAtuacaoModel entity) {
		// TODO Auto-generated method stub

	}

	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public void remover(final Usuario usuario, final Empresa empresa, final AreaDeAtuacaoModel entity) {
		// TODO Auto-generated method stub

	}

	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public void refresh(final Usuario usuario, final Empresa empresa, final AreaDeAtuacaoModel entity) {
		// TODO Auto-generated method stub

	}

	@SuppressWarnings("rawtypes")
	@Override
	@Interceptors(EntityManagerInjectionInterceptor.class)
	public LazyModel<AreaDeAtuacaoModel> obterListaLazy(final Usuario usuario, final Empresa empresa, final int startIndex, final int pageSize, final Map<String, GoliveFilter> parameters, final OrderByDynamicColumn order, final Map<KeySubQueries, Map<String, GoliveFilter>> subQueries, final List<String> lazy) {
		// TODO Auto-generated method stub
		return null;
	}

}
