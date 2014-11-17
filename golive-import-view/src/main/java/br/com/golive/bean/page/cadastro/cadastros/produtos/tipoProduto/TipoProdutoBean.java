package br.com.golive.bean.page.cadastro.cadastros.produtos.tipoProduto;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBean;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericFilterBean;
import br.com.golive.entity.tipoproduto.model.TipoProdutoModel;
import br.com.golive.service.TipoProdutoService;
import br.com.golive.utils.Utils;

@ManagedBean
@ViewScoped
@Label(name = "label.cadastroTipoProduto")
public class TipoProdutoBean extends CadastroGenericBean<TipoProdutoModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	private Logger logger;

	@Inject
	private TipoProdutoFilter filtros;

	@EJB
	private TipoProdutoService tipoProdutoService;

	@Override
	@PostConstruct
	public void init() {
		super.init(tipoProdutoService.obterLista());
	}

	@Override
	public Logger getLogger() {
		return logger;
	}

	@Override
	public boolean validarCampos() {
		final boolean ret = Utils.validarCamposNulos(registro, registro.getTipoProduto());

		if (!ret) {
			preencherTodosCamposMessage();
		}

		return ret;
	}

	@Override
	public void serviceSave(final TipoProdutoModel registro) {
		tipoProdutoService.salvar(registro);
	}

	@Override
	public void serviceUpdate(final TipoProdutoModel registro) {
		tipoProdutoService.atualizar(registro);
	}

	@Override
	public void serviceRemove(final TipoProdutoModel registro) {
		tipoProdutoService.remover(registro);
	}

	@Override
	public void serviceRefresh(final TipoProdutoModel registro) {
		tipoProdutoService.refresh(registro);
	}

	@Override
	public CadastroGenericFilterBean<TipoProdutoModel> getFiltros() {
		return filtros;
	}

	@Override
	public void incluir() {
		super.incluir();
		registro = new TipoProdutoModel();
	}

	@Override
	public void editarRegistro() {
		super.editarRegistro();
	}
}