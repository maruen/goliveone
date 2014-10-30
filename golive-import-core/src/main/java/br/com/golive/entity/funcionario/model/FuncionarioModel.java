package br.com.golive.entity.funcionario.model;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "Funcionario", nomeDoArquivoGerado = "Funcionario", nomeArquivoJasper = "Funcionario")
public class FuncionarioModel extends Model {

	private static final long serialVersionUID = 1L;

	private String cpf;
	private String nome;
	private String telefone;
	private String celular;
	private String email;

	public FuncionarioModel() {
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}

	public FuncionarioModel(Long id, Calendar dataInclusao,
			Calendar dataAlteraca, String cpf, String nome, String telefone,
			String celular, String email) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteraca;
		this.cpf = cpf;
		this.nome = nome;
		this.telefone = telefone;
		this.celular = celular;
		this.email = email;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getCelular() {
		return celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
