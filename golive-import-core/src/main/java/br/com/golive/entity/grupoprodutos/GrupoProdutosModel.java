package br.com.golive.entity.grupoprodutos;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;

@Data
@EqualsAndHashCode(callSuper=false)
@Jasper(titulo="GrupoProdutos",
		nomeDoArquivoGerado="GrupoProdutos",
		nomeArquivoJasper ="GrupoProdutos")

public class GrupoProdutosModel {
	
	private Long 		 id;
	private Date 		 dataInclusao; 
	private Date 		 dataAlteracao;	
	private String 		 departamento;
	private String 		 descricaoProduto;

	public GrupoProdutosModel() {
		this.dataInclusao 	= new Date();
		this.dataAlteracao 	= new Date();
	}
	
	public GrupoProdutosModel(Long id, Date dataInclusao, Date dataAlteracao) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
	}
}