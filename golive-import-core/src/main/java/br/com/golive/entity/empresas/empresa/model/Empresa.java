package br.com.golive.entity.empresas.empresa.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import br.com.golive.entity.Model;

@Entity
@Table(name = "tbEmpresa")
public class Empresa extends Model {

	private static final long serialVersionUID = -5696489966361813483L;

	@Column(name = "Cnpj")
	private String cnpj;

	@Column(name = "RazaoSocial")
	private String razaoSocial;

	@Column(name = "NomeFantasia")
	private String nome;

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(final String cnpj) {
		this.cnpj = cnpj;
	}

	public String getRazaoSocial() {
		return razaoSocial;
	}

	public void setRazaoSocial(final String razaoSocial) {
		this.razaoSocial = razaoSocial;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(final String nome) {
		this.nome = nome;
	}


}
