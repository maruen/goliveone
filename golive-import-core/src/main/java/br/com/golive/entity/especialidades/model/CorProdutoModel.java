package br.com.golive.entity.especialidades.model;

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
import br.com.golive.entity.colecoes.model.ColecoesModel;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;

@Jasper(titulo = "Cores", nomeDoArquivoGerado = "file.name.model", nomeArquivoJasper = "Cores")
@Entity
@Table(name = "tbCorProduto")
@Label(name = "label.cadastroCores")
public class CorProdutoModel extends Model {

	private static final long serialVersionUID = 1L;

	@Column(name = "CorCodigo")
	private String corCodigo;

	@Column(name = "CorDescricao")
	private String corDescricao;

	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbCorProduto_tbSubGrupoProduto", joinColumns = @JoinColumn(name = "tbCorProduto_Id", referencedColumnName = "Id"), inverseJoinColumns = @JoinColumn(name = "tbSubGrupoProduto_Id", referencedColumnName = "Id"))
	private SubGrupoProdutoModel subGrupoProdutoSelected;

	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbCorProduto_tbGrupoProduto", joinColumns = @JoinColumn(name = "tbCorProduto_Id", referencedColumnName = "Id"), inverseJoinColumns = @JoinColumn(name = "tbGrupoProduto_Id", referencedColumnName = "Id"))
	private GrupoProdutosModel grupoProdutoSelected;

	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbCorProduto_tbDepartamentoProduto", joinColumns = @JoinColumn(name = "tbCorProduto_Id", referencedColumnName = "Id"), inverseJoinColumns = @JoinColumn(name = "tbDepartamentoProduto_Id", referencedColumnName = "Id"))
	private DepartamentoModel departamentoSelected;

	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbCorProduto_tbColecoesProduto", joinColumns = @JoinColumn(name = "tbCorProduto_Id", referencedColumnName = "Id"), inverseJoinColumns = @JoinColumn(name = "tbColecoesProduto_Id", referencedColumnName = "Id"))
	private ColecoesModel colecaoSelected;

	public CorProdutoModel() {
		super();
	}

	public String getCorCodigo() {
		return corCodigo;
	}

	public void setCorCodigo(final String corCodigo) {
		this.corCodigo = corCodigo;
	}

	public String getCorDescricao() {
		return corDescricao;
	}

	public void setCorDescricao(final String corDescricao) {
		this.corDescricao = corDescricao;
	}

	public SubGrupoProdutoModel getSubGrupoProdutoSelected() {
		return subGrupoProdutoSelected;
	}

	public void setSubGrupoProdutoSelected(final SubGrupoProdutoModel subGrupoProdutoSelected) {
		this.subGrupoProdutoSelected = subGrupoProdutoSelected;
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

	public ColecoesModel getColecaoSelected() {
		return colecaoSelected;
	}

	public void setColecaoSelected(final ColecoesModel colecaoSelected) {
		this.colecaoSelected = colecaoSelected;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = (prime * result) + ((colecaoSelected == null) ? 0 : colecaoSelected.hashCode());
		result = (prime * result) + ((corCodigo == null) ? 0 : corCodigo.hashCode());
		result = (prime * result) + ((corDescricao == null) ? 0 : corDescricao.hashCode());
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
		final CorProdutoModel other = (CorProdutoModel) obj;
		if (colecaoSelected == null) {
			if (other.colecaoSelected != null) {
				return false;
			}
		} else if (!colecaoSelected.equals(other.colecaoSelected)) {
			return false;
		}
		if (corCodigo == null) {
			if (other.corCodigo != null) {
				return false;
			}
		} else if (!corCodigo.equals(other.corCodigo)) {
			return false;
		}
		if (corDescricao == null) {
			if (other.corDescricao != null) {
				return false;
			}
		} else if (!corDescricao.equals(other.corDescricao)) {
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
