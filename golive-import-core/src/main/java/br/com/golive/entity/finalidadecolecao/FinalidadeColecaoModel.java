package br.com.golive.entity.finalidadecolecao;

import java.util.Date;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "FinalidadeColecao", 
		nomeDoArquivoGerado = "file.name.model", 
		nomeArquivoJasper = "FinalidadeColecao")


public class FinalidadeColecaoModel extends Model{

	private static final long serialVersionUID = 1L;

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
