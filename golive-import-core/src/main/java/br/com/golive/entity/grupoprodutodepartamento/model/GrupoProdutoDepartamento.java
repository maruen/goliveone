package br.com.golive.entity.grupoprodutodepartamento.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.Transient;

import br.com.golive.annotation.Jasper;
import br.com.golive.annotation.Label;
import br.com.golive.annotation.UniqueEntity;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;

@UniqueEntity
@Table(name = "tbgrupoproduto_tbdepartamentoproduto")
@Label(name = "label.gruposDeProdutos")
@Jasper(titulo = "GrupoProdutos", nomeDoArquivoGerado = "file.name.model", nomeArquivoJasper = "GrupoProdutos")
public class GrupoProdutoDepartamento implements Serializable {

	@Transient
	private static final long serialVersionUID = -847347740085895445L;

	private GrupoProdutoDepartamentoId id;

	@Column(name = "tbGrupoProduto_Id")
	private GrupoProdutosModel grupoProdutosModel;

	@Column(name = "tbDepartamentoProduto_Id")
	private DepartamentoModel departamentoModel;

	public GrupoProdutoDepartamentoId getId() {
		return id;
	}

	public void setId(final GrupoProdutoDepartamentoId id) {
		this.id = id;
	}

	public GrupoProdutosModel getGrupoProdutosModel() {
		return grupoProdutosModel;
	}

	public void setGrupoProdutosModel(final GrupoProdutosModel grupoProdutosModel) {
		this.grupoProdutosModel = grupoProdutosModel;
	}

	public DepartamentoModel getDepartamentoModel() {
		return departamentoModel;
	}

	public void setDepartamentoModel(final DepartamentoModel departamentoModel) {
		this.departamentoModel = departamentoModel;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
