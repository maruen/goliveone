package br.com.golive.entity.areaDeAtuacao;

import java.io.Serializable;
import java.util.Calendar;

import br.com.golive.annotation.Label;

@Label(name = "label.dadosGerais")
public class Cadastro implements Serializable {
	
	private static final long serialVersionUID = -7415246692175931894L;

	@Label(name = "label.id")
	private Long id;

	@Label(name = "label.inclusao")
	private Calendar dataInclusao;

	@Label(name = "label.ultimaAlteracao")
	private Calendar dataAlteracao;

	@Label(name = "label.descricao")
	private String areaDeAtuacao;

	public Cadastro(final Long id, final Calendar dataInclusao, final Calendar dataAlteracao, final String areaDeAtuacao) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.areaDeAtuacao = areaDeAtuacao;
	}

	public Long getId() {
		return id;
	}

	public void setId(final Long id) {
		this.id = id;
	}

	public Calendar getDataInclusao() {
		return dataInclusao;
	}

	public void setDataInclusao(final Calendar dataInclusao) {
		this.dataInclusao = dataInclusao;
	}

	public Calendar getDataAlteracao() {
		return dataAlteracao;
	}

	public void setDataAlteracao(final Calendar dataAlteracao) {
		this.dataAlteracao = dataAlteracao;
	}

	public String getAreaDeAtuacao() {
		return areaDeAtuacao;
	}

	public void setAreaDeAtuacao(final String areaDeAtuacao) {
		this.areaDeAtuacao = areaDeAtuacao;
	}

	public Cadastro() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "CadastroAreaAtuacao [id=" + id + ", dataInclusao=" + dataInclusao + ", dataAlteracao=" + dataAlteracao + ", areaDeAtuacao=" + areaDeAtuacao + "]";
	}
	
}
