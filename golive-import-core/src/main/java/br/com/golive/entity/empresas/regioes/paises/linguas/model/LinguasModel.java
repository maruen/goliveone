package br.com.golive.entity.empresas.regioes.paises.linguas.model;

import java.util.Date;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "Linguas",
		nomeDoArquivoGerado = "Linguas",
		nomeArquivoJasper = "Linguas")
public class LinguasModel extends Model {

	private static final long serialVersionUID = 1L;

	private String iso;
	private String linguaPortugues;
	private String linguaIngles;
	private String linguaNativo;
	
	public LinguasModel(){
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}

	public LinguasModel(Long id, 
						Date dataInclusao, 
						Date dataAlteracao,
						String iso, 
						String linguaPortugues, 
						String linguaIngles,
						String linguaNativo) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.iso = iso;
		this.linguaPortugues = linguaPortugues;
		this.linguaIngles = linguaIngles;
		this.linguaNativo = linguaNativo;
	}

	public String getIso() {
		return iso;
	}

	public void setIso(String iso) {
		this.iso = iso;
	}

	public String getLinguaPortugues() {
		return linguaPortugues;
	}

	public void setLinguaPortugues(String linguaPortugues) {
		this.linguaPortugues = linguaPortugues;
	}

	public String getLinguaIngles() {
		return linguaIngles;
	}

	public void setLinguaIngles(String linguaIngles) {
		this.linguaIngles = linguaIngles;
	}

	public String getLinguaNativo() {
		return linguaNativo;
	}

	public void setLinguaNativo(String linguaNativo) {
		this.linguaNativo = linguaNativo;
	}
}
