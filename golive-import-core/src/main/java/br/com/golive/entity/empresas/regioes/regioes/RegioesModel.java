package br.com.golive.entity.empresas.regioes.regioes;

import java.util.Date;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "Regioes",
		nomeDoArquivoGerado = "Regioes",
		nomeArquivoJasper = "Regioes")
public class RegioesModel extends Model {
	
	private static final long serialVersionUID = 1L;
	
	private String regiao;
	
	public RegioesModel(){
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}

	public RegioesModel(Long id, 
						Date dataInclusao, 
						Date dataAlteracao,
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
