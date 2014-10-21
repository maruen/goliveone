package br.com.golive.entity.empresas.regimeapuracao;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "RegimeApuracao",
		nomeDoArquivoGerado = "RegimeApuracao",
		nomeArquivoJasper = "RegimeApuracao")
	
public class RegimeApuracaoModel extends Model {

	private static final long serialVersionUID = 1L;

	private String regimeApuracao;
	
	public RegimeApuracaoModel(){
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}

	public RegimeApuracaoModel(Long id, 
							   Calendar dataInclusao, 
							   Calendar dataAlteracao,
							   String regimeApuracao) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.regimeApuracao = regimeApuracao;
	}

	
	

	public String getRegimeApuracao() {
		return regimeApuracao;
	}

	public void setRegimeApuracao(String regimeApuracao) {
		this.regimeApuracao = regimeApuracao;
	}
}
