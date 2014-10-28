package br.com.golive.entity.grupoprodutos.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import br.com.golive.annotation.Jasper;
import br.com.golive.annotation.Label;
import br.com.golive.annotation.QueryAuditoria;
import br.com.golive.entity.Model;

@Entity
@Table(name = "tbgrupoproduto")
@Label(name = "label.gruposDeProdutos")
@QueryAuditoria(query = "INSERT INTO tbauditoria_tbgrupoproduto VALUES (?,?,?,?)")
@Jasper(titulo = "GrupoProdutos", nomeDoArquivoGerado = "file.name.model", nomeArquivoJasper = "GrupoProdutos")
public class GrupoProdutosModel extends Model {

	@Transient
	private static final long serialVersionUID = 3207826601684568970L;

	@Column(name = "GrupoProduto")
	private String grupoDeProduto;

	public GrupoProdutosModel() {
		super();
	}

	public GrupoProdutosModel(final String grupoDeProduto) {
		super();
		this.grupoDeProduto = grupoDeProduto;
	}

	public String getGrupoDeProduto() {
		return grupoDeProduto;
	}

	public void setGrupoDeProduto(final String grupoDeProduto) {
		this.grupoDeProduto = grupoDeProduto;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
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
		return "GrupoProdutosModel [grupoDeProduto=" + grupoDeProduto + "]";
	}

}