package br.com.golive.bean.page.cadastro.cadastros.produtos.classificacao.departamento;

import java.util.Map;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;
import lombok.Setter;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBean;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.filter.GoliveFilter;
import br.com.golive.navigation.component.LazyModel;
import br.com.golive.navigation.component.OrderByDynamicColumn;
import br.com.golive.service.DepartamentoService;

@ManagedBean
@ViewScoped
@Label(name = "label.cadastroDepartamento")
public class DepartamentoBean extends CadastroGenericBean<DepartamentoModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	@Getter
	@Setter
	private Logger logger;

	@Inject
	@Getter
	@Setter
	private DepartamentoFilter filtros;

	@EJB
	private DepartamentoService departamentoService;

	@Override
	@PostConstruct
	public void init() {
		if (usuario != null) {
			super.init(departamentoService.obterLista());
		}

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
			ret = false;
		}
		if ((registro.getDepartamento() == null) || (registro.getDepartamento().isEmpty())) {
			ret = false;
		}

		if (!ret) {
			preencherTodosCamposMessage();
		}
		return true;
	}

	@Override
	public void serviceSave(final DepartamentoModel registro) {
		departamentoService.salvar(registro);
	}

	@Override
	public void serviceUpdate(final DepartamentoModel registro) {
		departamentoService.atualizar(registro);
	}

	@Override
	public void serviceRemove(final DepartamentoModel registro) {
		departamentoService.remover(registro);
	}

	public DepartamentoService getDepartamentoService() {
		return departamentoService;
	}

	public void setDepartamentoService(final DepartamentoService departamentoService) {
		this.departamentoService = departamentoService;
	}

	@Override
	public void serviceRefresh(final DepartamentoModel model) {
		departamentoService.refresh(model);

	}

	public LazyModel<DepartamentoModel> obterLazyList(final int first, final int pageSize, final Map<String, GoliveFilter> parameters, final OrderByDynamicColumn order) {
		return departamentoService.obterListaLazy(first, pageSize, parameters, order);
	}

}