package br.com.golive.bean.page.cadastro.cadastros.produtos.especialidades.colecoes;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;

import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.bean.generics.parent.GenericFilterBean;
import br.com.golive.entity.colecoes.model.ColecoesModel;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.LongFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;

@ManagedBean
@ViewScoped
public class ColecoesProdutoFilter extends GenericFilterBean<ColecoesModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	@Getter
	private Logger logger;

	@Inject
	@FilterInjected
	@Filter(columnName = "id", fieldName = "id", label = "label.id", entityClazz = ColecoesModel.class)
	private LongFilter filtroIdColecoes;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemIncludeDateTime", fieldName = "dataInclusao", label = "label.dataInclusao", entityClazz = ColecoesModel.class)
	private DateFilter filtroDataInclusaoColecao;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemChangeDateTime", fieldName = "dataAlteracao", label = "label.dataAlteracao", entityClazz = ColecoesModel.class)
	private DateFilter filtroDataAlteracaoColecao;

	@Inject
	@FilterInjected
	@Filter(columnName = "Colecao", fieldName = "colecao", label = "label.cadastroProdutos.colecao", entityClazz = ColecoesModel.class)
	private StringFilter filtroColecao;

	@Inject
	@FilterInjected
	@Filter(columnName = "id", fieldName = "id", label = "label.id", path = "departamentoSelected", entityClazz = DepartamentoModel.class)
	private LongFilter filtroIdDepartamento;

	@Inject
	@FilterInjected
	@Filter(columnName = "DepartamentoProduto", fieldName = "departamento", label = "label.departamentos", path = "departamentoSelected", entityClazz = DepartamentoModel.class)
	private StringFilter filtroDepartamento;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemIncludeDateTime", fieldName = "dataInclusao", label = "label.dataInclusao", path = "departamentoSelected", entityClazz = DepartamentoModel.class)
	private DateFilter filtroDataInclusaoDepartamento;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemChangeDateTime", fieldName = "dataAlteracao", label = "label.dataAlteracao", path = "departamentoSelected", entityClazz = DepartamentoModel.class)
	private DateFilter filtroDataAletracaoDepartamento;

	@Inject
	@FilterInjected
	@Filter(columnName = "id", fieldName = "id", label = "label.id", path = "grupoProdutoSelected", entityClazz = GrupoProdutosModel.class)
	private LongFilter filtroIdGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "GrupoProduto", fieldName = "grupoDeProduto", label = "label.gruposDeProdutos", path = "grupoProdutoSelected", entityClazz = GrupoProdutosModel.class)
	private StringFilter filtroGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemIncludeDateTime", fieldName = "dataInclusao", label = "label.dataInclusao", path = "grupoProdutoSelected", entityClazz = GrupoProdutosModel.class)
	private DateFilter filtroDataInclusaoGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemChangeDateTime", fieldName = "dataAlteracao", label = "label.dataAlteracao", path = "grupoProdutoSelected", entityClazz = GrupoProdutosModel.class)
	private DateFilter filtroDataAletracaoGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "id", fieldName = "id", label = "label.id", path = "subGrupoProdutoSelected", entityClazz = SubGrupoProdutoModel.class)
	private LongFilter filtroIdSubGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "SubGrupoProduto", fieldName = "subGrupoProduto", label = "label.gruposDeProdutos", path = "subGrupoProdutoSelected", entityClazz = SubGrupoProdutoModel.class)
	private StringFilter filtroSubGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemIncludeDateTime", fieldName = "dataInclusao", label = "label.dataInclusao", path = "subGrupoProdutoSelected", entityClazz = SubGrupoProdutoModel.class)
	private DateFilter filtroDataInclusaoSubGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemChangeDateTime", fieldName = "dataAlteracao", label = "label.dataAlteracao", path = "subGrupoProdutoSelected", entityClazz = SubGrupoProdutoModel.class)
	private DateFilter filtroDataAletracaoSubGrupoProduto;

}