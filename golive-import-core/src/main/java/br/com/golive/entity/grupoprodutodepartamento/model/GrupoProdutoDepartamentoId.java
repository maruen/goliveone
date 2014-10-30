package br.com.golive.entity.grupoprodutodepartamento.model;

import java.io.Serializable;

import javax.persistence.Transient;

public class GrupoProdutoDepartamentoId implements Serializable {

	@Transient
	private static final long serialVersionUID = -4268541471836661476L;

	private Long grupoProdutosModel;

	private Long departamentoModel;

	public GrupoProdutoDepartamentoId() {
		super();
	}

	public Long getGrupoProdutosModel() {
		return grupoProdutosModel;
	}

	public void setGrupoProdutosModel(final Long grupoProdutosModel) {
		this.grupoProdutosModel = grupoProdutosModel;
	}

	public Long getDepartamentoModel() {
		return departamentoModel;
	}

	public void setDepartamentoModel(final Long departamentoModel) {
		this.departamentoModel = departamentoModel;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}