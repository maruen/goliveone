package br.com.golive.entity.padraolargura.model;

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

@Entity
@Table(name = "tbPadroesLarguraProduto")
@Label(name = "label.cadastroPadroesLargura")
@Jasper(titulo = "label.padroesDeLargura", nomeDoArquivoGerado = "file.name.produtopadraolargura", nomeArquivoJasper = "ProdutoPadraoLargura")
public class ProdutoPadraoLarguraModel extends Model {

	@Transient
	private static final long serialVersionUID = 5826624737358328596L;

	@Column(name = "Largura")
	@Label(name = "label.cadastroPadroesLargura.largura")
	private Double largura;

	@Column(name = "LarguraDescricao")
	@Label(name = "label.cadastroPadroesLargura.descricao")
	private String larguraDescricao;
	
	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbPadroesLarguraProduto_tbDepartamentoProduto", joinColumns = @JoinColumn(name = "tbPadroesLarguraProduto_Id", referencedColumnName = "Id"), inverseJoinColumns = @JoinColumn(name = "tbDepartamentoProduto_Id", referencedColumnName = "Id"))
	private DepartamentoModel departamentoSelected;

	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbPadroesLarguraProduto_tbGrupoProduto", joinColumns = @JoinColumn(name = "tbPadroesLarguraProduto_Id", referencedColumnName = "Id"), inverseJoinColumns = 
	@JoinColumn(name = "tbGrupoProduto", referencedColumnName = "Id"))
	private GrupoProdutosModel grupoProdutoSelected;

	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbPadroesLarguraProduto_tbSubGrupoProduto", joinColumns = @JoinColumn(name = "tbPadroesLarguraProduto_Id", referencedColumnName = "Id"), inverseJoinColumns = @JoinColumn(name = "tbSubGrupoProduto_Id", referencedColumnName = "Id"))
	private SubGrupoProdutoModel subGrupoProdutoSelected;

	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbPadroesLarguraProduto_tbColecoesProduto", joinColumns = @JoinColumn(name = "tbPadroesLarguraProduto_Id", referencedColumnName = "Id"), inverseJoinColumns = @JoinColumn(name = "tbColecoesProduto_Id", referencedColumnName = "Id"))
	private ColecoesModel colecaoSelected;

	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbPadroesLarguraProduto_tbCorProduto", joinColumns = @JoinColumn(name = "tbPadroesLarguraProduto_Id", referencedColumnName = "Id"), inverseJoinColumns = @JoinColumn(name = "tbCorProduto_Id", referencedColumnName = "Id"))
	private CorProdutoModel corProdutoSelected;

	public ProdutoPadraoLarguraModel() {
		super();
	}

	public ProdutoPadraoLarguraModel(Long id, Calendar dataInclusao,
			Calendar dataAlteracao) {
		super(id, dataInclusao, dataAlteracao);
	}

	public ProdutoPadraoLarguraModel(Double largura, String larguraDescricao,
			DepartamentoModel departamentoSelected,
			GrupoProdutosModel grupoProdutoSelected,
			SubGrupoProdutoModel subGrupoProdutoSelected,
			ColecoesModel colecaoSelected, CorProdutoModel corProdutoSelected) {
		super();
		this.largura = largura;
		this.larguraDescricao = larguraDescricao;
		this.departamentoSelected = departamentoSelected;
		this.grupoProdutoSelected = grupoProdutoSelected;
		this.subGrupoProdutoSelected = subGrupoProdutoSelected;
		this.colecaoSelected = colecaoSelected;
		this.corProdutoSelected = corProdutoSelected;
	}

	public Double getLargura() {
		return largura;
	}

	public void setLargura(Double largura) {
		this.largura = largura;
	}

	public String getLarguraDescricao() {
		return larguraDescricao;
	}

	public void setLarguraDescricao(String larguraDescricao) {
		this.larguraDescricao = larguraDescricao;
	}

	public DepartamentoModel getDepartamentoSelected() {
		return departamentoSelected;
	}

	public void setDepartamentoSelected(DepartamentoModel departamentoSelected) {
		this.departamentoSelected = departamentoSelected;
	}

	public GrupoProdutosModel getGrupoProdutoSelected() {
		return grupoProdutoSelected;
	}

	public void setGrupoProdutoSelected(GrupoProdutosModel grupoProdutoSelected) {
		this.grupoProdutoSelected = grupoProdutoSelected;
	}

	public SubGrupoProdutoModel getSubGrupoProdutoSelected() {
		return subGrupoProdutoSelected;
	}

	public void setSubGrupoProdutoSelected(
			SubGrupoProdutoModel subGrupoProdutoSelected) {
		this.subGrupoProdutoSelected = subGrupoProdutoSelected;
	}

	public ColecoesModel getColecaoSelected() {
		return colecaoSelected;
	}

	public void setColecaoSelected(ColecoesModel colecaoSelected) {
		this.colecaoSelected = colecaoSelected;
	}

	public CorProdutoModel getCorProdutoSelected() {
		return corProdutoSelected;
	}

	public void setCorProdutoSelected(CorProdutoModel corProdutoSelected) {
		this.corProdutoSelected = corProdutoSelected;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result
				+ ((colecaoSelected == null) ? 0 : colecaoSelected.hashCode());
		result = prime
				* result
				+ ((corProdutoSelected == null) ? 0 : corProdutoSelected
						.hashCode());
		result = prime
				* result
				+ ((departamentoSelected == null) ? 0 : departamentoSelected
						.hashCode());
		result = prime
				* result
				+ ((grupoProdutoSelected == null) ? 0 : grupoProdutoSelected
						.hashCode());
		result = prime * result + ((largura == null) ? 0 : largura.hashCode());
		result = prime
				* result
				+ ((larguraDescricao == null) ? 0 : larguraDescricao.hashCode());
		result = prime
				* result
				+ ((subGrupoProdutoSelected == null) ? 0
						: subGrupoProdutoSelected.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		ProdutoPadraoLarguraModel other = (ProdutoPadraoLarguraModel) obj;
		if (colecaoSelected == null) {
			if (other.colecaoSelected != null)
				return false;
		} else if (!colecaoSelected.equals(other.colecaoSelected))
			return false;
		if (corProdutoSelected == null) {
			if (other.corProdutoSelected != null)
				return false;
		} else if (!corProdutoSelected.equals(other.corProdutoSelected))
			return false;
		if (departamentoSelected == null) {
			if (other.departamentoSelected != null)
				return false;
		} else if (!departamentoSelected.equals(other.departamentoSelected))
			return false;
		if (grupoProdutoSelected == null) {
			if (other.grupoProdutoSelected != null)
				return false;
		} else if (!grupoProdutoSelected.equals(other.grupoProdutoSelected))
			return false;
		if (largura == null) {
			if (other.largura != null)
				return false;
		} else if (!largura.equals(other.largura))
			return false;
		if (larguraDescricao == null) {
			if (other.larguraDescricao != null)
				return false;
		} else if (!larguraDescricao.equals(other.larguraDescricao))
			return false;
		if (subGrupoProdutoSelected == null) {
			if (other.subGrupoProdutoSelected != null)
				return false;
		} else if (!subGrupoProdutoSelected
				.equals(other.subGrupoProdutoSelected))
			return false;
		return true;
	}
}