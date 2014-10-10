package br.com.golive.entity;

import java.io.Serializable;
import java.util.Calendar;
import java.util.List;

import lombok.Data;
import br.com.golive.utils.GoliveOneProperties;

@Data
public class Usuario implements Serializable {

	private static final long serialVersionUID = -8750720313507700912L;

	private Long id;
	private String nome;
	private Calendar dataInclusao;
	private String senha;
	private List<String> empresas;
	private GoliveOneProperties labels;


	public Long getId() {
		return id;
	}

	public void setId(final Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(final String nome) {
		this.nome = nome;
	}

	public Calendar getDataInclusao() {
		return dataInclusao;
	}

	public void setDataInclusao(final Calendar dataInclusao) {
		this.dataInclusao = dataInclusao;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(final String senha) {
		this.senha = senha;
	}

	public List<String> getEmpresas() {
		return empresas;
	}

	public void setEmpresas(final List<String> empresas) {
		this.empresas = empresas;
	}

	public GoliveOneProperties getLabels() {
		return labels;
	}

	public void setLabels(final GoliveOneProperties labels) {
		this.labels = labels;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
