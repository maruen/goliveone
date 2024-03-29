package br.com.golive.bean.generics.fragment;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.bean.page.cadastro.rules.CadastroGenericBeanLazy;
import br.com.golive.entity.empresas.empresa.model.Empresa;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.qualifier.EmpresaSelecionadaInjected;
import br.com.golive.qualifier.UsuarioLogadoInjected;
import br.com.golive.utils.JSFUtils;

@SuppressWarnings("rawtypes")
public abstract class GenericFragmentBean implements Serializable {

	private static final long serialVersionUID = 1L;

	@Inject
	@UsuarioLogadoInjected
	protected Usuario usuario;

	@Inject
	@EmpresaSelecionadaInjected
	protected Empresa empresaSelecionada;

	protected CadastroGenericBeanLazy delegate;

	public abstract Logger getLogger();

	public String getUpdate(final String update) {
		final StringBuilder sb = new StringBuilder();

		for (final String string : update.trim().split(",")) {
			sb.append(":conteudoForm:" + string + ", ");
		}
		return sb.toString().replace(" ", "");
	}

	protected void removeAll(final List<?>... list) {
		for (final List<?> lista : list) {
			if (lista != null) {
				lista.removeAll(lista);
			}
		}
	}

	protected void validar() {
		if (delegate != null) {
			delegate.validarComponent();
		}
	}

	protected void infoList(final String model) {
		getLogger().info("Carregando Lista de " + model);
	}

	protected boolean isEmptyOrNull(final List<?> list) {
		return ((list == null) || (list.isEmpty()));
	}

	public void listaVaziaMessage(final String label) {
		getLogger().info("Lista vazia, mensagem = {} ", usuario.getLabels().getField(label));
		JSFUtils.warnMessage(usuario.getLabels().getField("label.cadastroSegmentos.msnNaoHaRegistros"), usuario.getLabels().getField(label));
	}

	public CadastroGenericBeanLazy getDelegate() {
		return delegate;
	}

	public void setDelegate(final CadastroGenericBeanLazy delegate) {
		this.delegate = delegate;
	}

}
