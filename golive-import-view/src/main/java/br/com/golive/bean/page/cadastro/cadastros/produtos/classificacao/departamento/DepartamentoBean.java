package br.com.golive.bean.page.cadastro.cadastros.produtos.classificacao.departamento;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBean;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericFilterBean;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.service.DepartamentoService;

@ManagedBean
@ViewScoped
@Label(name = "label.cadastroDepartamento")
public class DepartamentoBean extends CadastroGenericBean<DepartamentoModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	private Logger logger;

	@Inject
	private DepartamentoFilter filtros;

	@EJB
	private DepartamentoService departamentoService;

	@Override
	@PostConstruct
	public void init() {
		super.init(departamentoService.obterListaDepartamento());
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
		departamentoService.alterar(registro);
	}

	@Override
	public void serviceRemove(final DepartamentoModel registro) {
		departamentoService.excluir(registro);
	}

	@Override
	public Logger getLogger() {
		return logger;
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

	@Override
	public CadastroGenericFilterBean<DepartamentoModel> getFiltros() {
		return filtros;
	}

}