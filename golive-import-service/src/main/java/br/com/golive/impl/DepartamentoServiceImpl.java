package br.com.golive.impl;

import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Inject;

import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.departamento.repositorio.DepartamentoJpa;
import br.com.golive.service.DepartamentoService;

@Stateless
public class DepartamentoServiceImpl implements DepartamentoService {
	
	@Inject
	private DepartamentoJpa departamentoJpa;
	
	@Override
	public void salvar(DepartamentoModel departamentoModel) {
		departamentoJpa.salvar(departamentoModel);
	}
	
	@Override
	public List<DepartamentoModel> listar() {
		return departamentoJpa.findAll();
	}

}
