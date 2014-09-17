package br.com.golive.bean.page.home;

import java.io.Serializable;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.inject.Inject;

import lombok.Data;

import org.slf4j.Logger;

import br.com.golive.entity.Usuario;
import br.com.golive.qualifier.LabelSystemInjected;
import br.com.golive.qualifier.UsuarioLogadoInjected;
import br.com.golive.service.UsuarioBeanService;
import br.com.golive.utils.GoliveOneProperties;
import br.com.golive.utils.JSFUtils;

@ManagedBean
@ViewScoped
@Data
public class LoginBean implements Serializable {

	private static final long serialVersionUID = -3888666672821909890L;

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
	
	public void verificarUsuarioPorLogin(){
		carregadoOnBlur = usuarioService.obterPorUserName(login);
		if(carregadoOnBlur == null){
			JSFUtils.warnMessage(labels.getField("label.aviso"), labels.getField("msg.usuario.nao.existe"));
		}
	}

}
