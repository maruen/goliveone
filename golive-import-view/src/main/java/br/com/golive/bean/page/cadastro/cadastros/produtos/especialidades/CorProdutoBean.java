package br.com.golive.bean.page.cadastro.cadastros.produtos.especialidades;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBean;
import br.com.golive.entity.colecoes.model.ColecoesModel;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.especialidades.model.CorProdutoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.NumberFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;
import br.com.golive.service.CorProdutoService;

@ManagedBean
@ViewScoped
@Label(name = "label.cadastroCores")
@Data
@EqualsAndHashCode(callSuper = false)
public class CorProdutoBean extends CadastroGenericBean<CorProdutoModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	private Logger logger;

	/**
	 * FILTROS COR
	 */

	@Inject
	@FilterInjected
	@Filter(name = "CorDescricao", label = "label.cadastroCores.cor")
	private StringFilter filtroCorDescricao;

	@Inject
	@FilterInjected
	@Filter(name = "CorCodigo", label = "label.cadastroCores.codCor")
	private NumberFilter filtroCorCod;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao")
	private DateFilter filtroDataInclusaoCorProduto;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao")
	private DateFilter filtroDataAlteracaoCorProduto;

	/**
	 * FILTROS DEPARTAMENTO
	 */

	@Inject
	@FilterInjected
	@Filter(name = "id", label = "label.id")
	private NumberFilter filtroIdDepartamento;

	@Inject
	@FilterInjected
	@Filter(name = "DepartamentoProduto", label = "label.departamentos", path = "departamentoSelected")
	private StringFilter filtroDepartamento;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao", path = "departamentoSelected")
	private DateFilter filtroDataInclusaoDepartamento;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao", path = "departamentoSelected")
	private DateFilter filtroDataAletracaoDepartamento;

	/**
	 * FILTROS COLECOES
	 */

	@Inject
	@FilterInjected
	@Filter(name = "id", label = "label.id")
	private NumberFilter filtroIdColecoes;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao")
	private DateFilter filtroDataInclusaoColecao;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao")
	private DateFilter filtroDataAlteracaoColecao;

	@Inject
	@FilterInjected
	@Filter(name = "Colecao", label = "label.cadastroProdutos.colecao")
	private StringFilter filtroColecao;

	/**
	 * FILTROS GRUPO PRODUTO
	 */

	@Inject
	@FilterInjected
	@Filter(name = "id", label = "label.id", path = "grupoProdutoSelected")
	private NumberFilter filtroIdGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "GrupoProduto", label = "label.gruposDeProdutos", path = "grupoProdutoSelected")
	private StringFilter filtroGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao", path = "grupoProdutoSelected")
	private DateFilter filtroDataInclusaoGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao", path = "grupoProdutoSelected")
	private DateFilter filtroDataAletracaoGrupoProduto;

	/**
	 * FILTROS SUBGRUPO PRODUTO
	 */

	@Inject
	@FilterInjected
	@Filter(name = "id", label = "label.id", path = "subGrupoProdutoSelected")
	private NumberFilter filtroIdSubGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "SubGrupoProduto", label = "label.gruposDeProdutos", path = "subGrupoProdutoSelected")
	private StringFilter filtroSubGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao", path = "subGrupoProdutoSelected")
	private DateFilter filtroDataInclusaoSubGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao", path = "subGrupoProdutoSelected")
	private DateFilter filtroDataAletracaoSubGrupoProduto;

	@EJB	private CorProdutoService corProdutoService;
	
	@Getter @Setter private boolean especificidades = true;
	

	@Override
	@PostConstruct
	public void init() {
		super.init(corProdutoService.listarPorFiltro(),
				getConfiguracaoesByClasses(CorProdutoModel.class, DepartamentoModel.class, SubGrupoProdutoModel.class, GrupoProdutosModel.class, ColecoesModel.class));
	}
	

	@Override
	public void incluir() {
		super.incluir();
		registro = new CorProdutoModel();
	}
	

	@Override
	public boolean validarCampos() {
		boolean ret = true;
		if (registro == null) {
			ret = false;
		}
		if (registro.getDepartamentoSelected() == null) {
			ret = false;
		}

		if (registro.getGrupoProdutoSelected() == null) {
			ret = false;
		}

		if (registro.getSubGrupoProdutoSelected() == null) {
			ret = false;
		}
		if (registro.getColecaoSelected() == null) {
			ret = false;
		}

		if ((registro.getCorDescricao() == null) || (registro.getCorDescricao().isEmpty())) {
			ret = false;
		}

		if ((registro.getCorCodigo() == null) || (registro.getCorCodigo().isEmpty())) {
			ret = false;
		}
		if (!ret) {
			preencherTodosCamposMessage();
		}

		return ret;
	}

	@Override
	public void serviceSave(final CorProdutoModel registro) {
		corProdutoService.salvar(registro);
	}

	@Override
	public void serviceUpdate(final CorProdutoModel registro) {
		corProdutoService.alterar(registro);
	}

	@Override
	public void serviceRemove(final CorProdutoModel registro) {
		corProdutoService.excluir(registro);
	}

	@Override
	public Logger getLogger() {
		return logger;
	}

	public void setLogger(final Logger logger) {
		this.logger = logger;
	}

	public StringFilter getFiltroCorDescricao() {
		return filtroCorDescricao;
	}

	public void setFiltroCorDescricao(final StringFilter filtroCorDescricao) {
		this.filtroCorDescricao = filtroCorDescricao;
	}

	public NumberFilter getFiltroCorCod() {
		return filtroCorCod;
	}

	public void setFiltroCorCod(final NumberFilter filtroCorCod) {
		this.filtroCorCod = filtroCorCod;
	}

	public DateFilter getFiltroDataInclusaoCorProduto() {
		return filtroDataInclusaoCorProduto;
	}

	public void setFiltroDataInclusaoCorProduto(final DateFilter filtroDataInclusaoCorProduto) {
		this.filtroDataInclusaoCorProduto = filtroDataInclusaoCorProduto;
	}

	public DateFilter getFiltroDataAlteracaoCorProduto() {
		return filtroDataAlteracaoCorProduto;
	}

	public void setFiltroDataAlteracaoCorProduto(final DateFilter filtroDataAlteracaoCorProduto) {
		this.filtroDataAlteracaoCorProduto = filtroDataAlteracaoCorProduto;
	}

	public NumberFilter getFiltroIdDepartamento() {
		return filtroIdDepartamento;
	}

	public void setFiltroIdDepartamento(final NumberFilter filtroIdDepartamento) {
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

	public NumberFilter getFiltroIdColecoes() {
		return filtroIdColecoes;
	}

	public void setFiltroIdColecoes(final NumberFilter filtroIdColecoes) {
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

	public NumberFilter getFiltroIdGrupoProduto() {
		return filtroIdGrupoProduto;
	}

	public void setFiltroIdGrupoProduto(final NumberFilter filtroIdGrupoProduto) {
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

	public NumberFilter getFiltroIdSubGrupoProduto() {
		return filtroIdSubGrupoProduto;
	}

	public void setFiltroIdSubGrupoProduto(final NumberFilter filtroIdSubGrupoProduto) {
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

	
	public CorProdutoService getCorProdutoService() {
		return corProdutoService;
	}

	public void setCorProdutoService(final CorProdutoService corProdutoService) {
		this.corProdutoService = corProdutoService;
	}


	@Override
	public void serviceRefresh(final CorProdutoModel model) {
		corProdutoService.refresh(model);

	}

}