package br.com.golive.entity.grupoprodutos.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import br.com.golive.annotation.Jasper;
import br.com.golive.annotation.Label;
import br.com.golive.annotation.LogList;
import br.com.golive.entity.Model;
import br.com.golive.entity.auditoria.model.AuditoriaModel;
import br.com.golive.entity.departamento.model.DepartamentoModel;

@Entity
@Table(name = "tbGrupoProduto")
@Label(name = "label.gruposDeProdutos")
@Jasper(titulo = "GrupoProdutos", nomeDoArquivoGerado = "file.name.model", nomeArquivoJasper = "GrupoProdutos")
public class GrupoProdutosModel extends Model {

	@Transient
	private static final long serialVersionUID = 8358217535684842127L;

	@Column(name = "GrupoProduto")
	private String grupoDeProduto;

	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbgrupoproduto_tbdepartamentoproduto", joinColumns = @JoinColumn(name = "tbGrupoProduto_Id", referencedColumnName = "Id"), inverseJoinColumns = @JoinColumn(name = "tbDepartamentoProduto_Id", referencedColumnName = "Id"))
	private DepartamentoModel departamentoModel;

	@LogList
	@OneToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "tbauditoria_tbgrupoproduto", joinColumns = @JoinColumn(name = "tbGrupoProduto", referencedColumnName = "Id"), inverseJoinColumns = @JoinColumn(name = "tbAuditoria_Id", referencedColumnName = "Id"))
	private List<AuditoriaModel> auditoriaLogs;

	public GrupoProdutosModel() {
		super();
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

	public List<AuditoriaModel> getAuditoriaLogs() {
		return auditoriaLogs;
	}

	public void setAuditoriaLogs(final List<AuditoriaModel> auditoriaLogs) {
		this.auditoriaLogs = auditoriaLogs;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = (prime * result) + ((auditoriaLogs == null) ? 0 : auditoriaLogs.hashCode());
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
		if (auditoriaLogs == null) {
			if (other.auditoriaLogs != null) {
				return false;
			}
		} else if (!auditoriaLogs.equals(other.auditoriaLogs)) {
			return false;
		}
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

	@Override
	public String toString() {
		return "GrupoProdutosModel [grupoDeProduto=" + grupoDeProduto + ", departamentoModel=" + departamentoModel + ", auditoriaLogs=" + auditoriaLogs + "]";
	}

}