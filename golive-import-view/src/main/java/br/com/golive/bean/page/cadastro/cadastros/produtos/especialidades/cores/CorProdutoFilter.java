package br.com.golive.bean.page.cadastro.cadastros.produtos.especialidades.cores;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;

import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.bean.generics.parent.GenericFilterBean;
import br.com.golive.entity.colecoes.model.ColecoesModel;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.especialidades.model.CorProdutoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.LongFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;

@ManagedBean
@ViewScoped
public class CorProdutoFilter extends GenericFilterBean<CorProdutoModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	@Getter
	private Logger logger;

	@Inject
	@FilterInjected
	@Filter(columnName = "id", fieldName = "id", entityClazz = CorProdutoModel.class, label = "label.id")
	private LongFilter filtroIdCor;

	@Inject
	@FilterInjected
	@Filter(columnName = "CorDescricao", label = "label.cadastroCores.cor", fieldName = "corDescricao", entityClazz = CorProdutoModel.class)
	private StringFilter filtroCorDescricao;

	@Inject
	@FilterInjected
	@Filter(columnName = "CorCodigo", label = "label.cadastroCores.codCor", fieldName = "corCodigo", entityClazz = CorProdutoModel.class)
	private LongFilter filtroCorCod;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemIncludeDateTime", fieldName = "dataInclusao", entityClazz = CorProdutoModel.class, label = "label.dataInclusao")
	private DateFilter filtroDataInclusaoCorProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemChangeDateTime", fieldName = "dataAlteracao", entityClazz = CorProdutoModel.class, label = "label.dataAlteracao")
	private DateFilter filtroDataAlteracaoCorProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "id", fieldName = "id", entityClazz = DepartamentoModel.class, label = "label.id", path = "departamentoSelected")
	private LongFilter filtroIdDepartamento;

	@Inject
	@FilterInjected
	@Filter(columnName = "DepartamentoProduto", label = "label.departamentos", path = "departamentoSelected", entityClazz = DepartamentoModel.class, fieldName = "departamento")
	private StringFilter filtroDepartamento;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemIncludeDateTime", fieldName = "dataInclusao", entityClazz = DepartamentoModel.class, label = "label.dataInclusao", path = "departamentoSelected")
	private DateFilter filtroDataInclusaoDepartamento;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemChangeDateTime", fieldName = "dataAlteracao", entityClazz = DepartamentoModel.class, label = "label.dataAlteracao", path = "departamentoSelected")
	private DateFilter filtroDataAletracaoDepartamento;

	@Inject
	@FilterInjected
	@Filter(columnName = "id", fieldName = "id", entityClazz = ColecoesModel.class, label = "label.id", path = "colecaoSelected")
	private LongFilter filtroIdColecoes;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemIncludeDateTime", fieldName = "dataInclusao", entityClazz = ColecoesModel.class, label = "label.dataInclusao", path = "colecaoSelected")
	private DateFilter filtroDataInclusaoColecao;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemChangeDateTime", fieldName = "dataAlteracao", entityClazz = ColecoesModel.class, label = "label.dataAlteracao", path = "colecaoSelected")
	private DateFilter filtroDataAlteracaoColecao;

	@Inject
	@FilterInjected
	@Filter(columnName = "Colecao", label = "label.cadastroProdutos.colecao", path = "colecaoSelected", entityClazz = ColecoesModel.class, fieldName = "colecao")
	private StringFilter filtroColecao;

	@Inject
	@FilterInjected
	@Filter(columnName = "id", fieldName = "id", entityClazz = GrupoProdutosModel.class, label = "label.id", path = "grupoProdutoSelected")
	private LongFilter filtroIdGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "GrupoProduto", label = "label.gruposDeProdutos", path = "grupoProdutoSelected", fieldName = "grupoDeProduto", entityClazz = GrupoProdutosModel.class)
	private StringFilter filtroGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemIncludeDateTime", fieldName = "dataInclusao", entityClazz = GrupoProdutosModel.class, label = "label.dataInclusao", path = "grupoProdutoSelected")
	private DateFilter filtroDataInclusaoGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemChangeDateTime", fieldName = "dataAlteracao", entityClazz = GrupoProdutosModel.class, label = "label.dataAlteracao", path = "grupoProdutoSelected")
	private DateFilter filtroDataAletracaoGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "id", fieldName = "id", entityClazz = SubGrupoProdutoModel.class, label = "label.id", path = "subGrupoProdutoSelected")
	private LongFilter filtroIdSubGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "SubGrupoProduto", label = "label.gruposDeProdutos", path = "subGrupoProdutoSelected", fieldName = "subGrupoProduto", entityClazz = SubGrupoProdutoModel.class)
	private StringFilter filtroSubGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemIncludeDateTime", fieldName = "dataInclusao", entityClazz = SubGrupoProdutoModel.class, label = "label.dataInclusao", path = "subGrupoProdutoSelected")
	private DateFilter filtroDataInclusaoSubGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemChangeDateTime", fieldName = "dataAlteracao", entityClazz = SubGrupoProdutoModel.class, label = "label.dataAlteracao", path = "subGrupoProdutoSelected")
	private DateFilter filtroDataAletracaoSubGrupoProduto;

}