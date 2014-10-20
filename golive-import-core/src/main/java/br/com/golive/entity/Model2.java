package br.com.golive.entity;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import br.com.golive.annotation.Label;
import br.com.golive.annotation.StandardColumn;

@MappedSuperclass
public class Model2 implements Serializable {

	@Transient
	private static final long serialVersionUID = 6602803319212211045L;

	@Id
	@StandardColumn
	@Column(name="id")
	@Label(name = "label.id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected Long id;
	
	@StandardColumn
	@Label(name = "label.inclusao")
	@Column(name="SystemIncludeDateTime")
	@Temporal(TemporalType.TIMESTAMP)
	protected Calendar dataInclusao;
	
	@Label(name = "label.ultimaAlteracao")
	@Column(name="SystemChangeDateTime")
	@Temporal(TemporalType.TIMESTAMP)
	protected Calendar dataAlteracao;

	public Model2() {
		super();
	}

	public Model2(final Long id, final Calendar dataInclusao, final Calendar dataAlteracao) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
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
		final Model2 other = (Model2) obj;
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

	@Override
	public String toString() {
		return "Model2 [id=" + id + ", dataInclusao=" + dataInclusao + ", dataAlteracao=" + dataAlteracao + "]";
	}

}