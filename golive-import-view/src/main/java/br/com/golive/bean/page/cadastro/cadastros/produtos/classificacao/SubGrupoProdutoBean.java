package br.com.golive.bean.page.cadastro.cadastros.produtos.classificacao;

import static br.com.golive.utils.Fluxo.LISTAGEM;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroBeanRules;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBean;
import br.com.golive.entity.auditoria.model.AuditoriaModel;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.NumberFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.service.AuditoriaService;
import br.com.golive.service.DepartamentoService;
import br.com.golive.service.GrupoProdutoService;
import br.com.golive.service.SubGrupoProdutoService;
import br.com.golive.utils.GoliveOneProperties;
import br.com.golive.utils.JSFUtils;

@Data
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
	@EJB
	private AuditoriaService auditoriaService;

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
		preencherDependencias();
	}

	@Override
	public void editarRegistro() {
		super.editarRegistro();
		preencherDependencias();
		registro.setAuditoriaLogs(auditoriaService.getAuditoriaLogs(registro));
	}

	private void preencherDependencias() {
		departamentos = departamentoService.listarTodos();
		grupoProdutoList = grupoProdutoService.obterGrupoProdutos();
	}

	@Override
	public void confirmarExclusao() {
		try {
			subGrupoProdutoService.excluir(registro);
			removidoComSucesso();
		} catch (Exception e) {
			logger.error("Erro ao excluir registro ={} ", registro.getId());
			erroAoRemover();
		}
		super.init(subGrupoProdutoService.listarPorFiltro(), getConfiguracaoesByClasses(DepartamentoModel.class, GrupoProdutosModel.class, SubGrupoProdutoModel.class));
	}

	@Override
	public void salvar() {
		logger.info("Salvando = {} ", registro);
		boolean success = false;

		if (registro != null) {
			if (registro.getId() == null) {
				subGrupoProdutoService.salvar(registro);
				JSFUtils.infoMessage(usuario.getLabels().getField("title.msg.inserido.sucesso"), usuario.getLabels().getField("msg.inserido.sucesso"));
				success = true;
			} else {
				registro.setAuditoriaLogs(null);
				subGrupoProdutoService.alterar(registro);
				JSFUtils.infoMessage(usuario.getLabels().getField("title.msg.inserido.sucesso"), usuario.getLabels().getField("msg.atualizado.sucesso"));
				success = true;
			}
		} else {
			JSFUtils.errorMessage(usuario.getLabels().getField("title.msg.aviso"), usuario.getLabels().getField("msg.preencher.registro"));
			showMenuBar();
		}
		if (success) {
			super.salvar();
			super.init(subGrupoProdutoService.listarPorFiltro(), getConfiguracaoesByClasses(DepartamentoModel.class, GrupoProdutosModel.class, SubGrupoProdutoModel.class));
		}

	}

}