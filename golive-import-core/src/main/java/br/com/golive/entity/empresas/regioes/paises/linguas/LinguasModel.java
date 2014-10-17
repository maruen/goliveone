package br.com.golive.entity.empresas.regioes.paises.linguas;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;

@Data
@EqualsAndHashCode(callSuper = false)
@Jasper(titulo = "Linguas",
		nomeDoArquivoGerado = "Linguas",
		nomeArquivoJasper = "Linguas")
public class LinguasModel {
	private Long id;
	private Date dataInclusao;
	private Date dataAlteracao;
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
