package br.com.golive.entity.departamento.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo 				 	= "Departamento", 
		nomeDoArquivoGerado 	= "file.name.model", 
		nomeArquivoJasper 		= "Departamento")

@Entity	
@Table(name="tbDepartamentoProduto")  
public class DepartamentoModel extends Model {
	
	private static final long serialVersionUID = 1L;

	@Column(name="DepartamentoProduto")
	private String departamento;
	

	public DepartamentoModel() {}

	
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

	public String getDepartamento() {
		return departamento;
	}

	public void setDepartamento(String departamento) {
		this.departamento = departamento;
	}
}
