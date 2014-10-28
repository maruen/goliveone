package br.com.golive.entity.unidade;

import java.util.Calendar;

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
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}
	
	public UnidadeModel(Long id, Calendar dataInclusao, Calendar dataAlteracao, String codigo, String descricao){
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
