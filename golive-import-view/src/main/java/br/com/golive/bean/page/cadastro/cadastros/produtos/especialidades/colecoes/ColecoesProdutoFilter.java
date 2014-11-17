package br.com.golive.bean.page.cadastro.cadastros.produtos.especialidades.colecoes;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.annotation.EntityClass;
import br.com.golive.annotation.Filter;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericFilterBean;
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
public class ColecoesProdutoFilter extends CadastroGenericFilterBean<ColecoesModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	private Logger logger;

	@Inject
	@FilterInjected
	@Filter(name = "id", label = "label.id")
	@EntityClass(classe = ColecoesModel.class)
	private LongFilter filtroIdColecoes;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao")
	@EntityClass(classe = ColecoesModel.class)
	private DateFilter filtroDataInclusaoColecao;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao")
	@EntityClass(classe = ColecoesModel.class)
	private DateFilter filtroDataAlteracaoColecao;

	@Inject
	@FilterInjected
	@Filter(name = "Colecao", label = "label.cadastroProdutos.colecao")
	@EntityClass(classe = ColecoesModel.class)
	private StringFilter filtroColecao;

	@Inject
	@FilterInjected
	@Filter(name = "id", label = "label.id", path = "departamentoSelected")
	@EntityClass(classe = DepartamentoModel.class)
	private LongFilter filtroIdDepartamento;

	@Inject
	@FilterInjected
	@Filter(name = "DepartamentoProduto", label = "label.departamentos", path = "departamentoSelected")
	@EntityClass(classe = DepartamentoModel.class)
	private StringFilter filtroDepartamento;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao", path = "departamentoSelected")
	@EntityClass(classe = DepartamentoModel.class)
	private DateFilter filtroDataInclusaoDepartamento;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao", path = "departamentoSelected")
	@EntityClass(classe = DepartamentoModel.class)
	private DateFilter filtroDataAletracaoDepartamento;

	@Inject
	@FilterInjected
	@Filter(name = "id", label = "label.id", path = "grupoProdutoSelected")
	@EntityClass(classe = GrupoProdutosModel.class)
	private LongFilter filtroIdGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "GrupoProduto", label = "label.gruposDeProdutos", path = "grupoProdutoSelected")
	@EntityClass(classe = GrupoProdutosModel.class)
	private StringFilter filtroGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao", path = "grupoProdutoSelected")
	@EntityClass(classe = GrupoProdutosModel.class)
	private DateFilter filtroDataInclusaoGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao", path = "grupoProdutoSelected")
	@EntityClass(classe = GrupoProdutosModel.class)
	private DateFilter filtroDataAletracaoGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "id", label = "label.id", path = "subGrupoProdutoSelected")
	@EntityClass(classe = SubGrupoProdutoModel.class)
	private LongFilter filtroIdSubGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "SubGrupoProduto", label = "label.gruposDeProdutos", path = "subGrupoProdutoSelected")
	@EntityClass(classe = SubGrupoProdutoModel.class)
	private StringFilter filtroSubGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao", path = "subGrupoProdutoSelected")
	@EntityClass(classe = SubGrupoProdutoModel.class)
	private DateFilter filtroDataInclusaoSubGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao", path = "subGrupoProdutoSelected")
	@EntityClass(classe = SubGrupoProdutoModel.class)
	private DateFilter filtroDataAletracaoSubGrupoProduto;

	@Override
	public Logger getLogger() {
		return logger;
	}

	public void setLogger(final Logger logger) {
		this.logger = logger;
	}

	public LongFilter getFiltroIdColecoes() {
		return filtroIdColecoes;
	}

	public void setFiltroIdColecoes(final LongFilter filtroIdColecoes) {
		this.filtroIdColecoes = filtroIdColecoes;
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

	public StringFilter getFiltroColecao() {
		return filtroColecao;
	}

	public void setFiltroColecao(final StringFilter filtroColecao) {
		this.filtroColecao = filtroColecao;
	}

	public LongFilter getFiltroIdDepartamento() {
		return filtroIdDepartamento;
	}

	public void setFiltroIdDepartamento(final LongFilter filtroIdDepartamento) {
		this.filtroIdDepartamento = filtroIdDepartamento;
	}

	public StringFilter getFiltroDepartamento() {
		return filtroDepartamento;
	}

	public void setFiltroDepartamento(final StringFilter filtroDepartamento) {
		this.filtroDepartamento = filtroDepartamento;
	}

	public DateFilter getFiltroDataInclusaoDepartamento() {
		return filtroDataInclusaoDepartamento;
	}

	public void setFiltroDataInclusaoDepartamento(final DateFilter filtroDataInclusaoDepartamento) {
		this.filtroDataInclusaoDepartamento = filtroDataInclusaoDepartamento;
	}

	public DateFilter getFiltroDataAletracaoDepartamento() {
		return filtroDataAletracaoDepartamento;
	}

	public void setFiltroDataAletracaoDepartamento(final DateFilter filtroDataAletracaoDepartamento) {
		this.filtroDataAletracaoDepartamento = filtroDataAletracaoDepartamento;
	}

	public LongFilter getFiltroIdGrupoProduto() {
		return filtroIdGrupoProduto;
	}

	public void setFiltroIdGrupoProduto(final LongFilter filtroIdGrupoProduto) {
		this.filtroIdGrupoProduto = filtroIdGrupoProduto;
	}

	public StringFilter getFiltroGrupoProduto() {
		return filtroGrupoProduto;
	}

	public void setFiltroGrupoProduto(final StringFilter filtroGrupoProduto) {
		this.filtroGrupoProduto = filtroGrupoProduto;
	}

	public DateFilter getFiltroDataInclusaoGrupoProduto() {
		return filtroDataInclusaoGrupoProduto;
	}

	public void setFiltroDataInclusaoGrupoProduto(final DateFilter filtroDataInclusaoGrupoProduto) {
		this.filtroDataInclusaoGrupoProduto = filtroDataInclusaoGrupoProduto;
	}

	public DateFilter getFiltroDataAletracaoGrupoProduto() {
		return filtroDataAletracaoGrupoProduto;
	}

	public void setFiltroDataAletracaoGrupoProduto(final DateFilter filtroDataAletracaoGrupoProduto) {
		this.filtroDataAletracaoGrupoProduto = filtroDataAletracaoGrupoProduto;
	}

	public LongFilter getFiltroIdSubGrupoProduto() {
		return filtroIdSubGrupoProduto;
	}

	public void setFiltroIdSubGrupoProduto(final LongFilter filtroIdSubGrupoProduto) {
		this.filtroIdSubGrupoProduto = filtroIdSubGrupoProduto;
	}

	public StringFilter getFiltroSubGrupoProduto() {
		return filtroSubGrupoProduto;
	}

	public void setFiltroSubGrupoProduto(final StringFilter filtroSubGrupoProduto) {
		this.filtroSubGrupoProduto = filtroSubGrupoProduto;
	}

	public DateFilter getFiltroDataInclusaoSubGrupoProduto() {
		return filtroDataInclusaoSubGrupoProduto;
	}

	public void setFiltroDataInclusaoSubGrupoProduto(final DateFilter filtroDataInclusaoSubGrupoProduto) {
		this.filtroDataInclusaoSubGrupoProduto = filtroDataInclusaoSubGrupoProduto;
	}

	public DateFilter getFiltroDataAletracaoSubGrupoProduto() {
		return filtroDataAletracaoSubGrupoProduto;
	}

	public void setFiltroDataAletracaoSubGrupoProduto(final DateFilter filtroDataAletracaoSubGrupoProduto) {
		this.filtroDataAletracaoSubGrupoProduto = filtroDataAletracaoSubGrupoProduto;
	}

}