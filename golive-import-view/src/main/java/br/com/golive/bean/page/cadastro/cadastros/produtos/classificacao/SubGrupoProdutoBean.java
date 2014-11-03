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
		
		if(!ret ){
			preencherTodosCamposMessage();
		}
		return ret;
	}

	@Override
	public void serviceSave(SubGrupoProdutoModel registro) {
		subGrupoProdutoService.salvar(registro);
	}

	@Override
	public void serviceUpdate(SubGrupoProdutoModel registro) {
		subGrupoProdutoService.alterar(registro);
	}

	@Override
	public void serviceRemove(SubGrupoProdutoModel registro) {
		subGrupoProdutoService.excluir(registro);
	}

}