package br.com.golive.entity.empresas.regioes.paises.lingua.model;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "Linguas",
		nomeDoArquivoGerado = "Linguas",
		nomeArquivoJasper = "Linguas")
public class LinguaModel extends Model {

	private static final long serialVersionUID = 1L;

	private String iso;
	private String linguaPortugues;
	private String linguaIngles;
	private String linguaNativo;
	
	public LinguaModel(){
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}

	public LinguaModel(Long id, 
						Calendar dataInclusao, 
						Calendar dataAlteracao,
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
