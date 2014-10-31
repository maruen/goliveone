package br.com.golive.impl;

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
import br.com.golive.interceptor.LogAuditoriaInterceptor;
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
	@Interceptors(LogAuditoriaInterceptor.class)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void salvar(final ColecoesModel colecoesModel) {
		logger.info("Salvando ColecoesModel ={}", colecoesModel);
		colecoesJPA.save(colecoesModel);
	}

}
