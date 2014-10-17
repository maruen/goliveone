package br.com.golive.service;

import java.util.List;

import br.com.golive.entity.auditoria.model.AuditoriaModel;
import br.com.golive.entity.departamento.model.DepartamentoModel;


public interface DepartamentoService {

	public void salvar(DepartamentoModel departamentoModel);
	public void alterar(DepartamentoModel departamentoModel);
	public List<DepartamentoModel> listarTodos();
	public List<DepartamentoModel> listarPorFiltro(String... args);
	public void excluir(DepartamentoModel departamentoModel);
	public List<AuditoriaModel> getAuditoriaLogs();
	
}
