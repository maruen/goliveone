package br.com.golive.impl;

import java.util.List;

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
import br.com.golive.entity.areaDeAtuacao.model.AreaDeAtuacaoModel;
import br.com.golive.entity.areaDeAtuacao.repositorio.AreaDeAtuacaoJPA;
import br.com.golive.interceptor.LogAuditoriaInterceptor;
import br.com.golive.service.AreaDeAtuacaoService;

@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class AreaDeAtuacaoServiceImpl implements AreaDeAtuacaoService {

	@Inject
	private Logger logger;

	@Inject
	private AreaDeAtuacaoJPA areaDeAtuacaoJPA;

	@Override
	public List<AreaDeAtuacaoModel> obterLista() {
		logger.info("Obtendo Lista de Area de atuacao");
		return areaDeAtuacaoJPA.findAll();
	}

	@Override
	@CrudOperation(type = Operation.INSERT)
	@Interceptors(LogAuditoriaInterceptor.class)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void salvar(final AreaDeAtuacaoModel areaDeAtuacaoModel) {
		logger.info("Salvando departamento model");
		areaDeAtuacaoJPA.save(areaDeAtuacaoModel);
	}

	@Override
	public void atualizar(final AreaDeAtuacaoModel entity) {
		// TODO Auto-generated method stub

	}

	@Override
	public void remover(final AreaDeAtuacaoModel entity) {
		// TODO Auto-generated method stub

	}

	@Override
	public void refresh(final AreaDeAtuacaoModel entity) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<AreaDeAtuacaoModel> obterListaLazy(final Long lastId) {
		// TODO Auto-generated method stub
		return null;
	}

}
