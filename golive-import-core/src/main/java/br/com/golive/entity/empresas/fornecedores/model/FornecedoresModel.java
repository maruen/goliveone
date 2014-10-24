package br.com.golive.entity.empresas.fornecedores.model;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "Fornecedores", nomeDoArquivoGerado = "Fornecedores", nomeArquivoJasper = "Fornecedores")
public class FornecedoresModel extends Model {

	private static final long serialVersionUID = 1L;

	private String cnpj;
	private String inscricaoEstadual;
	private String nomeFantasia;
	private String razaoSocial;

	public FornecedoresModel() {
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}

	public FornecedoresModel(final Long id, final Calendar dataInclusao, final Calendar dataAlteracao, final String cnpj, final String inscricaoEstadual, final String nomeFantasia, final String razaoSocial) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.cnpj = cnpj;
		this.inscricaoEstadual = inscricaoEstadual;
		this.nomeFantasia = nomeFantasia;
		this.razaoSocial = razaoSocial;
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(final String cnpj) {
		this.cnpj = cnpj;
	}

	public String getInscricaoEstadual() {
		return inscricaoEstadual;
	}

	public void setInscricaoEstadual(final String inscricaoEstadual) {
		this.inscricaoEstadual = inscricaoEstadual;
	}

	public String getNomeFantasia() {
		return nomeFantasia;
	}

	public void setNomeFantasia(final String nomeFantasia) {
		this.nomeFantasia = nomeFantasia;
	}

	public String getRazaoSocial() {
		return razaoSocial;
	}

	public void setRazaoSocial(final String razaoSocial) {
		this.razaoSocial = razaoSocial;
	}
}
