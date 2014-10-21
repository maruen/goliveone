package br.com.golive.entity.finalidadetipo.model;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "FinalidadeTipo",
		nomeDoArquivoGerado = "file.name.model",
		nomeArquivoJasper = "FinalidadeTipo")
public class FinalidadeTipoModel extends Model{
	
	private static final long serialVersionUID = 1L;
	
	
	private String finalidadeTipoProduto;
	private String numMinCaracteres;
	private String numMaxCaracteres;
	
	public FinalidadeTipoModel(){
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}
	
	public FinalidadeTipoModel(Long id,
									  Calendar dataInclusao,
									  Calendar dataAlteracao,
									  String finalidadeTipoProduto,
									  String numMinCaracteres,
									  String numMaxCaracteres){
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.finalidadeTipoProduto = finalidadeTipoProduto;
		this.numMinCaracteres = numMinCaracteres;
		this.numMaxCaracteres = numMaxCaracteres;
	}
	
	public String getFinalidadeTipoProduto() {
		return finalidadeTipoProduto;
	}

	public void setFinalidadeTipoProduto(String finalidadeTipoProduto) {
		this.finalidadeTipoProduto = finalidadeTipoProduto;
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
