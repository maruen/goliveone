package br.com.golive.entity.unidade.model;

import java.util.Date;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "Unidade", 
		nomeDoArquivoGerado = "file.name.model", 
		nomeArquivoJasper = "Unidade")	

public class UnidadeModel extends Model{
	
	private static final long serialVersionUID = 1L;
	
	private String codigo;
	private String descricao;
	
	public UnidadeModel(){
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}
	
	public UnidadeModel(Long id, Date dataInclusao, Date dataAlteracao, String codigo, String descricao){
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.codigo = codigo;
		this.descricao = descricao;
	}


	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
}
