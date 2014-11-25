package br.com.golive.service;

import java.util.List;

import javax.ejb.Local;

import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.impl.DepartamentoServiceImpl;

@Local(DepartamentoServiceImpl.class)
public interface DepartamentoService extends Service<DepartamentoModel> {

	public List<DepartamentoModel> obterListaLazy(final Long lastId, final Long maxResult);

}
