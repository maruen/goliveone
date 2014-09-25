package br.com.golive.entity.produto;

import java.util.Date;
import java.util.List;

import br.com.golive.annotation.Jasper;
import lombok.Data;
import lombok.EqualsAndHashCode;


@Data
@EqualsAndHashCode(callSuper=false)
@Jasper(titulo="Produto",
		nomeDoArquivoGerado="Produto",
		nomeArquivoJasper ="Produto"
		)

public class ProdutoModel {
	
	private Long 		 id;
	private Date 		 dataInclusao; 
	private Date 		 dataAlteracao;	
	private Long 		 codigoProduto;
	private String 		 descricaoProduto;
	private List<String> unidades;
	private List<String> codigos;
	private List<String> descricoes;
	private List<String> colecoes;
	private List<String> codigoBarras;
	private List<String> cores;
	private List<String> padraoLargura;
	private List<String> padraoEspessura;

	public ProdutoModel() {
		this.dataInclusao 	= new Date();
		this.dataAlteracao 	= new Date();
	}
	
	public ProdutoModel(Long id, Date dataInclusao, Date dataAlteracao) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
	}

	
}
