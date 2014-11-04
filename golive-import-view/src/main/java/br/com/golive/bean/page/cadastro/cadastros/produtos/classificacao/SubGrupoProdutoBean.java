package br.com.golive.bean.page.cadastro.cadastros.produtos.classificacao;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBean;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.NumberFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.service.DepartamentoService;
import br.com.golive.service.GrupoProdutoService;
import br.com.golive.service.SubGrupoProdutoService;
import br.com.golive.utils.GoliveOneProperties;
import br.com.golive.utils.JSFUtils;

@ManagedBean
@ViewScoped
@Label(name = "label.cadastroSubGrupoProduto")
public class SubGrupoProdutoBean extends CadastroGenericBean<SubGrupoProdutoModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	private Logger logger;

	@Inject
	@LabelSystemInjected
	private GoliveOneProperties labels;

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
	@Filter(name = "id", label = "label.id")
	private NumberFilter filtroIdSubGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "SubGrupoProduto", label = "label.gruposDeProdutos")
	private StringFilter filtroSubGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao")
	private DateFilter filtroDataInclusaoSubGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao")
	private DateFilter filtroDataAletracaoSubGrupoProduto;

	@EJB
	private SubGrupoProdutoService subGrupoProdutoService;
	@EJB
	private DepartamentoService departamentoService;
	@EJB
	private GrupoProdutoService grupoProdutoService;

	private List<DepartamentoModel> departamentos;
	private List<GrupoProdutosModel> grupoProdutoList;

	@Override
	@PostConstruct
	public void init() {
		super.init(subGrupoProdutoService.listarPorFiltro(), getConfiguracaoesByClasses(DepartamentoModel.class, GrupoProdutosModel.class, SubGrupoProdutoModel.class));
	}

	@Override
	public void incluir() {
		super.incluir();
		registro = new SubGrupoProdutoModel();
		departamentos = departamentoService.listarTodos();
	}

	@Override
	public void editarRegistro() {
		super.editarRegistro();
		if (registro != null) {
			if (registro.getDepartamentoSelected() != null) {
				departamentos = departamentoService.listarTodos();
				carregarGrupoProdutoPorDepartamento();
			}
		}
	}

	@Override
	public boolean validarCampos() {
		boolean ret = true;
		if (registro == null) {
			ret = false;
		}
		if ((registro.getSubGrupoProduto() == null) || (registro.getSubGrupoProduto().isEmpty())) {
			ret = false;
		}
		if (registro.getDepartamentoSelected() == null) {
			ret = false;
		}
		if (registro.getGrupoProdutoSelected() == null) {
			ret = false;
		}

		if (!ret) {
			preencherTodosCamposMessage();
		}
		return ret;
	}

	public void carregarGrupoProdutoPorDepartamento() {
		grupoProdutoList = grupoProdutoService.obterGrupoProdutoDepartamentoPorDepartamento(registro.getDepartamentoSelected());
		if (grupoProdutoList.isEmpty()) {
			JSFUtils.warnMessage(usuario.getLabels().getField("title.msg.list.vazia"), usuario.getLabels().getField("msg.grupoProdutoDepartamento.vazio"));
		} else {
			boolean contem = false;
			for (final GrupoProdutosModel grupo : grupoProdutoList) {
				if (!contem) {
					if (grupo.getDepartamentoModel().getId().equals(registro.getDepartamentoSelected().getId())) {
						contem = true;
					}
				}
			}
			if (!contem) {
				registro.setGrupoProdutoSelected(new GrupoProdutosModel());
			}
		}
	}

	@Override
	public void serviceSave(final SubGrupoProdutoModel registro) {
		subGrupoProdutoService.salvar(registro);
	}

	@Override
	public void serviceUpdate(final SubGrupoProdutoModel registro) {
		subGrupoProdutoService.alterar(registro);
	}

	@Override
	public void serviceRemove(final SubGrupoProdutoModel registro) {
		subGrupoProdutoService.excluir(registro);
	}

	@Override
	public Logger getLogger() {
		return logger;
	}

	public void setLogger(final Logger logger) {
		this.logger = logger;
	}

	@Override
	public GoliveOneProperties getLabels() {
		return labels;
	}

	public void setLabels(final GoliveOneProperties labels) {
		this.labels = labels;
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

	public SubGrupoProdutoService getSubGrupoProdutoService() {
		return subGrupoProdutoService;
	}

	public void setSubGrupoProdutoService(final SubGrupoProdutoService subGrupoProdutoService) {
		this.subGrupoProdutoService = subGrupoProdutoService;
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

	public List<DepartamentoModel> getDepartamentos() {
		return departamentos;
	}

	public void setDepartamentos(final List<DepartamentoModel> departamentos) {
		this.departamentos = departamentos;
	}

	public List<GrupoProdutosModel> getGrupoProdutoList() {
		return grupoProdutoList;
	}

	public void setGrupoProdutoList(final List<GrupoProdutosModel> grupoProdutoList) {
		this.grupoProdutoList = grupoProdutoList;
	}

}