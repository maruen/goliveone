package br.com.golive.entity.finalidadeunidade;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "FinalidadeUnidade", 
		nomeDoArquivoGerado = "file.name.model", 
		nomeArquivoJasper = "FinalidadeUnidade")
public class FinalidadeUnidadeModel extends Model{
	
	private static final long serialVersionUID = 8436973716542827455L;
	
	private String finalidadeUnidadeProduto;
	private String numMinCaracteres;
	private String numMaxCaracteres;
	
	public FinalidadeUnidadeModel(){
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}
	
	public FinalidadeUnidadeModel(Long id, 
								  Calendar dataInclusao, 
								  Calendar dataAlteracao, 
								  String finalidadeUnidadeProduto, 
								  String numMinCaracteres, 
								  String numMaxCaracteres){
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.finalidadeUnidadeProduto = finalidadeUnidadeProduto;
		this.numMinCaracteres = numMinCaracteres;
		this.numMaxCaracteres = numMaxCaracteres;		
	}
	
	public String getFinalidadeUnidadeProduto() {
		return finalidadeUnidadeProduto;
	}

	public void setFinalidadeUnidadeProduto(String finalidadeUnidadeProduto) {
		this.finalidadeUnidadeProduto = finalidadeUnidadeProduto;
	}

	public String getNumMinCaracteres() {
		return numMinCaracteres;
	}

	public void setNumMinCaracteres(String numMinCaracteres) {
		this.numMinCaracteres = numMinCaracteres;
	}

	public String getNumMaxCaracteres() {
		return numMaxCaracteres;
	}

	public void setNumMaxCaracteres(String numMaxCaracteres) {
		this.numMaxCaracteres = numMaxCaracteres;
	}
}
