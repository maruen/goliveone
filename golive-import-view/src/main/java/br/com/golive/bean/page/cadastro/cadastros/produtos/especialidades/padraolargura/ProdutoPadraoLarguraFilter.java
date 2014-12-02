package br.com.golive.bean.page.cadastro.cadastros.produtos.especialidades.padraolargura;

import javax.inject.Inject;

import lombok.Getter;

import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.bean.generics.parent.GenericFilterBean;
import br.com.golive.entity.colecoes.model.ColecoesModel;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.especialidades.model.CorProdutoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.entity.padraolargura.model.ProdutoPadraoLarguraModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.entity.unidade.model.UnidadeModel;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.DoubleFilter;
import br.com.golive.filter.LongFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;

public class ProdutoPadraoLarguraFilter extends GenericFilterBean<ProdutoPadraoLarguraModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	@Getter
	private Logger logger;

	@Inject
	@FilterInjected
	@Filter(label = "label.id", columnName = "id", fieldName = "id", entityClazz = ProdutoPadraoLarguraModel.class)
	private LongFilter filtroId;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemIncludeDateTime", label = "label.dataInclusao", fieldName = "dataInclusao", entityClazz = ProdutoPadraoLarguraModel.class)
	private DateFilter filtroDataInclusao;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemChangeDateTime", label = "label.dataAlteracao", fieldName = "dataAlteracao", entityClazz = ProdutoPadraoLarguraModel.class)
	private DateFilter filtroDataAlteracao;

	@Inject
	@FilterInjected
	@Filter(columnName = "Largura", label = "label.cadastroPadroesLargura.largura", fieldName = "largura", entityClazz = ProdutoPadraoLarguraModel.class)
	private DoubleFilter filtroLargura;

	@Inject
	@FilterInjected
	@Filter(columnName = "LarguraDescricao", label = "label.cadastroPadroesLargura.descricao", fieldName = "larguraDescricao", entityClazz = ProdutoPadraoLarguraModel.class)
	private StringFilter filtroLarguraDescricao;

	@Inject
	@FilterInjected
	@Filter(label = "label.id", columnName = "id", fieldName = "id", entityClazz = DepartamentoModel.class, path = "departamentoSelected")
	private LongFilter filtroIdDepartamento;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemIncludeDateTime", fieldName = "dataInclusao", entityClazz = DepartamentoModel.class, label = "label.dataInclusao", path = "departamentoSelected")
	private DateFilter filtroDataInclusaoDepartamento;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemChangeDateTime", fieldName = "dataAlteracao", entityClazz = DepartamentoModel.class, label = "label.dataAlteracao", path = "departamentoSelected")
	private DateFilter filtroDataAlteracaoDepartamento;

	@Inject
	@FilterInjected
	@Filter(columnName = "DepartamentoProduto", label = "label.departamento", path = "departamentoSelected", fieldName = "departamento", entityClazz = DepartamentoModel.class)
	private StringFilter filtroDescricaoDepartamento;

	@Inject
	@FilterInjected
	@Filter(label = "label.id", columnName = "id", fieldName = "id", entityClazz = GrupoProdutosModel.class, path = "grupoProdutoSelected")
	private LongFilter filtroIdGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemIncludeDateTime", fieldName = "dataInclusao", entityClazz = GrupoProdutosModel.class, label = "label.dataInclusao", path = "grupoProdutoSelected")
	private DateFilter filtroDataInclusaoGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemChangeDateTime", fieldName = "dataAlteracao", entityClazz = GrupoProdutosModel.class, label = "label.dataAlteracao", path = "grupoProdutoSelected")
	private DateFilter filtroDataAlteracaoGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "GrupoProduto", label = "label.gruposDeProdutos", path = "grupoProdutoSelected", fieldName = "gruposDeProdutos", entityClazz = GrupoProdutosModel.class)
	private StringFilter filtroDescricaoGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(label = "label.id", columnName = "id", fieldName = "id", entityClazz = SubGrupoProdutoModel.class, path = "subGrupoProdutoSelected")
	private LongFilter filtroIdSubGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemIncludeDateTime", fieldName = "dataInclusao", entityClazz = SubGrupoProdutoModel.class, label = "label.dataInclusao", path = "subGrupoProdutoSelected")
	private DateFilter filtroDataInclusaoSubGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemChangeDateTime", fieldName = "dataAlteracao", entityClazz = SubGrupoProdutoModel.class, label = "label.dataAlteracao", path = "subGrupoProdutoSelected")
	private DateFilter filtroDataAlteracaoSubGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(columnName = "SubGrupoProduto", label = "label.subgrupoDeProdutos", path = "subGrupoProdutoSelected", fieldName = "subGrupoProduto", entityClazz = SubGrupoProdutoModel.class)
	private StringFilter filtroDescricaoSubGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(label = "label.id", columnName = "id", fieldName = "id", entityClazz = ColecoesModel.class, path = "colecaoSelected")
	private LongFilter filtroIdColecao;

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
	@Filter(columnName = "Colecao", label = "label.cadastroColecoes.colecao", path = "colecaoSelected", fieldName = "colecao", entityClazz = ColecoesModel.class)
	private StringFilter filtroDescricaoColecao;

	@Inject
	@FilterInjected
	@Filter(label = "label.id", columnName = "id", fieldName = "id", entityClazz = CorProdutoModel.class, path = "corProdutoSelected")
	private LongFilter filtroIdCor;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemIncludeDateTime", fieldName = "dataInclusao", entityClazz = CorProdutoModel.class, label = "label.dataInclusao", path = "corProdutoSelected")
	private DateFilter filtroDataInclusaoCor;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemChangeDateTime", fieldName = "dataAlteracao", entityClazz = CorProdutoModel.class, label = "label.dataAlteracao", path = "corProdutoSelected")
	private DateFilter filtroDataAlteracaoCor;

	@Inject
	@FilterInjected
	@Filter(columnName = "CorDescricao", label = "label.cadastroCores.cor", path = "corProdutoSelected", fieldName = "corDescricao", entityClazz = CorProdutoModel.class)
	private StringFilter filtroDescricaoCor;

	@Inject
	@FilterInjected
	@Filter(columnName = "CorCodigo", label = "label.cadastroColecoes.codColecao", path = "corProdutoSelected", fieldName = "corCodigo", entityClazz = CorProdutoModel.class)
	private StringFilter filtroCorCodigo;

	@Inject
	@FilterInjected
	@Filter(label = "label.id", columnName = "id", fieldName = "id", entityClazz = UnidadeModel.class, path = "unidadeSelected")
	private LongFilter filtroIdUnidade;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemIncludeDateTime", fieldName = "dataInclusao", entityClazz = UnidadeModel.class, label = "label.dataInclusao", path = "unidadeSelected")
	private DateFilter filtroDataInclusaoUnidade;

	@Inject
	@FilterInjected
	@Filter(columnName = "SystemChangeDateTime", fieldName = "dataAlteracao", entityClazz = UnidadeModel.class, label = "label.dataAlteracao", path = "unidadeSelected")
	private DateFilter filtroDataAlteracaoUnidade;

	@Inject
	@FilterInjected
	@Filter(columnName = "Unidade", label = "label.cadastroPadroesEspessura.descricao", path = "unidadeSelected", fieldName = "unidade", entityClazz = UnidadeModel.class)
	private StringFilter filtroDescricaoUnidade;

	@Inject
	@FilterInjected
	@Filter(columnName = "Abreviacao", label = "label.cadastroPadroesEspessura.codUnid", path = "unidadeSelected", fieldName = "abreviacao", entityClazz = UnidadeModel.class)
	private StringFilter filtroAbreviacaoUnidade;
}