package br.com.golive.entity.finalidadeunidade;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;

@Data
@EqualsAndHashCode(callSuper = false)
@Jasper(titulo = "FinalidadeUnidade", 
		nomeDoArquivoGerado = "FinalidadeUnidade", 
		nomeArquivoJasper = "FinalidadeUnidade")
public class FinalidadeUnidadeModel {
	private Long id;
	private Date dataAlteracao;
	private Date dataInclusao;
	private String finalidadeUnidadeProduto;
	private String numMinCaracteres;
	private String numMaxCaracteres;
	
	public FinalidadeUnidadeModel(){
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}
	
	public FinalidadeUnidadeModel(Long id, 
								  Date dataInclusao, 
								  Date dataAlteracao, 
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
