package br.com.golive.entity.empresas.regioes.paises.paisesbacen.model;

import java.util.Date;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;


@Jasper(titulo = "PaisesBacen",
		nomeDoArquivoGerado = "PaisesBacen",
		nomeArquivoJasper = "PaisesBacen")
public class PaisesBacenModel extends Model {
	
	private static final long serialVersionUID = 1L;
	
	private String codBacen;
	private String paisPortugues;
	private String paisIngles;
	private String paisNativo;
	
	public PaisesBacenModel(){
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}
	
	public PaisesBacenModel(Long id,
							Date dataInclusao,
							Date dataAlteracao,
							String codBacen,
							String paisPortugues,
							String paisIngles,
							String paisNativo){
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.codBacen = codBacen;
		this.paisPortugues = paisPortugues;
		this.paisIngles = paisIngles;
		this.paisNativo = paisNativo;
	}


	public String getCodBacen() {
		return codBacen;
	}

	public void setCodBacen(String codBacen) {
		this.codBacen = codBacen;
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
