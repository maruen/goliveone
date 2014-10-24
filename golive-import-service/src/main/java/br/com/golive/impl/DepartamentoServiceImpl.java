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
import br.com.golive.entity.auditoria.model.AuditoriaModel;
import br.com.golive.entity.auditoria.repositorio.AuditoriaJPA;
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

	@Inject
	private AuditoriaJPA auditoriaJPA;

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
	public void alterar(final DepartamentoModel departamentoModel) {
		departamentoJPA.update(departamentoModel);
	}

	@Override
	public List<DepartamentoModel> listarTodos() {
		return departamentoJPA.findAll();
	}

	@Override
	public List<DepartamentoModel> listarPorFiltro(final String... args) {
		return departamentoJPA.findByFilter(args);
	}

	@Override
	@CrudOperation(type = Operation.DELETE)
	@Interceptors(LogAuditoriaInterceptor.class)
	public void excluir(final DepartamentoModel departamentoModel) {
		departamentoJPA.delete(departamentoModel);
	}

	@SuppressWarnings("unchecked")
	@Override
	@TransactionAttribute(TransactionAttributeType.SUPPORTS)
	public List<AuditoriaModel> getAuditoriaLogs(final DepartamentoModel model) {
		return auditoriaJPA.getAuditoriaLogs(model.getClass());
	}

}
