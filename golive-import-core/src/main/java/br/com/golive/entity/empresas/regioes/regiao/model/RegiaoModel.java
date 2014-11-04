package br.com.golive.entity.empresas.regioes.regiao.model;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "Regioes",
		nomeDoArquivoGerado = "Regioes",
		nomeArquivoJasper = "Regioes")
public class RegiaoModel extends Model {
	
	private static final long serialVersionUID = 1L;
	
	private String regiao;
	
	public RegiaoModel(){
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}

	public RegiaoModel(Long id, 
						Calendar dataInclusao, 
						Calendar dataAlteracao,
						String regiao) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.regiao = regiao;
	}

	public String getRegiao() {
		return regiao;
	}

	public void setRegiao(String regiao) {
		this.regiao = regiao;
	}
}
