package br.com.golive.entity.especialidades.model;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;


@Jasper(titulo="Cores",
		nomeDoArquivoGerado="file.name.model",
		nomeArquivoJasper ="Cores"
		)

public class CoresModel extends Model{
	
	private static final long serialVersionUID = 1L;
	
		
	private String 		 codigoCor;
	private String 		 cor;
	private String 		 idColecao;
	private String 		 codigoColecao;
	private String 		 colecao;
	
	public CoresModel() {
		this.dataInclusao 	= Calendar.getInstance();
		this.dataAlteracao 	= Calendar.getInstance();
	}

	public CoresModel(Long id,
					  Calendar dataInclusao,
					  Calendar dataAlteracao,
					  String codigoCor,
					  String cor,
					  String idColecao,
					  String codigoColecao,
					  String colecao) {
		super();
		this.id 			= id;
		this.dataInclusao 	= Calendar.getInstance();
		this.dataAlteracao 	= Calendar.getInstance();
		this.codigoCor 		= codigoCor;
		this.cor 			= cor;
		this.idColecao 		= idColecao;
		this.codigoColecao 	= codigoColecao;
		this.colecao 		= colecao;
	}
	
	
	public String getCodigoCor() {
		return codigoCor;
	}

	public void setCodigoCor(String codigoCor) {
		this.codigoCor = codigoCor;
	}

	public String getCor() {
		return cor;
	}

	public void setCor(String cor) {
		this.cor = cor;
	}

	public String getIdColecao() {
		return idColecao;
	}

	public void setIdColecao(String idColecao) {
		this.idColecao = idColecao;
	}

	public String getCodigoColecao() {
		return codigoColecao;
	}

	public void setCodigoColecao(String codigoColecao) {
		this.codigoColecao = codigoColecao;
	}

	public String getColecao() {
		return colecao;
	}

	public void setColecao(String colecao) {
		this.colecao = colecao;
	}
	
}
