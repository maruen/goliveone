package br.com.golive.entity.grupoprodutodepartamento;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Transient;

import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;

@Embeddable
public class GrupoProdutoDepartamentoId implements Serializable {

	@Transient
	private static final long serialVersionUID = 1704474742821257124L;

	@Column(name = "tbGrupoProduto_Id")
	private GrupoProdutosModel grupoProduto;

	@Column(name = "tbDepartamentoProduto_Id")
	private DepartamentoModel departamento;

	public GrupoProdutoDepartamentoId() {
		super();
	}

	public GrupoProdutoDepartamentoId(final GrupoProdutosModel grupoProduto, final DepartamentoModel departamento) {
		super();
		this.grupoProduto = grupoProduto;
		this.departamento = departamento;
	}

	public GrupoProdutosModel getGrupoProduto() {
		return grupoProduto;
	}

	public void setGrupoProduto(final GrupoProdutosModel grupoProduto) {
		this.grupoProduto = grupoProduto;
	}

	public DepartamentoModel getDepartamento() {
		return departamento;
	}

	public void setDepartamento(final DepartamentoModel departamento) {
		this.departamento = departamento;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = (prime * result) + ((departamento == null) ? 0 : departamento.hashCode());
		result = (prime * result) + ((grupoProduto == null) ? 0 : grupoProduto.hashCode());
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
		if (departamento == null) {
			if (other.departamento != null) {
				return false;
			}
		} else if (!departamento.equals(other.departamento)) {
			return false;
		}
		if (grupoProduto == null) {
			if (other.grupoProduto != null) {
				return false;
			}
		} else if (!grupoProduto.equals(other.grupoProduto)) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "GrupoProdutoDepartamento [grupoProduto=" + grupoProduto + ", departamento=" + departamento + "]";
	}

}
