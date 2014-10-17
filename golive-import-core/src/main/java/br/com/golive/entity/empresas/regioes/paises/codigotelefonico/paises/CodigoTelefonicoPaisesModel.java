package br.com.golive.entity.empresas.regioes.paises.codigotelefonico.paises;

import java.util.Date;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "CodigoTelefonicoPaises",
		nomeDoArquivoGerado = "CodigoTelefonicoPaises",
		nomeArquivoJasper = "CodigoTelefonicoPaises")
public class CodigoTelefonicoPaisesModel extends Model {

	private static final long serialVersionUID = 1L;
	
	private Long codTelPaises;
	private String paisPortugues;
	private String paisIngles;
	private String paisNativo;
	
	public CodigoTelefonicoPaisesModel(){
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}
	
	public CodigoTelefonicoPaisesModel(Long id,
					   Date dataInclusao,
					   Date dataAlteracao,
					   Long codTelPaises,
					   String paisPortugues,
					   String paisIngles,
					   String paisNativo){
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.codTelPaises = codTelPaises;
		this.paisPortugues = paisPortugues;
		this.paisIngles = paisIngles;
		this.paisNativo = paisNativo;
	}
	
	public Long getCodTelPaises() {
		return codTelPaises;
	}

	public void setCodTelPaises(Long codTelPaises) {
		this.codTelPaises = codTelPaises;
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
