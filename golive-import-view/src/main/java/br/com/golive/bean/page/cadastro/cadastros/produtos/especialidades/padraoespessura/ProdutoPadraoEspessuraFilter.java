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

	@Override
	protected Logger getLogger() {
		return logger;
	}

	public NumberFilter getFiltroId() {
		return filtroId;
	}

	public void setFiltroId(final NumberFilter filtroId) {
		this.filtroId = filtroId;
	}

	public DateFilter getFiltroDataInclusao() {
		return filtroDataInclusao;
	}

	public void setFiltroDataInclusao(final DateFilter filtroDataInclusao) {
		this.filtroDataInclusao = filtroDataInclusao;
	}

	public DateFilter getFiltroDataAlteracao() {
		return filtroDataAlteracao;
	}

	public void setFiltroDataAlteracao(final DateFilter filtroDataAlteracao) {
		this.filtroDataAlteracao = filtroDataAlteracao;
	}

	public NumberFilter getFiltroEspessura() {
		return filtroEspessura;
	}

	public void setFiltroEspessura(final NumberFilter filtroEspessura) {
		this.filtroEspessura = filtroEspessura;
	}

	public StringFilter getFiltroEspessuraDescricao() {
		return filtroEspessuraDescricao;
	}

	public void setFiltroEspessuraDescricao(final StringFilter filtroEspessuraDescricao) {
		this.filtroEspessuraDescricao = filtroEspessuraDescricao;
	}

	public NumberFilter getFiltroIdDepartamento() {
		return filtroIdDepartamento;
	}

	public void setFiltroIdDepartamento(final NumberFilter filtroIdDepartamento) {
		this.filtroIdDepartamento = filtroIdDepartamento;
	}

	public DateFilter getFiltroDataInclusaoDepartamento() {
		return filtroDataInclusaoDepartamento;
	}

	public void setFiltroDataInclusaoDepartamento(final DateFilter filtroDataInclusaoDepartamento) {
		this.filtroDataInclusaoDepartamento = filtroDataInclusaoDepartamento;
	}

	public DateFilter getFiltroDataAlteracaoDepartamento() {
		return filtroDataAlteracaoDepartamento;
	}

	public void setFiltroDataAlteracaoDepartamento(final DateFilter filtroDataAlteracaoDepartamento) {
		this.filtroDataAlteracaoDepartamento = filtroDataAlteracaoDepartamento;
	}

	public StringFilter getFiltroDescricaoDepartamento() {
		return filtroDescricaoDepartamento;
	}

	public void setFiltroDescricaoDepartamento(final StringFilter filtroDescricaoDepartamento) {
		this.filtroDescricaoDepartamento = filtroDescricaoDepartamento;
	}

	public NumberFilter getFiltroIdGrupoProduto() {
		return filtroIdGrupoProduto;
	}

	public void setFiltroIdGrupoProduto(final NumberFilter filtroIdGrupoProduto) {
		this.filtroIdGrupoProduto = filtroIdGrupoProduto;
	}

	public DateFilter getFiltroDataInclusaoGrupoProduto() {
		return filtroDataInclusaoGrupoProduto;
	}

	public void setFiltroDataInclusaoGrupoProduto(final DateFilter filtroDataInclusaoGrupoProduto) {
		this.filtroDataInclusaoGrupoProduto = filtroDataInclusaoGrupoProduto;
	}

	public DateFilter getFiltroDataAlteracaoGrupoProduto() {
		return filtroDataAlteracaoGrupoProduto;
	}

	public void setFiltroDataAlteracaoGrupoProduto(final DateFilter filtroDataAlteracaoGrupoProduto) {
		this.filtroDataAlteracaoGrupoProduto = filtroDataAlteracaoGrupoProduto;
	}

	public StringFilter getFiltroDescricaoGrupoProduto() {
		return filtroDescricaoGrupoProduto;
	}

	public void setFiltroDescricaoGrupoProduto(final StringFilter filtroDescricaoGrupoProduto) {
		this.filtroDescricaoGrupoProduto = filtroDescricaoGrupoProduto;
	}

	public NumberFilter getFiltroIdSubGrupoProduto() {
		return filtroIdSubGrupoProduto;
	}

	public void setFiltroIdSubGrupoProduto(final NumberFilter filtroIdSubGrupoProduto) {
		this.filtroIdSubGrupoProduto = filtroIdSubGrupoProduto;
	}

	public DateFilter getFiltroDataInclusaoSubGrupoProduto() {
		return filtroDataInclusaoSubGrupoProduto;
	}

	public void setFiltroDataInclusaoSubGrupoProduto(final DateFilter filtroDataInclusaoSubGrupoProduto) {
		this.filtroDataInclusaoSubGrupoProduto = filtroDataInclusaoSubGrupoProduto;
	}

	public DateFilter getFiltroDataAlteracaoSubGrupoProduto() {
		return filtroDataAlteracaoSubGrupoProduto;
	}

	public void setFiltroDataAlteracaoSubGrupoProduto(final DateFilter filtroDataAlteracaoSubGrupoProduto) {
		this.filtroDataAlteracaoSubGrupoProduto = filtroDataAlteracaoSubGrupoProduto;
	}

	public StringFilter getFiltroDescricaoSubGrupoProduto() {
		return filtroDescricaoSubGrupoProduto;
	}

	public void setFiltroDescricaoSubGrupoProduto(final StringFilter filtroDescricaoSubGrupoProduto) {
		this.filtroDescricaoSubGrupoProduto = filtroDescricaoSubGrupoProduto;
	}

	public NumberFilter getFiltroIdColecao() {
		return filtroIdColecao;
	}

	public void setFiltroIdColecao(final NumberFilter filtroIdColecao) {
		this.filtroIdColecao = filtroIdColecao;
	}

	public DateFilter getFiltroDataInclusaoColecao() {
		return filtroDataInclusaoColecao;
	}

	public void setFiltroDataInclusaoColecao(final DateFilter filtroDataInclusaoColecao) {
		this.filtroDataInclusaoColecao = filtroDataInclusaoColecao;
	}

	public DateFilter getFiltroDataAlteracaoColecao() {
		return filtroDataAlteracaoColecao;
	}

	public void setFiltroDataAlteracaoColecao(final DateFilter filtroDataAlteracaoColecao) {
		this.filtroDataAlteracaoColecao = filtroDataAlteracaoColecao;
	}

	public StringFilter getFiltroDescricaoColecao() {
		return filtroDescricaoColecao;
	}

	public void setFiltroDescricaoColecao(final StringFilter filtroDescricaoColecao) {
		this.filtroDescricaoColecao = filtroDescricaoColecao;
	}

	public NumberFilter getFiltroIdCor() {
		return filtroIdCor;
	}

	public void setFiltroIdCor(final NumberFilter filtroIdCor) {
		this.filtroIdCor = filtroIdCor;
	}

	public DateFilter getFiltroDataInclusaoCor() {
		return filtroDataInclusaoCor;
	}

	public void setFiltroDataInclusaoCor(final DateFilter filtroDataInclusaoCor) {
		this.filtroDataInclusaoCor = filtroDataInclusaoCor;
	}

	public DateFilter getFiltroDataAlteracaoCor() {
		return filtroDataAlteracaoCor;
	}

	public void setFiltroDataAlteracaoCor(final DateFilter filtroDataAlteracaoCor) {
		this.filtroDataAlteracaoCor = filtroDataAlteracaoCor;
	}

	public StringFilter getFiltroDescricaoCor() {
		return filtroDescricaoCor;
	}

	public void setFiltroDescricaoCor(final StringFilter filtroDescricaoCor) {
		this.filtroDescricaoCor = filtroDescricaoCor;
	}

	public void setLogger(final Logger logger) {
		this.logger = logger;
	}

	public StringFilter getFiltroCorCodigo() {
		return filtroCorCodigo;
	}

	public void setFiltroCorCodigo(final StringFilter filtroCorCodigo) {
		this.filtroCorCodigo = filtroCorCodigo;
	}

}
