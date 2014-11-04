package br.com.golive.service;

import java.util.List;

import javax.ejb.Local;

import br.com.golive.entity.auditoria.model.AuditoriaModel;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.impl.DepartamentoServiceImpl;

@Local(DepartamentoServiceImpl.class)
public interface DepartamentoService {

	public void salvar(final DepartamentoModel departamentoModel);

	public void alterar(final DepartamentoModel departamentoModel);

	public List<DepartamentoModel> listarTodos();

	public List<DepartamentoModel> listarPorFiltro(final String... args);

	public void excluir(final DepartamentoModel departamentoModel);

	public List<AuditoriaModel> getAuditoriaLogs(final DepartamentoModel departamentoModel);

	public String getUsuarioLog(final DepartamentoModel departamentoModel);
	
	public void refresh(DepartamentoModel model);

}
