package br.com.golive.entity.colecoes.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;
import br.com.golive.annotation.Label;
import br.com.golive.entity.Model;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;

@Data
@Entity
@Table(name = "tbColecoesProduto")
@Jasper(titulo = "Colecoes", nomeDoArquivoGerado = "file.name.model", nomeArquivoJasper = "Colecoes")
@Label(name = "label.colecoes")
public class ColecoesModel extends Model {

	@Transient
	private static final long serialVersionUID = 1L;

	@Column(name = "Colecao")
	private String colecao;

	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.REMOVE }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbColecoesProduto_tbGrupoProduto", joinColumns = @JoinColumn(name = "tbColecoesProduto_Id", referencedColumnName = "Id"), inverseJoinColumns = @JoinColumn(name = "tbGrupoProduto_Id", referencedColumnName = "Id"))
	private GrupoProdutosModel grupoProdutoSelected;

	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.REMOVE }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbColecoesProduto_tbDepartamentoProduto", joinColumns = @JoinColumn(name = "tbColecoesProduto_Id", referencedColumnName = "Id"), inverseJoinColumns = @JoinColumn(name = "tbDepartamentoProduto_Id", referencedColumnName = "Id"))
	private DepartamentoModel departamentoSelected;

	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.REMOVE }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbColecoesProduto_tbSubGrupoProduto", joinColumns = @JoinColumn(name = "tbColecoesProduto_Id", referencedColumnName = "Id"), inverseJoinColumns = @JoinColumn(name = "tbSubGrupoProduto_Id", referencedColumnName = "Id"))
	private SubGrupoProdutoModel subGrupoProdutoSelected;

	public ColecoesModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ColecoesModel(final String colecao, final GrupoProdutosModel grupoProdutoSelected, final DepartamentoModel departamentoSelected, final SubGrupoProdutoModel subGrupoProdutoSelected) {
		super();
		this.colecao = colecao;
		this.grupoProdutoSelected = grupoProdutoSelected;
		this.departamentoSelected = departamentoSelected;
		this.subGrupoProdutoSelected = subGrupoProdutoSelected;
	}

	public String getColecao() {
		return colecao;
	}

	public void setColecao(final String colecao) {
		this.colecao = colecao;
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

	public SubGrupoProdutoModel getSubGrupoProdutoSelected() {
		return subGrupoProdutoSelected;
	}

	public void setSubGrupoProdutoSelected(final SubGrupoProdutoModel subGrupoProdutoSelected) {
		this.subGrupoProdutoSelected = subGrupoProdutoSelected;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = (prime * result) + ((colecao == null) ? 0 : colecao.hashCode());
		result = (prime * result) + ((departamentoSelected == null) ? 0 : departamentoSelected.hashCode());
		result = (prime * result) + ((grupoProdutoSelected == null) ? 0 : grupoProdutoSelected.hashCode());
		result = (prime * result) + ((subGrupoProdutoSelected == null) ? 0 : subGrupoProdutoSelected.hashCode());
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
		final ColecoesModel other = (ColecoesModel) obj;
		if (colecao == null) {
			if (other.colecao != null) {
				return false;
			}
		} else if (!colecao.equals(other.colecao)) {
			return false;
		}
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
		if (subGrupoProdutoSelected == null) {
			if (other.subGrupoProdutoSelected != null) {
				return false;
			}
		} else if (!subGrupoProdutoSelected.equals(other.subGrupoProdutoSelected)) {
			return false;
		}
		return true;
	}

}