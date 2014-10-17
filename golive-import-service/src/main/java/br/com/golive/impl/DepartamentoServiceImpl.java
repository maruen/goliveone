package br.com.golive.impl;

import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;

import br.com.golive.entity.auditoria.model.AuditoriaModel;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.departamento.repositorio.DepartamentoJPA;
import br.com.golive.service.DepartamentoService;

@Stateless
public class DepartamentoServiceImpl implements DepartamentoService {
	
	@Inject
	private DepartamentoJPA departamentoJPA;
	
	@Override
	public void salvar(DepartamentoModel departamentoModel) {
		departamentoJPA.save(departamentoModel);
	}

	@Override
	public void alterar(DepartamentoModel departamentoModel) {
		 departamentoJPA.update(departamentoModel);
	}
	
	@Override
	public List<DepartamentoModel> listarTodos() {
		return departamentoJPA.findAll();
	}
	
	
	@Override
	public List<DepartamentoModel> listarPorFiltro(String... args) {
		return departamentoJPA.findByFilter(args);
	}

	@Override
	public void excluir(DepartamentoModel departamentoModel) {
		departamentoJPA.delete(departamentoModel);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AuditoriaModel> getAuditoriaLogs() {
		return departamentoJPA.getAuditoriaLogs(DepartamentoModel.class);
		
	}

}
