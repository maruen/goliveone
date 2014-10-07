package br.com.golive.entity.subgrupoprodutos;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;

@Data
@EqualsAndHashCode(callSuper=false)
@Jasper(titulo="SubGrupoProdutos",
		nomeDoArquivoGerado="SubGrupoProdutos",
		nomeArquivoJasper ="SubGrupoProdutos")

public class SubGrupoProdutosModel {
	
	private Long 		 id;
	private Date 		 dataInclusao; 
	private Date 		 dataAlteracao;	
	private String 		 departamento;
	private String 		 descricaoProduto;

	public SubGrupoProdutosModel() {
		this.dataInclusao 	= new Date();
		this.dataAlteracao 	= new Date();
	}
	
	public SubGrupoProdutosModel(Long id, Date dataInclusao, Date dataAlteracao) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
	}
}