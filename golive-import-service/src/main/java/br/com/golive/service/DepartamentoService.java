package br.com.golive.service;

import java.util.List;

import br.com.golive.entity.departamento.model.DepartamentoModel;


public interface DepartamentoService {

	public void salvar(DepartamentoModel departamentoModel);
	public List<DepartamentoModel> listar();
}
