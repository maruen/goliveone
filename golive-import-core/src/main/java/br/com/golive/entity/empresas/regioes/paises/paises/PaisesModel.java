package br.com.golive.entity.empresas.regioes.paises.paises;

import java.util.Date;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "Paises",
		nomeDoArquivoGerado = "Paises",
		nomeArquivoJasper = "Paises")
public class PaisesModel extends Model {

	private static final long serialVersionUID = 1L;
	
	private String bandeira;
	private String paisIngles;
	private String paisPortugues;
	private String paisNativo;
	
	public PaisesModel(){
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}

	public PaisesModel(Long id,
					   Date dataInclusao,
					   Date dataAlteracao,
					   String bandeira, 
					   String paisIngles,
					   String paisPortugues, 
					   String paisNativo) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.bandeira = bandeira;
		this.paisIngles = paisIngles;
		this.paisPortugues = paisPortugues;
		this.paisNativo = paisNativo;
	}

	public String getBandeira() {
		return bandeira;
	}

	public void setBandeira(String bandeira) {
		this.bandeira = bandeira;
	}

	public String getPaisIngles() {
		return paisIngles;
	}

	public void setPaisIngles(String paisIngles) {
		this.paisIngles = paisIngles;
	}

	public String getPaisPortugues() {
		return paisPortugues;
	}

	public void setPaisPortugues(String paisPortugues) {
		this.paisPortugues = paisPortugues;
	}

	public String getPaisNativo() {
		return paisNativo;
	}

	public void setPaisNativo(String paisNativo) {
		this.paisNativo = paisNativo;
	}
}
