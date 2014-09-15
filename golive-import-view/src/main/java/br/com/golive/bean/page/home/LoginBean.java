package br.com.golive.bean.page.home;

import java.io.Serializable;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import org.slf4j.Logger;

import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.utils.GoliveOneProperties;
import br.com.golive.utils.JSFUtils;

@ManagedBean
@ViewScoped
public class LoginBean implements Serializable {

	private static final long serialVersionUID = -3888666672821909890L;

	@Inject
	private Logger logger;

	@Inject
	@LabelSystemInjected
	private GoliveOneProperties labels;

	private String login;

	private String senha;

	private String assinante;

	public GoliveOneProperties getLabels() {
		return labels;
	}

	public String logar() {
		logger.info("Logando usuario = {}", login);
		if (obterUsuarioPorLoginSenha()) {
			return "pretty:welcome";
		} else {
			messageLoginInvalido();
		}
		return "";
	}

	public void messageLoginInvalido() {
		logger.info("Erro ao realizar Login.");
		JSFUtils.warnMessage(labels.getField("title.msg.usuario.invalido"), labels.getField("msg.usuario.invalido"));
	}

	public boolean obterUsuarioPorLoginSenha() {
		return true;
	}

	public void limpar() {
		login = "";
		senha = "";
		assinante = "";
	}

	public Logger getLogger() {
		return logger;
	}

	public void setLogger(final Logger logger) {
		this.logger = logger;
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

	public String getAssinante() {
		return assinante;
	}

	public void setAssinante(final String assinante) {
		this.assinante = assinante;
	}

}
