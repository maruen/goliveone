package br.com.golive.entity.grupoprodutodepartamento.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Transient;

import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;

@Embeddable
public class GrupoProdutoDepartamentoId implements Serializable {

	@Transient
	private static final long serialVersionUID = 6448060997543771451L;

	@Column(name = "tbGrupoProduto_Id")
	private GrupoProdutosModel grupoProdutosModel;

	@Column(name = "tbDepartamentoProduto_Id")
	private DepartamentoModel departamentoModel;

	public GrupoProdutoDepartamentoId() {
		super();
	}

	public GrupoProdutoDepartamentoId(final GrupoProdutosModel grupoProdutosModel, final DepartamentoModel departamentoModel) {
		super();
		this.grupoProdutosModel = grupoProdutosModel;
		this.departamentoModel = departamentoModel;
	}

	public GrupoProdutosModel getGrupoProdutosModel() {
		return grupoProdutosModel;
	}

	public void setGrupoProdutosModel(final GrupoProdutosModel grupoProdutosModel) {
		this.grupoProdutosModel = grupoProdutosModel;
	}

	public DepartamentoModel getDepartamentoModel() {
		return departamentoModel;
	}

	public void setDepartamentoModel(final DepartamentoModel departamentoModel) {
		this.departamentoModel = departamentoModel;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = (prime * result) + ((departamentoModel == null) ? 0 : departamentoModel.hashCode());
		result = (prime * result) + ((grupoProdutosModel == null) ? 0 : grupoProdutosModel.hashCode());
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
		final GrupoProdutoDepartamentoId other = (GrupoProdutoDepartamentoId) obj;
		if (departamentoModel == null) {
			if (other.departamentoModel != null) {
				return false;
			}
		} else if (!departamentoModel.equals(other.departamentoModel)) {
			return false;
		}
		if (grupoProdutosModel == null) {
			if (other.grupoProdutosModel != null) {
				return false;
			}
		} else if (!grupoProdutosModel.equals(other.grupoProdutosModel)) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "GrupoProdutoDepartamentoId [grupoProdutosModel=" + grupoProdutosModel + ", departamentoModel=" + departamentoModel + "]";
	}

}
