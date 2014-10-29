package br.com.golive.entity.grupoprodutos.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import br.com.golive.annotation.Jasper;
import br.com.golive.annotation.Label;
import br.com.golive.entity.Model;
import br.com.golive.entity.auditoria.model.AuditoriaItemModel;

@Entity
@Table(name = "tbgrupoproduto")
@Label(name = "label.gruposDeProdutos")
@Jasper(titulo = "GrupoProdutos", nomeDoArquivoGerado = "file.name.model", nomeArquivoJasper = "GrupoProdutos")
public class GrupoProdutosModel extends Model {

	@Transient
	private static final long serialVersionUID = 8358217535684842127L;

	@Column(name = "GrupoProduto")
	private String grupoDeProduto;

	@Transient
	private List<AuditoriaItemModel> auditoriaLogs;

	public GrupoProdutosModel() {
		super();
	}

	public GrupoProdutosModel(final String grupoDeProduto, final List<AuditoriaItemModel> auditoriaLogs) {
		super();
		this.grupoDeProduto = grupoDeProduto;
		this.auditoriaLogs = auditoriaLogs;
	}

	public String getGrupoDeProduto() {
		return grupoDeProduto;
	}

	public void setGrupoDeProduto(final String grupoDeProduto) {
		this.grupoDeProduto = grupoDeProduto;
	}

	public List<AuditoriaItemModel> getAuditoriaLogs() {
		return auditoriaLogs;
	}

	public void setAuditoriaLogs(final List<AuditoriaItemModel> auditoriaLogs) {
		this.auditoriaLogs = auditoriaLogs;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = (prime * result) + ((auditoriaLogs == null) ? 0 : auditoriaLogs.hashCode());
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
		return "GrupoProdutosModel [grupoDeProduto=" + grupoDeProduto + ", auditoriaLogs=" + auditoriaLogs + "]";
	}

}