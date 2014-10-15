package br.com.golive.entity.departamento.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import br.com.golive.annotation.Jasper;

@Jasper(titulo 				 	= "Departamento", 
		nomeDoArquivoGerado 	= "file.name.model", 
		nomeArquivoJasper 		= "Departamento")

@Entity	
@Table(name="tbDepartamentoProduto")  
public class DepartamentoModel implements Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@Column(name="DepartamentoProduto")
	private String departamento;
	
	@Column(name="SystemIncludeDateTime")
	private Date dataInclusao;
	
	@Column(name="SystemChangeDateTime")
	private Date dataAlteracao;
	

	public DepartamentoModel() {}

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

	public String getDepartamento() {
		return departamento;
	}

	public void setDepartamento(String departamento) {
		this.departamento = departamento;
	}
}
