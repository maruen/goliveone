package br.com.golive.bean.page.manager;

import java.io.Serializable;

import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import br.com.golive.constants.ChaveSessao;
import br.com.golive.entity.empresas.empresa.model.Empresa;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.qualifier.UsuarioLogadoInjected;
import br.com.golive.utils.ServiceUtils;

@ManagedBean
@ViewScoped
public abstract class GenericBean implements Serializable {

	private static final long serialVersionUID = 4071283597411400370L;

	@Inject
	@UsuarioLogadoInjected
	protected Usuario usuario;

	protected Empresa empresaSelecionada;

	public abstract void init();

	@PostConstruct
	public void postConstruct() {
		if (ServiceUtils.verificarNaSessaoPorChave(ChaveSessao.EMPRESA_SELECIONADA)) {
			empresaSelecionada = ServiceUtils.obterValorPorChave(Empresa.class, ChaveSessao.EMPRESA_SELECIONADA);
		}
	}

	public void formAction() {
		init();
	}

	public void setEmpresaSelecionada(final Empresa empresaSelecionada) {
		ServiceUtils.guardarObjetoSessao(ChaveSessao.EMPRESA_SELECIONADA, empresaSelecionada);
		this.empresaSelecionada = empresaSelecionada;
	}

	public void novaAba() {
		ServiceUtils.guardarObjetoSessao(ChaveSessao.EMPRESA_SELECIONADA, empresaSelecionada);
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(final Usuario usuario) {
		this.usuario = usuario;
	}

	public Empresa getEmpresaSelecionada() {
		return empresaSelecionada;
	}

}
