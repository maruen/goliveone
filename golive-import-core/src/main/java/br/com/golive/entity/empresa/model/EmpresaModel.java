package br.com.golive.entity.empresa.model;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "Empresa", nomeDoArquivoGerado = "Empresa", nomeArquivoJasper = "Empresa")
public class EmpresaModel extends Model {

	private static final long serialVersionUID = 1L;

	private String cnpj;
	private String inscEstadual;
	private String nomeFantasia;
	private String razaoSocial;

	public EmpresaModel() {
		this.dataAlteracao = Calendar.getInstance();
		this.dataInclusao = Calendar.getInstance();
	}

	public EmpresaModel(Long id, Calendar dataInclusao, Calendar dataAlteracao,
			String cnpj, String inscEstadual, String nomeFantasia,
			String razaoSocial) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.cnpj = cnpj;
		this.inscEstadual = inscEstadual;
		this.nomeFantasia = nomeFantasia;
		this.razaoSocial = razaoSocial;
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public String getInscEstadual() {
		return inscEstadual;
	}

	public void setInscEstadual(String inscEstadual) {
		this.inscEstadual = inscEstadual;
	}

	public String getNomeFantasia() {
		return nomeFantasia;
	}

	public void setNomeFantasia(String nomeFantasia) {
		this.nomeFantasia = nomeFantasia;
	}

	public String getRazaoSocial() {
		return razaoSocial;
	}

	public void setRazaoSocial(String razaoSocial) {
		this.razaoSocial = razaoSocial;
	}
}
