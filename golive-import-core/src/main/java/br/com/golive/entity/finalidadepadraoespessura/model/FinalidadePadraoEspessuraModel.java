package br.com.golive.entity.finalidadepadraoespessura.model;

import java.util.Date;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "FinalidadePadraoEspessura", 
		nomeDoArquivoGerado = "file.name.model", 
		nomeArquivoJasper = "FinalidadePadraoEspessura")	
public class FinalidadePadraoEspessuraModel extends Model {
	
	private static final long serialVersionUID = 1L;
	
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
		this.finalidadePadraoEspessura = finalidadePadraoEspessura;
		this.idUnidade = idUnidade;
		this.abreviacaoUnidade = abreviacaoUnidade;
		this.unidade = unidade;
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
