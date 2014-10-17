package br.com.golive.entity.empresas.regimeapuracao;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;

@Data
@EqualsAndHashCode(callSuper = false)
@Jasper(titulo = "RegimeApuracao",
		nomeDoArquivoGerado = "RegimeApuracao",
		nomeArquivoJasper = "RegimeApuracao")
public class RegimeApuracaoModel {
	private Long id;
	private Date dataInclusao;
	private Date dataAlteracao;
	private String regimeApuracao;
	
	public RegimeApuracaoModel(){
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}

	public RegimeApuracaoModel(Long id, 
							   Date dataInclusao, 
							   Date dataAlteracao,
							   String regimeApuracao) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.regimeApuracao = regimeApuracao;
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

	public String getRegimeApuracao() {
		return regimeApuracao;
	}

	public void setRegimeApuracao(String regimeApuracao) {
		this.regimeApuracao = regimeApuracao;
	}
}
