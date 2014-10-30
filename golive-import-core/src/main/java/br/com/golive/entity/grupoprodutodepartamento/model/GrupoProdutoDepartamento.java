package br.com.golive.entity.grupoprodutodepartamento.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;
import br.com.golive.annotation.Jasper;
import br.com.golive.annotation.Label;
import br.com.golive.annotation.UniqueEntity;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;

@UniqueEntity
@Table(name = "tbGrupoProduto_tbDepartamentoProduto")
@Label(name = "label.gruposDeProdutos")
@Jasper(titulo = "GrupoProdutos", nomeDoArquivoGerado = "file.name.model", nomeArquivoJasper = "GrupoProdutos")
@Data
public class GrupoProdutoDepartamento implements Serializable {

	@Transient
	private static final long serialVersionUID = -847347740085895445L;

	private GrupoProdutoDepartamentoId id;

	@Column(name = "tbGrupoProduto_Id")
	private GrupoProdutosModel grupoProdutosModel;

	@Column(name = "tbDepartamentoProduto_Id")
	private DepartamentoModel departamentoModel;

	

}
