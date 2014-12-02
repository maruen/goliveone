package br.com.golive.bean.page.cadastro.cadastros.produtos.classificacao.grupoproduto.filter;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;

import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.bean.generics.parent.GenericFilterBean;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.LongFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;

@ManagedBean
@ViewScoped
public class GrupoProdutoFilter extends GenericFilterBean<GrupoProdutosModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	@Getter
	private Logger logger;

	@Inject
	@FilterInjected
	@Filter(columnName = "id", fieldName = "id", entityClazz = GrupoProdutosModel.class, label = "label.id")
	private LongFilter filtroIdGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "GrupoProduto", label = "label.gruposDeProdutos", entityClazz = GrupoProdutosModel.class, fieldName = "grupoDeProduto")
	private StringFilter filtroGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemIncludeDateTime", fieldName = "dataInclusao", entityClazz = GrupoProdutosModel.class, label = "label.dataInclusao")
	private DateFilter filtroDataInclusaoGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemChangeDateTime", fieldName = "dataAlteracao", entityClazz = GrupoProdutosModel.class, label = "label.dataAlteracao")
	private DateFilter filtroDataAletracaoGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "id", fieldName = "id", entityClazz = DepartamentoModel.class, label = "label.id", path = "departamentoModel")
	private LongFilter filtroIdDepartamento;

	@Inject
	@FilterInjected
	@Filter(columnName = "DepartamentoProduto", label = "label.departamentos", path = "departamentoModel", entityClazz = DepartamentoModel.class, fieldName = "departamento")
	private StringFilter filtroDepartamento;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemIncludeDateTime", fieldName = "dataInclusao", entityClazz = DepartamentoModel.class, label = "label.dataInclusao", path = "departamentoModel")
	private DateFilter filtroDataInclusaoDepartamento;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemChangeDateTime", fieldName = "dataAlteracao", entityClazz = DepartamentoModel.class, label = "label.dataAlteracao", path = "departamentoModel")
	private DateFilter filtroDataAletracaoDepartamento;

}