package br.com.golive.bean.page.cadastro.cadastros.produtos.classificacao;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.imageio.ImageIO;
import javax.inject.Inject;
import javax.persistence.Table;

import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBean;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.grupoprodutodepartamento.model.GrupoProdutoDepartamento;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.NumberFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;
import br.com.golive.service.DepartamentoService;
import br.com.golive.service.GrupoProdutoService;
import br.com.golive.utils.JSFUtils;

@ManagedBean
@ViewScoped
@Label(name = "label.cadastroGrupoProdutos")
public class GrupoProdutosBean extends CadastroGenericBean<GrupoProdutoDepartamento> {

	@Inject
	private Logger logger;

	@Inject
	@FilterInjected
	@Filter(name = "id", label = "label.id", path = "id.grupoProduto.id")
	private NumberFilter filtroIdGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "id", label = "label.id", path = "id.departamento.id")
	private NumberFilter filtroIdDepartamento;

	@Inject
	@FilterInjected
	@Filter(name = "DepartamentoProduto", label = "label.departamentos", path = "id.departamento.departamento")
	private StringFilter filtroDepartamento;

	@Inject
	@FilterInjected
	@Filter(name = "GrupoProduto", label = "label.gruposDeProdutos", path = "id.grupoProduto.grupoDeProduto")
	private StringFilter filtroGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao", path = "id.grupoProduto.dataInclusao")
	private DateFilter filtroDataInclusaoGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao", path = "id.grupoProduto.dataAlteracao")
	private DateFilter filtroDataAletracaoGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao", path = "id.departamento.dataInclusao")
	private DateFilter filtroDataInclusaoDepartamento;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao", path = "id.departamento.dataAlteracao")
	private DateFilter filtroDataAletracaoDepartamento;

	@EJB
	private DepartamentoService departamentoService;

	@EJB
	private GrupoProdutoService grupoProdutoService;

	private List<DepartamentoModel> departamentos;

	@Override
	@PostConstruct
	public void init() {
		if (usuario != null) {
			logger.info("Inicializando = {}", this.getClass().getName());
			super.init(grupoProdutoService.obterGrupoProdutoDepartamentos(), colunaPerfilService.obterListaDeConfiguracoesPagina(usuario, DepartamentoModel.class.getAnnotation(Table.class).name(), GrupoProdutosModel.class.getAnnotation(Table.class).name()));
			fluxo = getFluxoListagem();
		}
	}

	@Override
	public void incluir() {
		super.incluir();
		registro = new GrupoProdutoDepartamento();
	}

	@Override
	public Map<String, Object> obterParametrosRelatório() {
		logger.info("Obtendo parametros para carregar relatório");
		final Map<String, Object> parametros = new HashMap<String, Object>();
		parametros.put("usuarioLogado", usuario.getLogin());
		parametros.put("label.usuario", getUsuario().getLabels().getField("label.usuario"));
		try {
			logger.info("Carregando logo da empresa");
			parametros.put("logo", ImageIO.read(Thread.currentThread().getContextClassLoader().getResourceAsStream(empresaSelecionada.getId() + ".png")));
		} catch (final IOException e) {
			logger.error("Erro ao carregar logo da empresa");
		}
		return parametros;
	}

	@Override
	public void salvar() {
		super.salvar();
		logger.info("Salvando = {} ", registro);
		if (registro != null) {
			if (registro.getId().getGrupoProdutosModel().getId() == null) {
				if (validarInclusao()) {
					grupoProdutoService.salvar(registro.getId().getGrupoProdutosModel());
					grupoProdutoService.salvarGrupoProdutoDepartamento(registro);
				} else {
					JSFUtils.warnMessage("title.msg.erro.ao.inserir", "msg.preencher.registro");
				}
			} else {

			}
		}

	}

	private boolean validarInclusao() {
		final String desc = registro.getId().getGrupoProdutosModel().getGrupoDeProduto();
		if ((desc != null) && (!desc.isEmpty())) {
			if (registro.getId().getDepartamentoModel().getId() != null) {
				return true;
			}
		}
		return false;
	}

	@Override
	protected Logger getLogger() {
		return logger;
	}

	public NumberFilter getFiltroIdGrupoProduto() {
		return filtroIdGrupoProduto;
	}

	public void setFiltroIdGrupoProduto(final NumberFilter filtroIdGrupoProduto) {
		this.filtroIdGrupoProduto = filtroIdGrupoProduto;
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

	public List<DepartamentoModel> getDepartamentos() {
		if (departamentos == null) {
			departamentos = departamentoService.listarTodos();
		}

		return departamentos;
	}

	public void setDepartamentos(final List<DepartamentoModel> departamentos) {
		this.departamentos = departamentos;
	}

}