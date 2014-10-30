package br.com.golive.bean.page.cadastro.cadastros.produtos.classificacao;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.imageio.ImageIO;
import javax.inject.Inject;

import lombok.Data;

import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBean;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.NumberFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;
import br.com.golive.service.AuditoriaService;
import br.com.golive.service.DepartamentoService;
import br.com.golive.service.GrupoProdutoService;
import br.com.golive.utils.Fluxo;
import br.com.golive.utils.JSFUtils;
import br.com.golive.utils.javascript.FuncaoJavaScript;

@ManagedBean
@ViewScoped
@Label(name = "label.cadastroGrupoProdutos")
@Data
public class GrupoProdutosBean extends CadastroGenericBean<GrupoProdutosModel> {

	private static final long serialVersionUID = 7638327964310698925L;

	@Inject
	private Logger logger;

	@Inject
	@FilterInjected
	@Filter(name = "id", label = "label.id")
	private NumberFilter filtroIdGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "id", label = "label.id", path = "departamentoModel")
	private NumberFilter filtroIdDepartamento;

	@Inject
	@FilterInjected
	@Filter(name = "GrupoProduto", label = "label.gruposDeProdutos")
	private StringFilter filtroGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao")
	private DateFilter filtroDataInclusaoGrupoProduto;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao")
	private DateFilter filtroDataAletracaoGrupoProduto;
	
	@Inject
	@FilterInjected
	@Filter(name = "DepartamentoProduto", label = "label.departamentos", path = "departamentoModel")
	private StringFilter filtroDepartamento;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao", path = "departamentoModel")
	private DateFilter filtroDataInclusaoDepartamento;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao", path = "departamentoModel")
	private DateFilter filtroDataAletracaoDepartamento;

	@EJB
	private DepartamentoService departamentoService;

	@EJB
	private GrupoProdutoService grupoProdutoService;
	
	@EJB
	private AuditoriaService auditoriaService;

	private List<DepartamentoModel> departamentos;

	@Override
	@PostConstruct
	public void init() {
		if (usuario != null) {
			logger.info("Inicializando = {}", this.getClass().getName());
			super.init(grupoProdutoService.obterGrupoProdutos(), colunaPerfilService.obterListaDeConfiguracoesPagina(usuario, DepartamentoModel.class, GrupoProdutosModel.class));
			fluxo = getFluxoListagem();
			JSFUtils.chamarJs(new FuncaoJavaScript("getWidthTable"));
		}
	}

	@Override
	public void editarRegistro() {
		super.editarRegistro();
		if (registro != null) {
			registro.setAuditoriaLogs(auditoriaService.getAuditoriaLogs(registro));
			departamentos = departamentoService.listarTodos();
		}
	}

	@Override
	public void confirmarExclusao() {
		if ((fluxo.equals(Fluxo.EXCLUSAO)) && (registro != null)) {
			grupoProdutoService.delete(registro);
			JSFUtils.infoMessage(getLabels().getField("title.msg.inserido.sucesso"), getLabels().getField("msg.registro.excluido"));
			super.init(grupoProdutoService.obterGrupoProdutos(), colunaPerfilService.obterListaDeConfiguracoesPagina(usuario, DepartamentoModel.class, GrupoProdutosModel.class));
		}
	}
	
	@Override
	public void incluir() {
		super.incluir();
		registro = new GrupoProdutosModel();
		departamentos = departamentoService.listarTodos();
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
		logger.info("Salvando = {} ", registro);

		boolean success = false;

		if (registro != null) {
			
			if(registro.getDepartamentoModel() != null){
				if (registro.getId() == null) {
					if (validarInclusao()) {
						grupoProdutoService.salvar(registro);
						JSFUtils.infoMessage(usuario.getLabels().getField("title.msg.inserido.sucesso"), usuario.getLabels().getField("msg.inserido.sucesso"));
						success = true;
					} else {
						JSFUtils.warnMessage(usuario.getLabels().getField("title.msg.erro.ao.inserir"), usuario.getLabels().getField("msg.preencher.registro"));
					}
				} else {
					registro.setAuditoriaLogs(null);
					grupoProdutoService.update(registro);
					JSFUtils.infoMessage(usuario.getLabels().getField("title.msg.inserido.sucesso"), usuario.getLabels().getField("msg.atualizado.sucesso"));
					success = true;
				}
			} else {
				if((departamentos == null) || (departamentos.isEmpty())){
					departamentoInexistente();
				} else {
					JSFUtils.errorMessage(usuario.getLabels().getField("title.msg.aviso"), usuario.getLabels().getField("msg.preencher.registro"));
				}
				showMenuBar();
			}
		}
		if (success) {
			super.salvar();
			super.init(grupoProdutoService.obterGrupoProdutos(), colunaPerfilService.obterListaDeConfiguracoesPagina(usuario, DepartamentoModel.class, GrupoProdutosModel.class));
		}

	}

	private void departamentoInexistente() {
		JSFUtils.errorMessage(usuario.getLabels().getField("title.msg.aviso"), usuario.getLabels().getField("msg.departamento.nao.existe"));
	}

	private boolean validarInclusao() {
		final String desc = registro.getGrupoDeProduto();
		if ((desc != null) && (!desc.isEmpty())) {
			if (registro.getDepartamentoModel().getId() != null) {
				return true;
			}
		}
		return false;
	}


}