package br.com.golive.bean.page.cadastro.cadastros.produtos.classificacao;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
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
import br.com.golive.service.DepartamentoService;
import br.com.golive.service.GrupoProdutoService;

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
	@Filter(name = "id", label = "label.id", path = "departamentoModel")
	private NumberFilter filtroIdDepartamento;

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

	private List<DepartamentoModel> departamentos;

	@Override
	@PostConstruct
	public void init() {
		super.init(grupoProdutoService.obterGrupoProdutos(), getConfiguracaoesByClasses(DepartamentoModel.class, GrupoProdutosModel.class));
	}

	@Override
	public void editarRegistro() {
		super.editarRegistro();
		if (registro != null) {
			obterDependencias();
		}
	}

	@Override
	public void incluir() {
		super.incluir();
		registro = new GrupoProdutosModel();
		obterDependencias();
	}

	private void obterDependencias() {
		departamentos = departamentoService.listarTodos();
	}

	@Override
	public boolean validarCampos() {
		boolean ret = true;
		if (registro == null) {
			ret= false;
		}
		if ((registro.getGrupoDeProduto() == null) || (registro.getGrupoDeProduto().isEmpty())) {
			ret= false;
		}
		if (registro.getDepartamentoModel() == null){
			ret= false;
		}
		if(!ret){
			preencherTodosCamposMessage();
		}
		
		return ret;
	}

	@Override
	public void serviceSave(GrupoProdutosModel registro) {
		grupoProdutoService.salvar(registro);
	}

	@Override
	public void serviceUpdate(GrupoProdutosModel registro) {
		grupoProdutoService.update(registro);
	}

	@Override
	public void serviceRemove(GrupoProdutosModel registro) {
		grupoProdutoService.delete(registro);
	}

}