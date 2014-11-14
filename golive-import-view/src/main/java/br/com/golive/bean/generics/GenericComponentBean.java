package br.com.golive.bean.generics;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;

import br.com.golive.bean.page.cadastro.rules.CadastroGenericBean;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.qualifier.UsuarioLogadoInjected;
import br.com.golive.utils.JSFUtils;

@SuppressWarnings("rawtypes")
public abstract class GenericComponentBean implements Serializable {

	private static final long serialVersionUID = 1L;

	@Inject
	@UsuarioLogadoInjected
	protected Usuario usuario;

	protected CadastroGenericBean delegate;

	public String getUpdate(final String update) {
		final StringBuilder sb = new StringBuilder();

		for (final String string : update.trim().split(",")) {
			sb.append(":conteudoForm:" + string + ", ");
		}
		return sb.toString().replace(" ", "");
	}

	protected void validar() {
		if (delegate != null) {
			delegate.validarComponent();
		}
	}

	protected boolean isEmptyOrNull(final List<?> list) {
		return ((list == null) || (list.isEmpty()));
	}

	public void listaVaziaMessage(final String label) {
		JSFUtils.warnMessage(usuario.getLabels().getField("label.cadastroSegmentos.msnNaoHaRegistros"), usuario.getLabels().getField(label));
	}

	public CadastroGenericBean getDelegate() {
		return delegate;
	}

	public void setDelegate(final CadastroGenericBean delegate) {
		this.delegate = delegate;
	}

}
