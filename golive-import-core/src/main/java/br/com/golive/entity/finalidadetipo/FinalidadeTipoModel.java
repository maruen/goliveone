package br.com.golive.entity.finalidadetipo;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;

@Data
@EqualsAndHashCode(callSuper = false)
@Jasper(titulo = "FinalidadeTipo",
		nomeDoArquivoGerado = "file.name.model",
		nomeArquivoJasper = "FinalidadeTipo")
public class FinalidadeTipoModel {
	private Long id;
	private Date dataInclusao;
	private Date dataAlteracao;
	private String finalidadeTipoProduto;
	private String numMinCaracteres;
	private String numMaxCaracteres;
	
	public FinalidadeTipoModel(){
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}
	
	public FinalidadeTipoModel(Long id,
									  Date dataInclusao,
									  Date dataAlteracao,
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

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getDataInclusao() {
		return dataInclusao;
	}

	public void setDataInclusao(Date dataInclusao) {
		this.dataInclusao = dataInclusao;
	}

	public Date getDataAlteracao() {
		return dataAlteracao;
	}

	public void setDataAlteracao(Date dataAlteracao) {
		this.dataAlteracao = dataAlteracao;
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
