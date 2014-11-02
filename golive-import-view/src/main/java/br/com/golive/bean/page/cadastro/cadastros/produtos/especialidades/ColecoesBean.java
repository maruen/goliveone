package br.com.golive.bean.page.cadastro.cadastros.produtos.especialidades;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.ejb.EJBTransactionRolledbackException;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.imageio.ImageIO;
import javax.inject.Inject;

import lombok.Data;

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
import br.com.golive.service.AuditoriaService;
import br.com.golive.service.ColecoesService;
import br.com.golive.service.DepartamentoService;
import br.com.golive.service.GrupoProdutoService;
import br.com.golive.service.SubGrupoProdutoService;
import br.com.golive.utils.JSFUtils;

@Data
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

	@EJB
	private AuditoriaService auditoriaService;

	@Override
	@PostConstruct
	public void init() {
		super.init(colecoesService.obterLista("grupoProdutoSelected", "departamentoSelected", "subGrupoProdutoSelected"), getConfiguracaoesByClasses(DepartamentoModel.class, GrupoProdutosModel.class, SubGrupoProdutoModel.class, ColecoesModel.class));
	}

	@Override
	public void incluir() {
		super.incluir();
		registro = new ColecoesModel();
		carregarDependencias();
	}

	private void carregarDependencias() {
		departamentos = departamentoService.listarTodos();
		grupos = grupoProdutoService.obterGrupoProdutos();
		subGrupos = subGrupoProdutoService.listarTodos();
	}

	@Override
	public Map<String, Object> obterParametrosRelatório() {
		logger.info("Obtendo parametros para carregar relatório");
		final Map<String, Object> parametros = new HashMap<String, Object>();
		parametros.put("usuarioLogado", usuario.getLogin());
		parametros.put("label.usuario", usuario.getLabels().getField("label.usuario"));
		try {
			logger.info("Carregando logo da empresa");
			parametros.put("logo", ImageIO.read(Thread.currentThread().getContextClassLoader().getResourceAsStream(empresaSelecionada.getId() + ".png")));
		} catch (final IOException e) {
			logger.error("Erro ao carregar logo da empresa");
		}
		return parametros;
	}

	@Override
	public void editarRegistro() {
		super.editarRegistro();
		carregarDependencias();
		if(isSelecionado()){
			registro.setAuditoriaLogs(auditoriaService.getAuditoriaLogs(registro));
		}
	}

	@Override
	public void confirmarExclusao() {
		try {
			colecoesService.remover(registro);
			removidoComSucesso();
		} catch (Exception e) {
			logger.error("Erro ao excluir registro ={} ", registro.getId());
			erroAoRemover();
		}
		super.init(colecoesService.obterLista("grupoProdutoSelected", "departamentoSelected", "subGrupoProdutoSelected"), getConfiguracaoesByClasses(DepartamentoModel.class, GrupoProdutosModel.class, SubGrupoProdutoModel.class, ColecoesModel.class));
	}

	@Override
	public void salvar() {
		logger.info("Salvando = {} ", registro);

		boolean success = false;

		if (validarCampos(registro)) {
			if (registro.getId() == null) {
				try {
					colecoesService.salvar(registro);
					success = salvoMessagem();
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				try {
					colecoesService.update(registro);
					success = salvoMessagem();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		if (success) {
			super.init(colecoesService.obterLista("grupoProdutoSelected", "departamentoSelected", "subGrupoProdutoSelected"), getConfiguracaoesByClasses(DepartamentoModel.class, GrupoProdutosModel.class, SubGrupoProdutoModel.class, ColecoesModel.class));
		}
	}

	private boolean validarCampos(final ColecoesModel colecoesModel) {
		boolean ret = true;
		if (colecoesModel == null) {
			ret = false;
		}
		if (colecoesModel.getDepartamentoSelected() == null) {
			ret = false;
		}

		if (colecoesModel.getGrupoProdutoSelected() == null) {
			ret = false;
		}

		if (colecoesModel.getSubGrupoProdutoSelected() == null) {
			ret = false;
		}
		if (colecoesModel.getColecao() == null) {
			ret = false;
		}
		if (!ret) {
			preencherTodosCamposMessage();
		}

		return ret;
	}

	@Override
	public void cancelar() {
		super.cancelar();
		if (registro == null) {
			logger.info("Cancelando inclusao de registro");
		} else {
			logger.info("Cancelando edicao do registro = {} ", registro);
		}
	}

	@Override
	protected Logger getLogger() {
		return logger;
	}

}