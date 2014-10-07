package br.com.golive.entity.colecoes;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;

@Data
@EqualsAndHashCode(callSuper=false)
@Jasper(titulo="Colecoes",
		nomeDoArquivoGerado="Colecoes",
		nomeArquivoJasper ="Colecoes")

public class ColecoesModel {
	
	private Long 		 id;
	private Date 		 dataInclusao; 
	private Date 		 dataAlteracao;	
	private String 		 departamento;
	private String 		 descricaoProduto;

	public ColecoesModel() {
		this.dataInclusao 	= new Date();
		this.dataAlteracao 	= new Date();
	}
	
	public ColecoesModel(Long id, Date dataInclusao, Date dataAlteracao) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
	}
}