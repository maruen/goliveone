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
import br.com.golive.entity.unidade.model.UnidadeModel;
import br.com.golive.entity.unidade.repositorio.UnidadeJPA;
import br.com.golive.interceptor.LogAuditoriaInterceptor;
import br.com.golive.service.UnidadeService;

@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class UnidadeServiceImpl implements UnidadeService {

	@Inject
	private Logger logger;

	@Inject
	private UnidadeJPA unidadeJPA;

	@Override
	public List<UnidadeModel> obterLista() {
		logger.info("Obtendo Lista de Unidades");
		return unidadeJPA.findAllWithoutLazy();
	}

	@Override
	@CrudOperation(type = Operation.INSERT)
	@Interceptors(LogAuditoriaInterceptor.class)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void salvar(final UnidadeModel unidadeModel) {
		logger.info("Salvando unidade ={}", unidadeModel);
		unidadeJPA.save(unidadeModel);
	}

	@Override
	@CrudOperation(type = Operation.UPDATE)
	@Interceptors(LogAuditoriaInterceptor.class)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void atualizar(final UnidadeModel unidadeModel) {
		logger.info("Atualizando unidade ={}", unidadeModel);
		unidadeJPA.update(unidadeModel);
	}

	@Override
	@CrudOperation(type = Operation.DELETE)
	@Interceptors(LogAuditoriaInterceptor.class)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void remover(final UnidadeModel unidadeModel) {
		logger.info("Removendo unidade ={}", unidadeModel);
		unidadeJPA.delete(unidadeModel);
	}

	@Override
	public void refresh(final UnidadeModel unidadeModel) {
		logger.info("Revertendo propriedades da unidade ={}", unidadeModel);
		unidadeJPA.refresh(unidadeModel);
	}

	@Override
	public List<UnidadeModel> obterListaLazy(final Long lastId) {
		// TODO Auto-generated method stub
		return null;
	}

}
