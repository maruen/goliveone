package br.com.golive.impl;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.interceptor.Interceptors;

import br.com.golive.annotation.CrudOperation;
import br.com.golive.constants.Operation;
import br.com.golive.entity.auditoria.model.AuditoriaModel;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.departamento.repositorio.DepartamentoJPA;
import br.com.golive.interceptor.LogAuditoriaInterceptor;
import br.com.golive.service.DepartamentoService;

@Stateless
public class DepartamentoServiceImpl implements DepartamentoService {

	@Inject
	private DepartamentoJPA departamentoJPA;

	@Override
	@CrudOperation(type = Operation.INSERT)
	@Interceptors(LogAuditoriaInterceptor.class)
	public void salvar(final DepartamentoModel departamentoModel) {
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
	public List<AuditoriaModel> getAuditoriaLogs() {
		// return departamentoJPA.getAuditoriaLogs(DepartamentoModel.class);
		return new ArrayList<AuditoriaModel>();
	}

}
