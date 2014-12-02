package br.com.golive.bean.page.cadastro.cadastros.produtos.tipoProduto;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Getter;

import org.slf4j.Logger;

import br.com.golive.annotation.Label;
import br.com.golive.bean.page.cadastro.rules.CadastroGenericBeanLazy;
import br.com.golive.entity.tipoproduto.model.TipoProdutoModel;
import br.com.golive.service.TipoProdutoService;
import br.com.golive.utils.Utils;

@ManagedBean
@ViewScoped
@Label(name = "label.cadastroTipoProduto")
public class TipoProdutoBean extends CadastroGenericBeanLazy<TipoProdutoModel> {

	private static final long serialVersionUID = 1L;

	@Inject
	@Getter
	private Logger logger;

	@Inject
	@Getter
	private TipoProdutoFilter filtros;

	@EJB
	@Getter
	private TipoProdutoService serviceBean;

	@Override
	public boolean validarCampos() {
		final boolean ret = Utils.validarCamposNulos(registro, registro.getTipoProduto());

		if (!ret) {
			preencherTodosCamposMessage();
		}

		return ret;
	}

}