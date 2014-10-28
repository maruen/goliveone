package br.com.golive.entity.grupoprodutodepartamento;

import java.io.Serializable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import br.com.golive.annotation.Jasper;
import br.com.golive.annotation.Label;
import br.com.golive.annotation.UniqueEntity;

@Entity
@Table(name = "tbgrupoproduto_tbdepartamentoproduto")
@Label(name = "label.gruposDeProdutos")
@UniqueEntity
@Jasper(titulo = "GrupoProdutos", nomeDoArquivoGerado = "file.name.model", nomeArquivoJasper = "GrupoProdutos")
public class GrupoProdutoDepartamento implements Serializable {

	@Transient
	private static final long serialVersionUID = 142146404319602044L;

	@EmbeddedId
	private GrupoProdutoDepartamentoId id;

	public GrupoProdutoDepartamento() {
		super();
	}

	public GrupoProdutoDepartamento(final GrupoProdutoDepartamentoId id) {
		super();
		this.id = id;
	}

	public GrupoProdutoDepartamentoId getId() {
		return id;
	}

	public void setId(final GrupoProdutoDepartamentoId id) {
		this.id = id;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = (prime * result) + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(final Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		final GrupoProdutoDepartamento other = (GrupoProdutoDepartamento) obj;
		if (id == null) {
			if (other.id != null) {
				return false;
			}
		} else if (!id.equals(other.id)) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "GrupoProdutoDepartamento [id=" + id + "]";
	}

}
