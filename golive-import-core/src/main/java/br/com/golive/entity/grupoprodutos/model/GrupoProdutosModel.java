package br.com.golive.entity.grupoprodutos.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import br.com.golive.annotation.Jasper;
import br.com.golive.annotation.Label;
import br.com.golive.entity.Model;
import br.com.golive.entity.departamento.model.DepartamentoModel;

@Entity
@Table(name = "tbGrupoProduto")
@Label(name = "label.gruposDeProdutos")
@Jasper(titulo = "GrupoProdutos", nomeDoArquivoGerado = "file.name.model", nomeArquivoJasper = "GrupoProdutos")
public class GrupoProdutosModel extends Model {

	@Transient
	private static final long serialVersionUID = 1L;

	@Column(name = "GrupoProduto")
	private String grupoDeProduto;

	@OneToOne(cascade = { CascadeType.PERSIST }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbGrupoProduto_tbDepartamentoProduto", joinColumns = @JoinColumn(name = "tbGrupoProduto_Id", referencedColumnName = "Id"), inverseJoinColumns = @JoinColumn(name = "tbDepartamentoProduto_Id", referencedColumnName = "Id"))
	private DepartamentoModel departamentoModel;

	@Override
	public String toString() {
		return grupoDeProduto;
	}

	public GrupoProdutosModel() {
		super();
	}

	public GrupoProdutosModel(final String grupoDeProduto, final DepartamentoModel departamentoModel) {
		super();
		this.grupoDeProduto = grupoDeProduto;
		this.departamentoModel = departamentoModel;
	}

	public String getGrupoDeProduto() {
		return grupoDeProduto;
	}

	public void setGrupoDeProduto(final String grupoDeProduto) {
		this.grupoDeProduto = grupoDeProduto;
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
		int result = super.hashCode();
		result = (prime * result) + ((departamentoModel == null) ? 0 : departamentoModel.hashCode());
		result = (prime * result) + ((grupoDeProduto == null) ? 0 : grupoDeProduto.hashCode());
		return result;
	}

	@Override
	public boolean equals(final Object obj) {
		if (this == obj) {
			return true;
		}
		if (!super.equals(obj)) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		final GrupoProdutosModel other = (GrupoProdutosModel) obj;
		if (departamentoModel == null) {
			if (other.departamentoModel != null) {
				return false;
			}
		} else if (!departamentoModel.equals(other.departamentoModel)) {
			return false;
		}
		if (grupoDeProduto == null) {
			if (other.grupoDeProduto != null) {
				return false;
			}
		} else if (!grupoDeProduto.equals(other.grupoDeProduto)) {
			return false;
		}
		return true;
	}

}