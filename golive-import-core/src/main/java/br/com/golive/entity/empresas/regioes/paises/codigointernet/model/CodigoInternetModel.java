package br.com.golive.entity.empresas.regioes.paises.codigointernet.model;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Data
@EqualsAndHashCode(callSuper = false)
@Jasper(titulo = "CodigoInternet",
		nomeDoArquivoGerado = "CodigoInternet",
		nomeArquivoJasper = "CodigoInternet")
public class CodigoInternetModel extends Model{
	
	private static final long serialVersionUID = 1L;
	
	
	private String codigoTld;
	private String paisPortugues;
	private String paisIngles;
	private String paisNativo;
	
	public CodigoInternetModel(){
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}
	
	public CodigoInternetModel(Long id,
							   Date dataInclusao,
							   Date dataAlteracao,
							   String codigoTld,
							   String paisPortugues,
							   String paisIngles,
							   String paisNativo){
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.codigoTld = codigoTld;
		this.paisPortugues = paisPortugues;
		this.paisIngles = paisIngles;
		this.paisNativo = paisNativo;
	}
	
	public String getCodigoTld() {
		return codigoTld;
	}

	public void setCodigoTld(String codigoTld) {
		this.codigoTld = codigoTld;
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
