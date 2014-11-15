package br.com.golive.bean.page.cadastro.cadastros.produtos.especialidades.padraoespessura;

import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.annotation.EntityClass;
import br.com.golive.annotation.Filter;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericFilterBean;
import br.com.golive.entity.colecoes.model.ColecoesModel;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.especialidades.model.CorProdutoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.entity.padraoespessura.model.ProdutoPadraoEspessuraModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.entity.unidade.model.UnidadeModel;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.NumberFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;

public class ProdutoPadraoEspessuraFilter extends CadastroGenericFilterBean<ProdutoPadraoEspessuraModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	private Logger logger;

	@Inject
	@FilterInjected
	@Filter(label = "label.id", name = "id")
	@EntityClass(classe = ProdutoPadraoEspessuraModel.class)
	private NumberFilter filtroId;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao")
	@EntityClass(classe = ProdutoPadraoEspessuraModel.class)
	private DateFilter filtroDataInclusao;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao")
	@EntityClass(classe = ProdutoPadraoEspessuraModel.class)
	private DateFilter filtroDataAlteracao;

	@Inject
	@FilterInjected
	@Filter(name = "Espessura", label = "label.cadastroPadroesEspessura.espessura")
	@EntityClass(classe = ProdutoPadraoEspessuraModel.class)
	private NumberFilter filtroEspessura;

	@Inject
	@FilterInjected
	@Filter(name = "EspessuraDescricao", label = "label.cadastroPadroesEspessura.descricao")
	@EntityClass(classe = ProdutoPadraoEspessuraModel.class)
	private StringFilter filtroEspessuraDescricao;

	@Inject
	@FilterInjected
	@Filter(label = "label.id", name = "id", path = "departamentoSelected")
	@EntityClass(classe = DepartamentoModel.class)
	private NumberFilter filtroIdDepartamento;

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
	private NumberFilter filtroIdGrupoProduto;

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
	private NumberFilter filtroIdSubGrupoProduto;

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
	private NumberFilter filtroIdColecao;

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
	private NumberFilter filtroIdCor;

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
	private NumberFilter filtroIdUnidade;

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
	@Filter(name = "CorDescricao", label = "label.cadastroPadroesEspessura.descricao", path = "unidadeSelected")
	@EntityClass(classe = UnidadeModel.class)
	private StringFilter filtroDescricaoUnidade;

	@Inject
	@FilterInjected
	@Filter(name = "CorDescricao", label = "label.cadastroPadroesEspessura.codUnid", path = "unidadeSelected")
	@EntityClass(classe = UnidadeModel.class)
	private StringFilter filtroAbreviacaoUnidade;

	@Override
	protected Logger getLogger() {
		return logger;
	}

}
