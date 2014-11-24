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
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.departamento.repositorio.DepartamentoJPA;
import br.com.golive.interceptor.LogAuditoriaInterceptor;
import br.com.golive.service.DepartamentoService;

@Stateless
@TransactionManagement(TransactionManagementType.CONTAINER)
public class DepartamentoServiceImpl implements DepartamentoService {

	@Inject
	private DepartamentoJPA departamentoJPA;

	@Inject
	private Logger logger;

	@Override
	@CrudOperation(type = Operation.INSERT)
	@Interceptors(LogAuditoriaInterceptor.class)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void salvar(final DepartamentoModel departamentoModel) {
		logger.info("Salvando departamento model");
		departamentoJPA.save(departamentoModel);
	}

	@Override
	@CrudOperation(type = Operation.UPDATE)
	@Interceptors(LogAuditoriaInterceptor.class)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void atualizar(final DepartamentoModel departamentoModel) {
		departamentoJPA.update(departamentoModel);
	}

	@Override
	public List<DepartamentoModel> obterLista() {
		logger.info("Obtendo Lista de Departamento");
		return departamentoJPA.obterDepartamentos();
	}

	@Override
	@CrudOperation(type = Operation.DELETE)
	@Interceptors(LogAuditoriaInterceptor.class)
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void remover(final DepartamentoModel departamentoModel) {
		logger.info("Excluindo departamento model ={}", departamentoModel.getId());
		departamentoJPA.delete(departamentoModel);
	}

	@Override
	public void refresh(final DepartamentoModel model) {
		departamentoJPA.refresh(model);
	}

}
