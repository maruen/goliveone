package br.com.golive.bean.page.cadastro.cadastros.produtos.especialidades.unidade;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBean;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericFilterBean;
import br.com.golive.entity.unidade.model.UnidadeModel;
import br.com.golive.service.UnidadeService;

@Label(name = "label.cadastroUnidade")
@ManagedBean
@ViewScoped
public class UnidadeBean extends CadastroGenericBean<UnidadeModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	private Logger logger;

	@EJB
	private UnidadeService unidadeService;

	@Inject
	private UnidadeFilter filtros;

	@Override
	@PostConstruct
	public void init() {
		super.init(unidadeService.obterLista());
	}

	@Override
	public Logger getLogger() {
		return logger;
	}

	@Override
	public void incluir() {
		super.incluir();
		registro = new UnidadeModel();
	}

	@Override
	public boolean validarCampos() {
		boolean ret = true;
		if (registro == null) {
			ret = false;
		}
		if ((registro.getAbreviacao() == null) || (registro.getAbreviacao().isEmpty())) {
			ret = false;
		}
		if (registro.getUnidade() == null) {
			ret = false;
		}
		if (!ret) {
			preencherTodosCamposMessage();
		}
		return ret;
	}

	@Override
	public void serviceSave(final UnidadeModel registro) {
		unidadeService.salvar(registro);
	}

	@Override
	public void serviceUpdate(final UnidadeModel registro) {
		unidadeService.atualizar(registro);
	}

	@Override
	public void serviceRemove(final UnidadeModel registro) {
		unidadeService.remover(registro);
	}

	@Override
	public void serviceRefresh(final UnidadeModel registro) {
		unidadeService.refresh(registro);
	}

	@Override
	public CadastroGenericFilterBean<UnidadeModel> getFiltros() {
		return filtros;
	}

}