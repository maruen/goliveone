package br.com.golive.entity.finalidadecolecao;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;

@Data
@EqualsAndHashCode(callSuper = false)
@Jasper(titulo = "FinalidadeColecao", 
		nomeDoArquivoGerado = "FinalideadeColecao", 
		nomeArquivoJasper = "FinalidadeColecao")
public class FinalidadeColecaoModel {
	private Long id;
	private Date dataAlteracao;
	private Date dataInclusao;
	private String finalidadeColecaoProduto;
	private String numMinimoCaracteres;
	private String numMaximoCaracteres;
	
	public FinalidadeColecaoModel(){
		this.dataAlteracao = new Date();
		this.dataInclusao = new Date();
	}
	
	public FinalidadeColecaoModel(Long id, 
								  Date dataAlteracao, 
								  Date dataInclusao, 
								  String finalidadeColecaoProduto, 
								  String numMinimoCaracteres, 
								  String numMaximoCaracteres){
		super();
		this.id = id;
		this.dataAlteracao = dataAlteracao;
		this.dataInclusao = dataInclusao;
		this.finalidadeColecaoProduto = finalidadeColecaoProduto;
		this.numMinimoCaracteres = numMinimoCaracteres;
		this.numMaximoCaracteres = numMaximoCaracteres;		
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getDataAlteracao() {
		return dataAlteracao;
	}

	public void setDataAlteracao(Date dataAlteracao) {
		this.dataAlteracao = dataAlteracao;
	}

	public Date getDataInclusao() {
		return dataInclusao;
	}

	public void setDataInclusao(Date dataInclusao) {
		this.dataInclusao = dataInclusao;
	}

	public String getFinalidadeColecaoProduto() {
		return finalidadeColecaoProduto;
	}

	public void setFinalidadeColecaoProduto(String finalidadeColecaoProduto) {
		this.finalidadeColecaoProduto = finalidadeColecaoProduto;
	}

	public String getNumMinimoCaracteres() {
		return numMinimoCaracteres;
	}

	public void setNumMinimoCaracteres(String numMinimoCaracteres) {
		this.numMinimoCaracteres = numMinimoCaracteres;
	}

	public String getNumMaximoCaracteres() {
		return numMaximoCaracteres;
	}

	public void setNumMaximoCaracteres(String numMaximoCaracteres) {
		this.numMaximoCaracteres = numMaximoCaracteres;
	}
}
