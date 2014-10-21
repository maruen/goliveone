package br.com.golive.entity.empresas.regioes.paises.codigopaises.iso.model;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "PaisesIso",
		nomeDoArquivoGerado = "PaisesIso",
		nomeArquivoJasper = "PaisesIso")
public class PaisesIsoModel extends Model{
	
	private static final long serialVersionUID = 1L;
	private String iso;
	private String paisPortugues;
	private String paisIngles;
	private String paisNativo;
	
	public PaisesIsoModel(){
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}
	
	public PaisesIsoModel(Long id,
						  Calendar dataInclusao,
						  Calendar dataAlteracao,
						  String iso,
						  String paisPortugues,
						  String paisIngles,
						  String paisNativo){
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.iso = iso;
		this.paisPortugues = paisPortugues;
		this.paisIngles = paisIngles;
		this.paisNativo = paisNativo;
	}
	
	public String getIso() {
		return iso;
	}

	public void setIso(String iso) {
		this.iso = iso;
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
