package br.com.golive.service;

import java.util.List;
import java.util.Map;

import javax.ejb.Local;

import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.filter.GoliveFilter;
import br.com.golive.impl.DepartamentoServiceImpl;
import br.com.golive.navigation.component.LazyModel;
import br.com.golive.navigation.component.OrderByDynamicColumn;

@Local(DepartamentoServiceImpl.class)
public interface DepartamentoService extends Service<DepartamentoModel> {

	public LazyModel<DepartamentoModel> obterListaLazy(final int startIndex, final int pageSize, final Map<String, GoliveFilter> parameters, OrderByDynamicColumn order);

	public int getCount();

}
