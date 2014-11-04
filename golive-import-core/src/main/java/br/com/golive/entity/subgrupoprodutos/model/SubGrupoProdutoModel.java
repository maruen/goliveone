package br.com.golive.entity.subgrupoprodutos.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import br.com.golive.annotation.Jasper;
import br.com.golive.annotation.Label;
import br.com.golive.entity.Model;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;

@Jasper(titulo = "SubGrupoProdutos", nomeDoArquivoGerado = "file.name.model", nomeArquivoJasper = "SubGrupoProdutos")
@Entity
@Table(name = "tbSubGrupoProduto")
@Label(name = "label.cadastroSubGrupoProduto")
public class SubGrupoProdutoModel extends Model {

	private static final long serialVersionUID = 1L;

	@Column(name = "SubGrupoProduto")
	private String subGrupoProduto;

	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.REMOVE }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbSubGrupoProduto_tbGrupoProduto", joinColumns = @JoinColumn(name = "tbSubGrupoProduto_Id", referencedColumnName = "Id"), inverseJoinColumns = @JoinColumn(name = "tbGrupoProduto_Id", referencedColumnName = "Id"))
	private GrupoProdutosModel grupoProdutoSelected;

	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.REMOVE }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbSubGrupoProduto_tbDepartamentoProduto", joinColumns = @JoinColumn(name = "tbSubGrupoProduto_Id", referencedColumnName = "Id"), inverseJoinColumns = @JoinColumn(name = "tbDepartamentoProduto_Id", referencedColumnName = "Id"))
	private DepartamentoModel departamentoSelected;

	public SubGrupoProdutoModel() {
		super();
	}

	public SubGrupoProdutoModel(final String subGrupoProduto, final GrupoProdutosModel grupoProdutoSelected, final DepartamentoModel departamentoSelected) {
		super();
		this.subGrupoProduto = subGrupoProduto;
		this.grupoProdutoSelected = grupoProdutoSelected;
		this.departamentoSelected = departamentoSelected;
	}

	public String getSubGrupoProduto() {
		return subGrupoProduto;
	}

	public void setSubGrupoProduto(final String subGrupoProduto) {
		this.subGrupoProduto = subGrupoProduto;
	}

	public GrupoProdutosModel getGrupoProdutoSelected() {
		return grupoProdutoSelected;
	}

	public void setGrupoProdutoSelected(final GrupoProdutosModel grupoProdutoSelected) {
		this.grupoProdutoSelected = grupoProdutoSelected;
	}

	public DepartamentoModel getDepartamentoSelected() {
		return departamentoSelected;
	}

	public void setDepartamentoSelected(final DepartamentoModel departamentoSelected) {
		this.departamentoSelected = departamentoSelected;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = (prime * result) + ((departamentoSelected == null) ? 0 : departamentoSelected.hashCode());
		result = (prime * result) + ((grupoProdutoSelected == null) ? 0 : grupoProdutoSelected.hashCode());
		result = (prime * result) + ((subGrupoProduto == null) ? 0 : subGrupoProduto.hashCode());
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
		final SubGrupoProdutoModel other = (SubGrupoProdutoModel) obj;
		if (departamentoSelected == null) {
			if (other.departamentoSelected != null) {
				return false;
			}
		} else if (!departamentoSelected.equals(other.departamentoSelected)) {
			return false;
		}
		if (grupoProdutoSelected == null) {
			if (other.grupoProdutoSelected != null) {
				return false;
			}
		} else if (!grupoProdutoSelected.equals(other.grupoProdutoSelected)) {
			return false;
		}
		if (subGrupoProduto == null) {
			if (other.subGrupoProduto != null) {
				return false;
			}
		} else if (!subGrupoProduto.equals(other.subGrupoProduto)) {
			return false;
		}
		return true;
	}

}