package br.com.golive.bean.page.cadastro.cadastros.produtos.especialidades;

import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.annotation.EntityClass;
import br.com.golive.annotation.Filter;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericFilterBean;
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

public class ProdutoPadraoLarguraFilter extends CadastroGenericFilterBean<ProdutoPadraoLarguraModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	private Logger logger;

	@Override
	protected Logger getLogger() {
		return logger;
	}

	@Inject
	@FilterInjected
	@Filter(label = "label.id", name = "id")
	@EntityClass(classe = ProdutoPadraoLarguraModel.class)
	private LongFilter filtroId;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao")
	@EntityClass(classe = ProdutoPadraoLarguraModel.class)
	private DateFilter filtroDataInclusao;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao")
	@EntityClass(classe = ProdutoPadraoLarguraModel.class)
	private DateFilter filtroDataAlteracao;

	@Inject
	@FilterInjected
	@Filter(name = "Largura", label = "label.cadastroPadroesLargura.largura")
	@EntityClass(classe = ProdutoPadraoLarguraModel.class)
	private DoubleFilter filtroLargura;

	@Inject
	@FilterInjected
	@Filter(name = "LarguraDescricao", label = "label.cadastroPadroesLargura.descricao")
	@EntityClass(classe = ProdutoPadraoLarguraModel.class)
	private StringFilter filtroLarguraDescricao;

	@Inject
	@FilterInjected
	@Filter(label = "label.id", name = "id", path = "departamentoSelected")
	@EntityClass(classe = DepartamentoModel.class)
	private LongFilter filtroIdDepartamento;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao", path = "departamentoSelected")
	@EntityClass(classe = DepartamentoModel.class)
	private DateFilter filtroDataInclusaoDepartamento;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao", path = "departamentoSelected")
	@EntityClass(classe = DepartamentoModel.class)
	private DateFilter filtroDataAlteracaoDepartamento;

	@Inject
	@FilterInjected
	@Filter(name = "DepartamentoProduto", label = "label.departamento", path = "departamentoSelected")
	@EntityClass(classe = DepartamentoModel.class)
	private StringFilter filtroDescricaoDepartamento;

	@Inject
	@FilterInjected
	@Filter(label = "label.id", name = "id", path = "grupoProdutoSelected")
	@EntityClass(classe = GrupoProdutosModel.class)
	private LongFilter filtroIdGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao", path = "grupoProdutoSelected")
	@EntityClass(classe = GrupoProdutosModel.class)
	private DateFilter filtroDataInclusaoGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao", path = "grupoProdutoSelected")
	@EntityClass(classe = GrupoProdutosModel.class)
	private DateFilter filtroDataAlteracaoGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "GrupoProduto", label = "label.gruposDeProdutos", path = "grupoProdutoSelected")
	@EntityClass(classe = GrupoProdutosModel.class)
	private StringFilter filtroDescricaoGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(label = "label.id", name = "id", path = "subGrupoProdutoSelected")
	@EntityClass(classe = SubGrupoProdutoModel.class)
	private LongFilter filtroIdSubGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao", path = "subGrupoProdutoSelected")
	@EntityClass(classe = SubGrupoProdutoModel.class)
	private DateFilter filtroDataInclusaoSubGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao", path = "subGrupoProdutoSelected")
	@EntityClass(classe = SubGrupoProdutoModel.class)
	private DateFilter filtroDataAlteracaoSubGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "SubGrupoProduto", label = "label.subgrupoDeProdutos", path = "subGrupoProdutoSelected")
	@EntityClass(classe = SubGrupoProdutoModel.class)
	private StringFilter filtroDescricaoSubGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(label = "label.id", name = "id", path = "colecaoSelected")
	@EntityClass(classe = ColecoesModel.class)
	private LongFilter filtroIdColecao;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao", path = "colecaoSelected")
	@EntityClass(classe = ColecoesModel.class)
	private DateFilter filtroDataInclusaoColecao;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao", path = "colecaoSelected")
	@EntityClass(classe = ColecoesModel.class)
	private DateFilter filtroDataAlteracaoColecao;

	@Inject
	@FilterInjected
	@Filter(name = "Colecao", label = "label.cadastroColecoes.colecao", path = "colecaoSelected")
	@EntityClass(classe = ColecoesModel.class)
	private StringFilter filtroDescricaoColecao;

	@Inject
	@FilterInjected
	@Filter(label = "label.id", name = "id", path = "corProdutoSelected")
	@EntityClass(classe = CorProdutoModel.class)
	private LongFilter filtroIdCor;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao", path = "corProdutoSelected")
	@EntityClass(classe = CorProdutoModel.class)
	private DateFilter filtroDataInclusaoCor;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao", path = "corProdutoSelected")
	@EntityClass(classe = CorProdutoModel.class)
	private DateFilter filtroDataAlteracaoCor;

	@Inject
	@FilterInjected
	@Filter(name = "CorDescricao", label = "label.cadastroCores.cor", path = "corProdutoSelected")
	@EntityClass(classe = CorProdutoModel.class)
	private StringFilter filtroDescricaoCor;

	@Inject
	@FilterInjected
	@Filter(name = "CorCodigo", label = "label.cadastroColecoes.codColecao", path = "corProdutoSelected")
	@EntityClass(classe = CorProdutoModel.class)
	private StringFilter filtroCorCodigo;
	
	@Inject
	@FilterInjected
	@Filter(label = "label.id", name = "id", path = "unidadeSelected")
	@EntityClass(classe = UnidadeModel.class)
	private LongFilter filtroIdUnidade;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao", path = "unidadeSelected")
	@EntityClass(classe = UnidadeModel.class)
	private DateFilter filtroDataInclusaoUnidade;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao", path = "unidadeSelected")
	@EntityClass(classe = UnidadeModel.class)
	private DateFilter filtroDataAlteracaoUnidade;

	@Inject
	@FilterInjected
	@Filter(name = "Unidade", label = "label.cadastroPadroesLargura.descricao", path = "unidadeSelected")
	@EntityClass(classe = UnidadeModel.class)
	private StringFilter filtroDescricaoUnidade;

	@Inject
	@FilterInjected
	@Filter(name = "Abreviacao", label = "label.cadastroPadroesLargura.codUnid", path = "unidadeSelected")
	@EntityClass(classe = UnidadeModel.class)
	private StringFilter filtroAbreviacaoUnidade;


	public LongFilter getFiltroId() {
		return filtroId;
	}
}