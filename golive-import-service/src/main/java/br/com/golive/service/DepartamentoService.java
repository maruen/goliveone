package br.com.golive.service;

import java.util.List;
import java.util.Map;

import javax.ejb.Local;

import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.filter.GoliveFilter;
import br.com.golive.impl.DepartamentoServiceImpl;

@Local(DepartamentoServiceImpl.class)
public interface DepartamentoService extends Service<DepartamentoModel> {

	public List<DepartamentoModel> obterListaLazy(final int startIndex, final int pageSize, final Map<String, GoliveFilter> parameters);

	public int getCount();

}
