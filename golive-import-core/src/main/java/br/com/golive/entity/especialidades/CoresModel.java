package br.com.golive.entity.especialidades;

import java.util.Date;

import br.com.golive.annotation.Jasper;


@Jasper(titulo="Cores",
		nomeDoArquivoGerado="Cores",
		nomeArquivoJasper ="Cores"
		)

public class CoresModel {
	
	private Long 		 id;
	private Date 		 dataInclusao; 
	private Date 		 dataAlteracao;	
	private String 		 codigoCor;
	private String 		 cor;
	private String 		 idColecao;
	private String 		 codigoColecao;
	private String 		 colecao;
	
	public CoresModel() {
		this.dataInclusao 	= new Date();
		this.dataAlteracao 	= new Date();
	}

	public CoresModel(Long id,
					  Date dataInclusao,
					  Date dataAlteracao,
					  String codigoCor,
					  String cor,
					  String idColecao,
					  String codigoColecao,
					  String colecao) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.codigoCor = codigoCor;
		this.cor = cor;
		this.idColecao = idColecao;
		this.codigoColecao = codigoColecao;
		this.colecao = colecao;
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
