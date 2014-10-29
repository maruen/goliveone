package br.com.golive.entity.grupoprodutodepartamento.model;

import java.io.Serializable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import br.com.golive.annotation.Jasper;
import br.com.golive.annotation.Label;
import br.com.golive.annotation.UniqueEntity;

@Entity
@UniqueEntity
@Table(name = "tbgrupoproduto_tbdepartamentoproduto")
@Label(name = "label.gruposDeProdutos")
@Jasper(titulo = "GrupoProdutos", nomeDoArquivoGerado = "file.name.model", nomeArquivoJasper = "GrupoProdutos")
public class GrupoProdutoDepartamento implements Serializable {

	@Transient
	private static final long serialVersionUID = -1899362629719060525L;

	@EmbeddedId
	private GrupoProdutoDepartamentoId id;

	public GrupoProdutoDepartamentoId getId() {
		return id;
	}

	public void setId(final GrupoProdutoDepartamentoId id) {
		this.id = id;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
