package br.com.golive.entity.padraoespessura.model;

import java.util.Calendar;

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
import br.com.golive.entity.colecoes.model.ColecoesModel;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.especialidades.model.CorProdutoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.entity.unidade.model.UnidadeModel;

@Entity
@Table(name = "tbPadroesEspessuraProduto")
@Label(name = "label.cadastroPadroesEspessura")
@Jasper(titulo = "PadroesEspessura", nomeDoArquivoGerado = "file.name.model", nomeArquivoJasper = "PadroesEspessura")
public class ProdutoPadraoEspessuraModel extends Model {

	@Transient
	private static final long serialVersionUID = -2112619714388213343L;

	@Column(name = "Espessura")
	private Double espessura;

	@Column(name = "EspessuraDescricao")
	private String espessuraDescricao;

	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbPadroesEspessuraProduto_tbDepartamento", joinColumns = @JoinColumn(name = "tbPadroesEspessurasProduto_Id", referencedColumnName = "Id"), inverseJoinColumns = @JoinColumn(name = "tbDepartamentoProduto_Id", referencedColumnName = "Id"))
	private DepartamentoModel departamentoSelected;

	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbPadroesEspessuraProduto_tbGrupoProduto", joinColumns = @JoinColumn(name = "tbPadroesEspessuraProduto_Id", referencedColumnName = "Id"), inverseJoinColumns = @JoinColumn(name = "tbGrupoProduto_Id", referencedColumnName = "Id"))
	private GrupoProdutosModel grupoProdutoSelected;

	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbPadroesEspessuraProduto_tbSubGrupoProduto", joinColumns = @JoinColumn(name = "tbPadroesEspessuraProduto_Id", referencedColumnName = "Id"), inverseJoinColumns = @JoinColumn(name = "tbSubGrupoProduto_Id", referencedColumnName = "Id"))
	private SubGrupoProdutoModel subGrupoProdutoSelected;

	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbPadroesEspessuraProduto_tbColecoesProduto", joinColumns = @JoinColumn(name = "tbPadroesEspessuraProduto_Id", referencedColumnName = "Id"), inverseJoinColumns = @JoinColumn(name = "tbColecoesProduto_Id", referencedColumnName = "Id"))
	private ColecoesModel colecaoSelected;

	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbPadroesEspessuraProduto_tbCorProduto", joinColumns = @JoinColumn(name = "tbPadoresEspessuraProduto_Id", referencedColumnName = "Id"), inverseJoinColumns = @JoinColumn(name = "tbCorProduto_Id", referencedColumnName = "Id"))
	private CorProdutoModel corProdutoSelected;

	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbPadroesEspessuraProduto_tbUnidade", joinColumns = @JoinColumn(name = "tbPadroesEspessuraProduto_Id", referencedColumnName = "Id"), inverseJoinColumns = @JoinColumn(name = "tbUnidade_Id", referencedColumnName = "Id"))
	private UnidadeModel unidadeSelected;

	public ProdutoPadraoEspessuraModel() {
		super();
	}

	public ProdutoPadraoEspessuraModel(final Long id, final Calendar dataInclusao, final Calendar dataAlteracao) {
		super(id, dataInclusao, dataAlteracao);
	}

	public ProdutoPadraoEspessuraModel(final Double espessura, final String espessuraDescricao, final DepartamentoModel departamentoSelected, final GrupoProdutosModel grupoProdutoSelected, final SubGrupoProdutoModel subGrupoProdutoSelected, final ColecoesModel colecaoSelected, final CorProdutoModel corProdutoSelected, final UnidadeModel unidadeSelected) {
		super();
		this.espessura = espessura;
		this.espessuraDescricao = espessuraDescricao;
		this.departamentoSelected = departamentoSelected;
		this.grupoProdutoSelected = grupoProdutoSelected;
		this.subGrupoProdutoSelected = subGrupoProdutoSelected;
		this.colecaoSelected = colecaoSelected;
		this.corProdutoSelected = corProdutoSelected;
		this.unidadeSelected = unidadeSelected;
	}

