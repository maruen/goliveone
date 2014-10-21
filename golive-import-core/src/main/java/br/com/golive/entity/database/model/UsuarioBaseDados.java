package br.com.golive.entity.database.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import br.com.golive.entity.Model;


/**
 * The persistent class for the tbDatabaseUser database table.
 * 
 */
@Entity
@Table(name="tbDatabaseUser")
@NamedQuery(name = "TbDatabaseUser.findAll", query = "SELECT t FROM UsuarioBaseDados t")
public class UsuarioBaseDados extends Model {

	private static final long serialVersionUID = 113761360090498692L;

	@Column(name="Login")
	private String login;

	@Column(name="Password")
	private String password;

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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}