package br.com.golive.entity.colecoes.model;

import java.util.List;

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
import br.com.golive.annotation.Jasper;
import br.com.golive.annotation.Label;
import br.com.golive.annotation.LogList;
import br.com.golive.entity.Model;
import br.com.golive.entity.auditoria.model.AuditoriaModel;
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
	private static final long serialVersionUID = 8262343137488255304L;

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

	@LogList
	@Transient
	private List<AuditoriaModel> auditoriaLogs;

	public ColecoesModel() {
		super();
	}

	public ColecoesModel(final String colecao, final GrupoProdutosModel grupoProdutoSelected, final DepartamentoModel departamentoSelected, final SubGrupoProdutoModel subGrupoProdutoSelected, final List<AuditoriaModel> auditoriaLogs) {
		super();
		this.colecao = colecao;
		this.grupoProdutoSelected = grupoProdutoSelected;
		this.departamentoSelected = departamentoSelected;
		this.subGrupoProdutoSelected = subGrupoProdutoSelected;
		this.auditoriaLogs = auditoriaLogs;
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
		if (auditoriaLogs == null) {
			if (other.auditoriaLogs != null) {
				return false;
			}
		} else if (!auditoriaLogs.equals(other.auditoriaLogs)) {
			return false;
		}
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = (prime * result) + ((auditoriaLogs == null) ? 0 : auditoriaLogs.hashCode());
		result = (prime * result) + ((colecao == null) ? 0 : colecao.hashCode());
		result = (prime * result) + ((departamentoSelected == null) ? 0 : departamentoSelected.hashCode());
		result = (prime * result) + ((grupoProdutoSelected == null) ? 0 : grupoProdutoSelected.hashCode());
		result = (prime * result) + ((subGrupoProdutoSelected == null) ? 0 : subGrupoProdutoSelected.hashCode());
		return result;
	}

}