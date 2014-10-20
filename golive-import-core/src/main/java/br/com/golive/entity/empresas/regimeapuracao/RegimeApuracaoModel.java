package br.com.golive.entity.empresas.regimeapuracao;

import java.util.Date;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "RegimeApuracao",
		nomeDoArquivoGerado = "RegimeApuracao",
		nomeArquivoJasper = "RegimeApuracao")
public class RegimeApuracaoModel extends Model{
	
	private static final long serialVersionUID = 1L;
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
