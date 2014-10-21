package br.com.golive.entity.colecoes.model;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "Colecoes", 
		nomeDoArquivoGerado = "file.name.model", 
		nomeArquivoJasper = "Colecoes")
public class ColecoesModel extends Model {
	
	private static final long serialVersionUID = 1L;
	
	private String departamento;
	private String idGrupoProdutos;
	private String grupoProdutos;
	private String idSubGrupoProdutos;
	private String subGrupoProdutos;
	private String idColecao;
	private String codColecao;
	private String colecao;

	public ColecoesModel() {
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}

	public ColecoesModel(Long id, 
						 Calendar dataInclusao, 
						 Calendar dataAlteracao,
						 String departamento,
						 String idGrupoProdutos,
						 String grupoProdutos,
						 String idSubGrupoProdutos,
						 String subGrupoProdutos,
						 String idColecao,
						 String codColecao,
						 String colecao) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.departamento = departamento;
		this.idGrupoProdutos = idGrupoProdutos;
		this.grupoProdutos = grupoProdutos;
		this.idSubGrupoProdutos = idSubGrupoProdutos;
		this.subGrupoProdutos = subGrupoProdutos;
		this.idColecao = idColecao;
		this.codColecao = codColecao;
		this.colecao = colecao;
	}
	
	public void setDataAlteracao(Calendar dataAlteracao) {
		this.dataAlteracao = dataAlteracao;
	}

	public String getDepartamento() {
		return departamento;
	}

	public void setDepartamento(String departamento) {
		this.departamento = departamento;
	}

	public String getIdGrupoProdutos() {
		return idGrupoProdutos;
	}

	public void setIdGrupoProdutos(String idGrupoProdutos) {
		this.idGrupoProdutos = idGrupoProdutos;
	}

	public String getGrupoProdutos() {
		return grupoProdutos;
	}

	public void setGrupoProdutos(String grupoProdutos) {
		this.grupoProdutos = grupoProdutos;
	}

	public String getIdSubGrupoProdutos() {
		return idSubGrupoProdutos;
	}

	public void setIdSubGrupoProdutos(String idSubGrupoProdutos) {
		this.idSubGrupoProdutos = idSubGrupoProdutos;
	}

	public String getSubGrupoProdutos() {
		return subGrupoProdutos;
	}

	public void setSubGrupoProdutos(String subGrupoProdutos) {
		this.subGrupoProdutos = subGrupoProdutos;
	}

	public String getIdColecao() {
		return idColecao;
	}

	public void setIdColecao(String idColecao) {
		this.idColecao = idColecao;
	}

	public String getCodColecao() {
		return codColecao;
	}

	public void setCodColecao(String codColecao) {
		this.codColecao = codColecao;
	}

	public String getColecao() {
		return colecao;
	}

	public void setColecao(String colecao) {
		this.colecao = colecao;
	}
}