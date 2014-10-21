package br.com.golive.entity.usuario.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import br.com.golive.entity.Model;
import br.com.golive.entity.empresas.empresa.model.Empresa;
import br.com.golive.entity.perfilconfiguracao.model.ColunaPerfil;
import br.com.golive.utils.GoliveOneProperties;

@Entity
@Table(name = "tbUsuario")
public class Usuario extends Model {

	private static final long serialVersionUID = 2665034096496208974L;

	@Column(name = "Login")
	private String login;

	@Column(name = "Password")
	private String password;

	@Transient
	private List<Empresa> empresas;

	@Transient
	private List<ColunaPerfil> configuracaoColunaPerfil;

	@Transient
	private GoliveOneProperties labels;

	public String getLogin() {
		return login;
	}

	public void setLogin(final String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(final String password) {
		this.password = password;
	}

	public List<Empresa> getEmpresas() {
		return empresas;
	}

	public void setEmpresas(final List<Empresa> empresas) {
		this.empresas = empresas;
	}

	public List<ColunaPerfil> getConfiguracaoColunaPerfil() {
		return configuracaoColunaPerfil;
	}

	public void setConfiguracaoColunaPerfil(final List<ColunaPerfil> configuracaoColunaPerfil) {
		this.configuracaoColunaPerfil = configuracaoColunaPerfil;
	}

	public GoliveOneProperties getLabels() {
		return labels;
	}

	public void setLabels(final GoliveOneProperties labels) {
		this.labels = labels;
	}

}
