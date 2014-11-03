package br.com.golive.bean.page.cadastro.cadastros.produtos.classificacao;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Data;
import lombok.EqualsAndHashCode;

import org.slf4j.Logger;

import br.com.golive.annotation.Filter;
import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBean;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.filter.DateFilter;
import br.com.golive.filter.NumberFilter;
import br.com.golive.filter.StringFilter;
import br.com.golive.qualifier.FilterInjected;
import br.com.golive.service.DepartamentoService;

@Data
@EqualsAndHashCode(callSuper = false)
@ManagedBean
@ViewScoped
@Label(name = "label.cadastroDepartamento")
public class DepartamentoBean extends CadastroGenericBean<DepartamentoModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	private Logger logger;

	@Inject
	@FilterInjected
	@Filter(name = "id", label = "label.id")
	private NumberFilter filtroIdDepartamento;

	@Inject
	@FilterInjected
	@Filter(name = "DepartamentoProduto", label = "label.departamentos")
	private StringFilter filtroDepartamento;

	@Inject
	@FilterInjected
	@Filter(name = "SystemIncludeDateTime", label = "label.dataInclusao")
	private DateFilter filtroDataInclusaoDepartamento;

	@Inject
	@FilterInjected
	@Filter(name = "SystemChangeDateTime", label = "label.dataAlteracao")
	private DateFilter filtroDataAletracaoDepartamento;

	@EJB
	private DepartamentoService departamentoService;

	@Override
	@PostConstruct
	public void init() {
		super.init(departamentoService.listarPorFiltro(), getConfiguracaoesByClasses(DepartamentoModel.class));
	}

	@Override
	public void incluir() {
		super.incluir();
		registro = new DepartamentoModel();
	}

	@Override
	public boolean validarCampos() {
		boolean ret = true;
		
		if (registro == null) {
			ret =  false;
		}
		if ((registro.getDepartamento() == null) || (registro.getDepartamento().isEmpty())) {
			ret =  false;
		}
		
		if(!ret){
			preencherTodosCamposMessage();
		}
		return true;
	}

	@Override
	public void serviceSave(DepartamentoModel registro) {
		departamentoService.salvar(registro);
	}

	@Override
	public void serviceUpdate(DepartamentoModel registro) {
		departamentoService.alterar(registro);
	}

	@Override
	public void serviceRemove(DepartamentoModel registro) {
		departamentoService.excluir(registro);
	}

}