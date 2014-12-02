package br.com.golive.bean.page.home;

import static br.com.golive.constants.Constantes.EMPTY_STRING;

import java.io.IOException;
import java.io.Serializable;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.constants.ChaveSessao;
import br.com.golive.encryptor.Encryption;
import br.com.golive.entity.empresas.empresa.model.Empresa;
import br.com.golive.entity.usuario.model.Usuario;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.qualifier.UsuarioLogadoInjected;
import br.com.golive.service.UsuarioBeanService;
import br.com.golive.utils.GoliveOneProperties;
import br.com.golive.utils.JSFUtils;
import br.com.golive.utils.PrettyUrl;
import br.com.golive.utils.ServiceUtils;

@ManagedBean
@ViewScoped
public class LoginBean implements Serializable {

	private static final long serialVersionUID = 1L;

	@EJB
	private UsuarioBeanService usuarioService;

	@Inject
	private Logger logger;

	@Inject
	@LabelSystemInjected
	private GoliveOneProperties labels;

	@Inject
	@UsuarioLogadoInjected
	private Usuario usuario;

	private Usuario carregadoOnBlur;

	private String login;

	private String senha;

	private Long assinante;

	private boolean errouLogin;

	private String url;

	@PostConstruct
	public void init() {

		try {

			if (usuario != null) {
				JSFUtils.redirect("/");
			}
		} catch (final Exception e) {
			e.printStackTrace();
		}

		login = EMPTY_STRING;
		senha = EMPTY_STRING;

	}

	public GoliveOneProperties getLabels() {
		return labels;
	}

	public String logar() {
		logger.info("Logando usuario = {}", getLogin());
		if (obterUsuarioPorLoginSenha()) {
			if (getAssinante() == null) {
				JSFUtils.warnMessage(labels.getField("title.msg.selecione.registro"), labels.getField("msg.selecionar.empresa"));
			} else {

				guardarEmpresaSelesionada();
				ServiceUtils.guardarObjetoSessao(ChaveSessao.USUARIO_LOGADO, carregadoOnBlur);
				try {

					if (ServiceUtils.verificarNaSessaoPorChave(ChaveSessao.ULTIMA_PAGINA)) {
						JSFUtils.redirect(ServiceUtils.obterValorPorChave(PrettyUrl.class, ChaveSessao.ULTIMA_PAGINA).getPrettyUrl());
					} else {
						JSFUtils.redirect("/");
					}

				} catch (final IOException e) {
					e.printStackTrace();
				}
			}
		} else {
			messageLoginInvalido();
		}
		return "";
	}

	private void guardarEmpresaSelesionada() {
		for (final Empresa empresa : carregadoOnBlur.getEmpresas()) {
			if (empresa.getId().equals(getAssinante())) {
				ServiceUtils.guardarObjetoSessao(ChaveSessao.EMPRESA_SELECIONADA, empresa);
			}
		}
	}

	public void messageLoginInvalido() {
		logger.info("Erro ao realizar Login.");
		JSFUtils.warnMessage(labels.getField("title.msg.usuario.invalido"), labels.getField("msg.usuario.invalido"));
	}

	public boolean obterUsuarioPorLoginSenha() {

		boolean loginOK = false;
		try {
			if (campoValido(getLogin())) {
				carregadoOnBlur = usuarioService.logar(getLogin());
				if (campoValido(getSenha()) && (carregadoOnBlur != null)) {
					if (Encryption.decrypt(carregadoOnBlur.getPassword()).equals(getSenha())) {
						loginOK = true;
					}
				}
			}
		} catch (final Exception e) {
			e.printStackTrace();
		}

		return loginOK;
	}

	public boolean campoValido(final String campo) {
		return ((campo != null) && (!campo.isEmpty()));
	}

	public void limpar() {
		setLogin(EMPTY_STRING);
		setSenha(EMPTY_STRING);
	}

	public void verificarUsuarioPorLogin() {
		if (!login.isEmpty()) {
			carregadoOnBlur = usuarioService.logar(getLogin());
			if (carregadoOnBlur == null) {
				setErrouLogin(true);
				JSFUtils.warnMessage(labels.getField("label.aviso"), labels.getField("msg.usuario.nao.existe"));
			}
		}
	}

	public boolean isErrouLogin() {
		return errouLogin;
	}

	public void setErrouLogin(final boolean errouLogin) {
		this.errouLogin = errouLogin;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(final String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(final String senha) {
		this.senha = senha;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(final Usuario usuario) {
		this.usuario = usuario;
	}

	public Usuario getCarregadoOnBlur() {
		return carregadoOnBlur;
	}

	public void setCarregadoOnBlur(final Usuario carregadoOnBlur) {
		this.carregadoOnBlur = carregadoOnBlur;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(final String url) {
		this.url = url;
	}

	public void setLabels(final GoliveOneProperties labels) {
		this.labels = labels;
	}

	public Long getAssinante() {
		return assinante;
	}

	public void setAssinante(final Long assinante) {
		this.assinante = assinante;
	}

}
