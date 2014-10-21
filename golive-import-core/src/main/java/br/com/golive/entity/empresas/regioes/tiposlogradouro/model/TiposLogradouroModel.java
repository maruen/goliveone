package br.com.golive.entity.empresas.regioes.tiposlogradouro.model;

import java.util.Date;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "TiposLogradouro",
		nomeDoArquivoGerado = "TiposLogradouro",
		nomeArquivoJasper = "TiposLogradouro")
public class TiposLogradouroModel extends Model {

	private static final long serialVersionUID = 1L;

	private String abreviacao;
	private String tipoLogradouro;
	
	public TiposLogradouroModel(){
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}

	public TiposLogradouroModel(Long id, 
								Date dataInclusao, 
								Date dataAlteracao,
								String abreviacao, 
								String tipoLogradouro) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.abreviacao = abreviacao;
		this.tipoLogradouro = tipoLogradouro;
	}

	public String getAbreviacao() {
		return abreviacao;
	}

	public void setAbreviacao(String abreviacao) {
		this.abreviacao = abreviacao;
	}

	public String getTipoLogradouro() {
		return tipoLogradouro;
	}

	public void setTipoLogradouro(String tipoLogradouro) {
		this.tipoLogradouro = tipoLogradouro;
	}
}
