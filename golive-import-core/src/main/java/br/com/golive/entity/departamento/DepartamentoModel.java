package br.com.golive.entity.departamento;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;

@Data
@EqualsAndHashCode(callSuper = false)
@Jasper(titulo = "Departamento", 
		nomeDoArquivoGerado = "file.name.model", 
		nomeArquivoJasper = "Departamento")
public class DepartamentoModel {

	private Long id;
	private Date dataInclusao;
	private Date dataAlteracao;
	private String descricao;

	public DepartamentoModel() {
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}

	public DepartamentoModel(Long id, Date dataInclusao, Date dataAlteracao, String descricao) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.descricao = descricao;
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

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
}
