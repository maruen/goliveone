package br.com.golive.entity.areaDeAtuacao;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.Transient;

import lombok.Data;
import br.com.golive.annotation.Label;

@Label(name = "label.dadosGerais")
@Data
public class Cadastro implements Serializable {

	@Transient
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Cadastro() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = (prime * result) + ((areaDeAtuacao == null) ? 0 : areaDeAtuacao.hashCode());
		result = (prime * result) + ((dataAlteracao == null) ? 0 : dataAlteracao.hashCode());
		result = (prime * result) + ((dataInclusao == null) ? 0 : dataInclusao.hashCode());
		result = (prime * result) + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(final Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		final Cadastro other = (Cadastro) obj;
		if (areaDeAtuacao == null) {
			if (other.areaDeAtuacao != null) {
				return false;
			}
		} else if (!areaDeAtuacao.equals(other.areaDeAtuacao)) {
			return false;
		}
		if (dataAlteracao == null) {
			if (other.dataAlteracao != null) {
				return false;
			}
		} else if (!dataAlteracao.equals(other.dataAlteracao)) {
			return false;
		}
		if (dataInclusao == null) {
			if (other.dataInclusao != null) {
				return false;
			}
		} else if (!dataInclusao.equals(other.dataInclusao)) {
			return false;
		}
		if (id == null) {
			if (other.id != null) {
				return false;
			}
		} else if (!id.equals(other.id)) {
			return false;
		}
		return true;
	}

}