	public Double getEspessura() {
		return espessura;
	}

	public void setEspessura(final Double espessura) {
		this.espessura = espessura;
	}

	public String getEspessuraDescricao() {
		return espessuraDescricao;
	}

	public void setEspessuraDescricao(final String espessuraDescricao) {
		this.espessuraDescricao = espessuraDescricao;
	}

	public DepartamentoModel getDepartamentoSelected() {
		return departamentoSelected;
	}

	public void setDepartamentoSelected(final DepartamentoModel departamentoSelected) {
		this.departamentoSelected = departamentoSelected;
	}

	public GrupoProdutosModel getGrupoProdutoSelected() {
		return grupoProdutoSelected;
	}

	public void setGrupoProdutoSelected(final GrupoProdutosModel grupoProdutoSelected) {
		this.grupoProdutoSelected = grupoProdutoSelected;
	}

	public SubGrupoProdutoModel getSubGrupoProdutoSelected() {
		return subGrupoProdutoSelected;
	}

	public void setSubGrupoProdutoSelected(final SubGrupoProdutoModel subGrupoProdutoSelected) {
		this.subGrupoProdutoSelected = subGrupoProdutoSelected;
	}

	public ColecoesModel getColecaoSelected() {
		return colecaoSelected;
	}

	public void setColecaoSelected(final ColecoesModel colecaoSelected) {
		this.colecaoSelected = colecaoSelected;
	}

	public CorProdutoModel getCorProdutoSelected() {
		return corProdutoSelected;
	}

	public void setCorProdutoSelected(final CorProdutoModel corProdutoSelected) {
		this.corProdutoSelected = corProdutoSelected;
	}

	public UnidadeModel getUnidadeSelected() {
		return unidadeSelected;
	}

	public void setUnidadeSelected(final UnidadeModel unidadeSelected) {
		this.unidadeSelected = unidadeSelected;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = (prime * result) + ((colecaoSelected == null) ? 0 : colecaoSelected.hashCode());
		result = (prime * result) + ((corProdutoSelected == null) ? 0 : corProdutoSelected.hashCode());
		result = (prime * result) + ((departamentoSelected == null) ? 0 : departamentoSelected.hashCode());
		result = (prime * result) + ((espessura == null) ? 0 : espessura.hashCode());
		result = (prime * result) + ((espessuraDescricao == null) ? 0 : espessuraDescricao.hashCode());
		result = (prime * result) + ((grupoProdutoSelected == null) ? 0 : grupoProdutoSelected.hashCode());
		result = (prime * result) + ((subGrupoProdutoSelected == null) ? 0 : subGrupoProdutoSelected.hashCode());
		result = (prime * result) + ((unidadeSelected == null) ? 0 : unidadeSelected.hashCode());
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
		final ProdutoPadraoEspessuraModel other = (ProdutoPadraoEspessuraModel) obj;
		if (colecaoSelected == null) {
			if (other.colecaoSelected != null) {
				return false;
			}
		} else if (!colecaoSelected.equals(other.colecaoSelected)) {
			return false;
		}
		if (corProdutoSelected == null) {
			if (other.corProdutoSelected != null) {
				return false;
			}
		} else if (!corProdutoSelected.equals(other.corProdutoSelected)) {
			return false;
		}
		if (departamentoSelected == null) {
			if (other.departamentoSelected != null) {
				return false;
			}
		} else if (!departamentoSelected.equals(other.departamentoSelected)) {
			return false;
		}
		if (espessura == null) {
			if (other.espessura != null) {
				return false;
			}
		} else if (!espessura.equals(other.espessura)) {
			return false;
		}
		if (espessuraDescricao == null) {
			if (other.espessuraDescricao != null) {
				return false;
			}
		} else if (!espessuraDescricao.equals(other.espessuraDescricao)) {
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
		if (unidadeSelected == null) {
			if (other.unidadeSelected != null) {
				return false;
			}
		} else if (!unidadeSelected.equals(other.unidadeSelected)) {
			return false;
		}
		return true;
	}

}
