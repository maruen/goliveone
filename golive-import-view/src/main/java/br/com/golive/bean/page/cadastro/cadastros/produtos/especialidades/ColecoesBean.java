package br.com.golive.bean.page.cadastro.cadastros.produtos.especialidades;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;
import lombok.Setter;

import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBean;
import br.com.golive.entity.colecoes.model.ColecoesModel;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.NumberFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;
import br.com.golive.service.ColecoesService;
import br.com.golive.service.DepartamentoService;
import br.com.golive.service.GrupoProdutoService;
import br.com.golive.service.SubGrupoProdutoService;

@ManagedBean
@ViewScoped
@Label(name = "label.cadastroColecoes")
public class ColecoesBean extends CadastroGenericBean<ColecoesModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	private Logger logger;

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

	@Inject
	@FilterInjected
	@Filter(name = "id", label = "label.id", path = "departamentoSelected")
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

	private List<DepartamentoModel> departamentos;

	private List<GrupoProdutosModel> grupos;

	private List<SubGrupoProdutoModel> subGrupos;
	
	@EJB
	private DepartamentoService departamentoService;

	@EJB
	private GrupoProdutoService grupoProdutoService;

	@EJB
	private SubGrupoProdutoService subGrupoProdutoService;

	@EJB
	private ColecoesService colecoesService;
	
	@Getter @Setter private boolean especificidades = false;
	

	@Override
	@PostConstruct
	public void init() {
		super.init(colecoesService.obterLista("grupoProdutoSelected", "departamentoSelected", "subGrupoProdutoSelected"), getConfiguracaoesByClasses(DepartamentoModel.class, GrupoProdutosModel.class, SubGrupoProdutoModel.class, ColecoesModel.class));
	}

	@Override
	public void incluir() {
		super.incluir();
		registro = new ColecoesModel();
	}

	@Override
	public boolean validarCampos() {
		boolean ret = true;
		if (registro == null) {
			ret = false;
		}

		if ((registro.getColecao() == null) || (registro.getColecao().isEmpty())) {
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
		if (!ret) {
			preencherTodosCamposMessage();
		}

		return ret;
	}


	@Override
	public void serviceSave(final ColecoesModel registro) {
		colecoesService.salvar(registro);
	}

	@Override
	public void serviceUpdate(final ColecoesModel registro) {
		colecoesService.update(registro);
	}

	@Override
	public void serviceRemove(final ColecoesModel registro) {
		colecoesService.remover(registro);
	}

	@Override
	public Logger getLogger() {
		return logger;
	}

	public void setLogger(final Logger logger) {
		this.logger = logger;
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

	public List<DepartamentoModel> getDepartamentos() {
		return departamentos;
	}

	public void setDepartamentos(final List<DepartamentoModel> departamentos) {
		this.departamentos = departamentos;
	}

	public List<GrupoProdutosModel> getGrupos() {
		return grupos;
	}

	public void setGrupos(final List<GrupoProdutosModel> grupos) {
		this.grupos = grupos;
	}

	public List<SubGrupoProdutoModel> getSubGrupos() {
		return subGrupos;
	}

	public void setSubGrupos(final List<SubGrupoProdutoModel> subGrupos) {
		this.subGrupos = subGrupos;
	}

	public DepartamentoService getDepartamentoService() {
		return departamentoService;
	}

	public void setDepartamentoService(final DepartamentoService departamentoService) {
		this.departamentoService = departamentoService;
	}

	public GrupoProdutoService getGrupoProdutoService() {
		return grupoProdutoService;
	}

	public void setGrupoProdutoService(final GrupoProdutoService grupoProdutoService) {
		this.grupoProdutoService = grupoProdutoService;
	}

	public SubGrupoProdutoService getSubGrupoProdutoService() {
		return subGrupoProdutoService;
	}

	public void setSubGrupoProdutoService(final SubGrupoProdutoService subGrupoProdutoService) {
		this.subGrupoProdutoService = subGrupoProdutoService;
	}

	public ColecoesService getColecoesService() {
		return colecoesService;
	}

	public void setColecoesService(final ColecoesService colecoesService) {
		this.colecoesService = colecoesService;
	}

	@Override
	public void serviceRefresh(final ColecoesModel model) {
		colecoesService.refresh(model);

	}

}