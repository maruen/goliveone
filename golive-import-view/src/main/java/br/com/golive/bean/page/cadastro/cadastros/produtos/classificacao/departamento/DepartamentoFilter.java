package br.com.golive.bean.page.cadastro.cadastros.produtos.classificacao.departamento;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;

import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.bean.generics.parent.GenericFilterBean;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.LongFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;

@ManagedBean
@ViewScoped
public class DepartamentoFilter extends GenericFilterBean<DepartamentoModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	@Getter
	private Logger logger;

	@Inject
	@FilterInjected
	@Filter(columnName = "id", fieldName = "id", entityClazz = DepartamentoModel.class, label = "label.id")
	private LongFilter filtroIdDepartamento;

	@Inject
	@FilterInjected
	@Filter(columnName = "DepartamentoProduto", label = "label.departamentos", fieldName = "departamento", entityClazz = DepartamentoModel.class)
	private StringFilter filtroDepartamento;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemIncludeDateTime", fieldName = "dataInclusao", entityClazz = DepartamentoModel.class, label = "label.dataInclusao")
	private DateFilter filtroDataInclusaoDepartamento;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemChangeDateTime", fieldName = "dataAlteracao", entityClazz = DepartamentoModel.class, label = "label.dataAlteracao")
	private DateFilter filtroDataAletracaoDepartamento;

}