package br.com.golive.entity.empresas.regioes.paises.paisesmoedas;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;

@Data
@EqualsAndHashCode(callSuper = false)
@Jasper(titulo = "PaisesMoedas",
		nomeDoArquivoGerado = "PaisesMoedas",
		nomeArquivoJasper = "PaisesMoedas")
public class PaisesMoedasModel {
	private Long id;
	private Date dataInclusao;
	private Date dataAlteracao;
	private String iso;
	private String moeda;
	private String idPais;
	private String paisPortugues;
	private String paisIngles;
	private String paisNativo;
	
	public PaisesMoedasModel(){
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}

	public PaisesMoedasModel(Long id, 
							 Date dataInclusao, 
							 Date dataAlteracao,
							 String iso, 
							 String moeda, 
							 String idPais, 
							 String paisPortugues,
							 String paisIngles, 
							 String paisNativo) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.iso = iso;
		this.moeda = moeda;
		this.idPais = idPais;
		this.paisPortugues = paisPortugues;
		this.paisIngles = paisIngles;
		this.paisNativo = paisNativo;
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

	public String getMoeda() {
		return moeda;
	}

	public void setMoeda(String moeda) {
		this.moeda = moeda;
	}

	public String getIdPais() {
		return idPais;
	}

	public void setIdPais(String idPais) {
		this.idPais = idPais;
	}

	public String getPaisPortugues() {
		return paisPortugues;
	}

	public void setPaisPortugues(String paisPortugues) {
		this.paisPortugues = paisPortugues;
	}

	public String getPaisIngles() {
		return paisIngles;
	}

	public void setPaisIngles(String paisIngles) {
		this.paisIngles = paisIngles;
	}

	public String getPaisNativo() {
		return paisNativo;
	}

	public void setPaisNativo(String paisNativo) {
		this.paisNativo = paisNativo;
	}
}
