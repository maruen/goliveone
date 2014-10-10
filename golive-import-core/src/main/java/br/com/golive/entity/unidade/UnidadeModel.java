package br.com.golive.entity.unidade;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;

@Data
@EqualsAndHashCode(callSuper = false)
@Jasper(titulo = "Unidade", 
		nomeDoArquivoGerado = "file.name.model", 
		nomeArquivoJasper = "Unidade")	
public class UnidadeModel {
	private Long id;
	private Date dataInclusao;
	private Date dataAlteracao;
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
