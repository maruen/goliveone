package br.com.golive.entity.empresas.regioes.paises.codigopaises.fips;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;

@Data
@EqualsAndHashCode(callSuper = false)
@Jasper(titulo = "PaisesFips",
		nomeDoArquivoGerado = "PaisesFips",
		nomeArquivoJasper = "PaisesFips")
public class PaisesFipsModel {
	private Long id;
	private Date dataInclusao;
	private Date dataAlteracao;
	private String fips;
	private String paisPortugues;
	private String paisIngles;
	private String paisNativo;
	
	public PaisesFipsModel(){
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}
	
	public PaisesFipsModel(Long id,
								 Date dataInclusao,
								 Date dataAlteracao,
								 String fips,
								 String paisPortugues,
								 String paisIngles,
								 String paisNativo){
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.fips = fips;
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

	public String getFips() {
		return fips;
	}

	public void setFips(String fips) {
		this.fips = fips;
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
