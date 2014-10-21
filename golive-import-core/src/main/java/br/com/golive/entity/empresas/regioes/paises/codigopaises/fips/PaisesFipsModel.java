package br.com.golive.entity.empresas.regioes.paises.codigopaises.fips;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "PaisesFips",
		nomeDoArquivoGerado = "PaisesFips",
		nomeArquivoJasper = "PaisesFips")
public class PaisesFipsModel extends Model {

	private static final long serialVersionUID = 1L;
	
	private String fips;
	private String paisPortugues;
	private String paisIngles;
	private String paisNativo;
	
	public PaisesFipsModel(){
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}
	
	public PaisesFipsModel(Long id,
								 Calendar dataInclusao,
								 Calendar dataAlteracao,
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
