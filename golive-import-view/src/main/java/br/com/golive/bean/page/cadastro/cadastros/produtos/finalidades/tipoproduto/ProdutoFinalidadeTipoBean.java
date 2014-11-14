package br.com.golive.bean.page.cadastro.cadastros.produtos.finalidades.tipoproduto;

import java.util.ArrayList;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBean;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericFilterBean;
import br.com.golive.entity.finalidadetipo.model.ProdutoFinalidadeTipoModel;
import br.com.golive.utils.Utils;

@Label(name = "label.cadastroFinalidadeTipo")
@ManagedBean
@ViewScoped
public class ProdutoFinalidadeTipoBean extends CadastroGenericBean<ProdutoFinalidadeTipoModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	private Logger logger;

	@Inject
	private ProdutoFinalidadeTipoFilter filtros;

	@Override
	@PostConstruct
	public void init() {
		super.init(new ArrayList<ProdutoFinalidadeTipoModel>());
	}

	@Override
	public Logger getLogger() {
		return logger;
	}

	@Override
	public boolean validarCampos() {
		final boolean ret = Utils.validarCamposNulos(registro, registro.getNumeroMinimoDeCaracteres(), registro.getNumeroMaximoDeCaracteres(), registro.getNumeroMinimoDeCaracteres());
		if (!ret) {
			preencherTodosCamposMessage();
		}
		return ret;
	}

	@Override
	public void incluir() {
		super.incluir();
		registro = new ProdutoFinalidadeTipoModel();
	}

	@Override
	public void serviceSave(final ProdutoFinalidadeTipoModel registro) {

	}

	@Override
	public void serviceUpdate(final ProdutoFinalidadeTipoModel registro) {

	}

	@Override
	public void serviceRemove(final ProdutoFinalidadeTipoModel registro) {

	}

	@Override
	public void serviceRefresh(final ProdutoFinalidadeTipoModel registro) {

	}

	@Override
	public CadastroGenericFilterBean<ProdutoFinalidadeTipoModel> getFiltros() {
		return filtros;
	}

}
