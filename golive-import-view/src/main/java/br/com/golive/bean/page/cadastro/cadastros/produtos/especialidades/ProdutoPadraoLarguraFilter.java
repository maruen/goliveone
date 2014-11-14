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
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.NumberFilter;
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
	private NumberFilter filtroId;

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
	private NumberFilter filtroLargura;

	@Inject
	@FilterInjected
	@Filter(name = "LarguraDescricao", label = "label.cadastroPadroesLargura.descricao")
	@EntityClass(classe = ProdutoPadraoLarguraModel.class)
	private StringFilter filtroLarguraDescricao;

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

	public NumberFilter getFiltroId() {
		return filtroId;
	}

	public void setFiltroId(NumberFilter filtroId) {
		this.filtroId = filtroId;
	}

	public DateFilter getFiltroDataInclusao() {
		return filtroDataInclusao;
	}

	public void setFiltroDataInclusao(DateFilter filtroDataInclusao) {
		this.filtroDataInclusao = filtroDataInclusao;
	}

	public DateFilter getFiltroDataAlteracao() {
		return filtroDataAlteracao;
	}

	public void setFiltroDataAlteracao(DateFilter filtroDataAlteracao) {
		this.filtroDataAlteracao = filtroDataAlteracao;
	}

	public NumberFilter getFiltroLargura() {
		return filtroLargura;
	}

	public void setFiltroLargura(NumberFilter filtroLargura) {
		this.filtroLargura = filtroLargura;
	}

	public StringFilter getFiltroLarguraDescricao() {
		return filtroLarguraDescricao;
	}

	public void setFiltroLarguraDescricao(StringFilter filtroLarguraDescricao) {
		this.filtroLarguraDescricao = filtroLarguraDescricao;
	}

	public NumberFilter getFiltroIdDepartamento() {
		return filtroIdDepartamento;
	}

	public void setFiltroIdDepartamento(NumberFilter filtroIdDepartamento) {
		this.filtroIdDepartamento = filtroIdDepartamento;
	}

	public DateFilter getFiltroDataInclusaoDepartamento() {
		return filtroDataInclusaoDepartamento;
	}

	public void setFiltroDataInclusaoDepartamento(
			DateFilter filtroDataInclusaoDepartamento) {
		this.filtroDataInclusaoDepartamento = filtroDataInclusaoDepartamento;
	}

	public DateFilter getFiltroDataAlteracaoDepartamento() {
		return filtroDataAlteracaoDepartamento;
	}

	public void setFiltroDataAlteracaoDepartamento(
			DateFilter filtroDataAlteracaoDepartamento) {
		this.filtroDataAlteracaoDepartamento = filtroDataAlteracaoDepartamento;
	}

	public StringFilter getFiltroDescricaoDepartamento() {
		return filtroDescricaoDepartamento;
	}

	public void setFiltroDescricaoDepartamento(
			StringFilter filtroDescricaoDepartamento) {
		this.filtroDescricaoDepartamento = filtroDescricaoDepartamento;
	}

	public NumberFilter getFiltroIdGrupoProduto() {
		return filtroIdGrupoProduto;
	}

	public void setFiltroIdGrupoProduto(NumberFilter filtroIdGrupoProduto) {
		this.filtroIdGrupoProduto = filtroIdGrupoProduto;
	}

	public DateFilter getFiltroDataInclusaoGrupoProduto() {
		return filtroDataInclusaoGrupoProduto;
	}

	public void setFiltroDataInclusaoGrupoProduto(
			DateFilter filtroDataInclusaoGrupoProduto) {
		this.filtroDataInclusaoGrupoProduto = filtroDataInclusaoGrupoProduto;
	}

	public DateFilter getFiltroDataAlteracaoGrupoProduto() {
		return filtroDataAlteracaoGrupoProduto;
	}

	public void setFiltroDataAlteracaoGrupoProduto(
			DateFilter filtroDataAlteracaoGrupoProduto) {
		this.filtroDataAlteracaoGrupoProduto = filtroDataAlteracaoGrupoProduto;
	}

	public StringFilter getFiltroDescricaoGrupoProduto() {
		return filtroDescricaoGrupoProduto;
	}

	public void setFiltroDescricaoGrupoProduto(
			StringFilter filtroDescricaoGrupoProduto) {
		this.filtroDescricaoGrupoProduto = filtroDescricaoGrupoProduto;
	}

	public NumberFilter getFiltroIdSubGrupoProduto() {
		return filtroIdSubGrupoProduto;
	}

	public void setFiltroIdSubGrupoProduto(NumberFilter filtroIdSubGrupoProduto) {
		this.filtroIdSubGrupoProduto = filtroIdSubGrupoProduto;
	}

	public DateFilter getFiltroDataInclusaoSubGrupoProduto() {
		return filtroDataInclusaoSubGrupoProduto;
	}

	public void setFiltroDataInclusaoSubGrupoProduto(
			DateFilter filtroDataInclusaoSubGrupoProduto) {
		this.filtroDataInclusaoSubGrupoProduto = filtroDataInclusaoSubGrupoProduto;
	}

	public DateFilter getFiltroDataAlteracaoSubGrupoProduto() {
		return filtroDataAlteracaoSubGrupoProduto;
	}

	public void setFiltroDataAlteracaoSubGrupoProduto(
			DateFilter filtroDataAlteracaoSubGrupoProduto) {
		this.filtroDataAlteracaoSubGrupoProduto = filtroDataAlteracaoSubGrupoProduto;
	}

	public StringFilter getFiltroDescricaoSubGrupoProduto() {
		return filtroDescricaoSubGrupoProduto;
	}

	public void setFiltroDescricaoSubGrupoProduto(
			StringFilter filtroDescricaoSubGrupoProduto) {
		this.filtroDescricaoSubGrupoProduto = filtroDescricaoSubGrupoProduto;
	}

	public NumberFilter getFiltroIdColecao() {
		return filtroIdColecao;
	}

	public void setFiltroIdColecao(NumberFilter filtroIdColecao) {
		this.filtroIdColecao = filtroIdColecao;
	}

	public DateFilter getFiltroDataInclusaoColecao() {
		return filtroDataInclusaoColecao;
	}

	public void setFiltroDataInclusaoColecao(DateFilter filtroDataInclusaoColecao) {
		this.filtroDataInclusaoColecao = filtroDataInclusaoColecao;
	}

	public DateFilter getFiltroDataAlteracaoColecao() {
		return filtroDataAlteracaoColecao;
	}

	public void setFiltroDataAlteracaoColecao(DateFilter filtroDataAlteracaoColecao) {
		this.filtroDataAlteracaoColecao = filtroDataAlteracaoColecao;
	}

	public StringFilter getFiltroDescricaoColecao() {
		return filtroDescricaoColecao;
	}

	public void setFiltroDescricaoColecao(StringFilter filtroDescricaoColecao) {
		this.filtroDescricaoColecao = filtroDescricaoColecao;
	}

	public NumberFilter getFiltroIdCor() {
		return filtroIdCor;
	}

	public void setFiltroIdCor(NumberFilter filtroIdCor) {
		this.filtroIdCor = filtroIdCor;
	}

	public DateFilter getFiltroDataInclusaoCor() {
		return filtroDataInclusaoCor;
	}

	public void setFiltroDataInclusaoCor(DateFilter filtroDataInclusaoCor) {
		this.filtroDataInclusaoCor = filtroDataInclusaoCor;
	}

	public DateFilter getFiltroDataAlteracaoCor() {
		return filtroDataAlteracaoCor;
	}

	public void setFiltroDataAlteracaoCor(DateFilter filtroDataAlteracaoCor) {
		this.filtroDataAlteracaoCor = filtroDataAlteracaoCor;
	}

	public StringFilter getFiltroDescricaoCor() {
		return filtroDescricaoCor;
	}

	public void setFiltroDescricaoCor(StringFilter filtroDescricaoCor) {
		this.filtroDescricaoCor = filtroDescricaoCor;
	}

	public StringFilter getFiltroCorCodigo() {
		return filtroCorCodigo;
	}

	public void setFiltroCorCodigo(StringFilter filtroCorCodigo) {
		this.filtroCorCodigo = filtroCorCodigo;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}
}