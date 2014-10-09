package br.com.golive.entity.finalidadepadraoespessura;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;

@Data
@EqualsAndHashCode(callSuper = false)
@Jasper(titulo = "FinalidadePadraoEspessura", 
		nomeDoArquivoGerado = "FinalidadePadraoEspessura", 
		nomeArquivoJasper = "FinalidadePadraoEspessura")	
public class FinalidadePadraoEspessuraModel {
	private Long id;
	private Date dataInclusao;
	private Date dataAlteracao;
	private String finalidadePadraoEspessura;
	private String idUnidade;
	private String abreviacaoUnidade;
	private String unidade;
	
	public FinalidadePadraoEspessuraModel(){
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}
	
	public FinalidadePadraoEspessuraModel(Long id, 
										  Date dataInclusao,
										  Date dataAlteracao,
										  String finalidadePadraoEspessura,
										  String idUnidade,
										  String abreviacaoUnidade,
										  String unidade){
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.finalidadePadraoEspessura = finalidadePadraoEspessura;
		this.idUnidade = idUnidade;
		this.abreviacaoUnidade = abreviacaoUnidade;
		this.unidade = unidade;
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

	public String getFinalidadePadraoEspessura() {
		return finalidadePadraoEspessura;
	}

	public void setFinalidadePadraoEspessura(String finalidadePadraoEspessura) {
		this.finalidadePadraoEspessura = finalidadePadraoEspessura;
	}

	public String getIdUnidade() {
		return idUnidade;
	}

	public void setIdUnidade(String idUnidade) {
		this.idUnidade = idUnidade;
	}

	public String getAbreviacaoUnidade() {
		return abreviacaoUnidade;
	}

	public void setAbreviacaoUnidade(String abreviacaoUnidade) {
		this.abreviacaoUnidade = abreviacaoUnidade;
	}

	public String getUnidade() {
		return unidade;
	}

	public void setUnidade(String unidade) {
		this.unidade = unidade;
	}
}
