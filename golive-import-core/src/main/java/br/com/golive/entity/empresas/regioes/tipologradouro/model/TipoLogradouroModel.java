package br.com.golive.entity.empresas.regioes.tipologradouro.model;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "TiposLogradouro",
		nomeDoArquivoGerado = "TiposLogradouro",
		nomeArquivoJasper = "TiposLogradouro")
public class TipoLogradouroModel extends Model {

	private static final long serialVersionUID = 1L;

	private String abreviacao;
	private String tipoLogradouro;
	
	public TipoLogradouroModel(){
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}

	public TipoLogradouroModel(Long id, 
								Calendar dataInclusao, 
								Calendar dataAlteracao,
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