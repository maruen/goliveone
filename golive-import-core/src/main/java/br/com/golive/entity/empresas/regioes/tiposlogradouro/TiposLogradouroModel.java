package br.com.golive.entity.empresas.regioes.tiposlogradouro;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;

@Data
@EqualsAndHashCode(callSuper = false)
@Jasper(titulo = "TiposLogradouro",
		nomeDoArquivoGerado = "TiposLogradouro",
		nomeArquivoJasper = "TiposLogradouro")
public class TiposLogradouroModel {
	private Long id;
	private Date dataInclusao;
	private Date dataAlteracao;
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
