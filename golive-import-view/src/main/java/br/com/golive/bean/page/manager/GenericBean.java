package br.com.golive.bean.page.manager;

import java.io.Serializable;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import br.com.golive.constants.ChaveSessao;
import br.com.golive.entity.Usuario;
import br.com.golive.qualifier.UsuarioLogadoInjected;
import br.com.golive.utils.ServiceUtils;

@ManagedBean
@ViewScoped
public abstract class GenericBean implements Serializable {

	private static final long serialVersionUID = 4071283597411400370L;

	@Inject
	@UsuarioLogadoInjected
	protected Usuario usuario;

	private String empresaSelecionada;

	@PostConstruct
	public void postConstruct() {
		if (ServiceUtils.verificarNaSessaoPorChave(ChaveSessao.EMPRESA_SELECIONADA)) {
			empresaSelecionada = ServiceUtils.obterValorPorChave(String.class, ChaveSessao.EMPRESA_SELECIONADA);
		}
	}


	public String getEmpresaSelecionada() {
		return empresaSelecionada;
	}

	public void novaAba() {
		ServiceUtils.guardarObjetoSessao(ChaveSessao.EMPRESA_SELECIONADA, empresaSelecionada);
	}

	public void setEmpresaSelecionada(final String empresaSelecionada) {
		ServiceUtils.guardarObjetoSessao(ChaveSessao.EMPRESA_SELECIONADA, empresaSelecionada);
		this.empresaSelecionada = empresaSelecionada;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(final Usuario usuario) {
		this.usuario = usuario;
	}

}
