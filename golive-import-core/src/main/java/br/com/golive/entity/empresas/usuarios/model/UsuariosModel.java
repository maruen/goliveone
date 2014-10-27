package br.com.golive.entity.empresas.usuarios.model;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "Usuarios",
		nomeDoArquivoGerado = "Usuarios",
		nomeArquivoJasper = "Usuarios")
public class UsuariosModel extends Model {

	private static final long serialVersionUID = 1L;
	
	private String usuario;
	private String idFuncionario;
	private String funcionario;
	private String idCliente;
	private String cliente;
	private String idFornecedor;
	private String fornecedor;
	
	public UsuariosModel(){
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}

	public UsuariosModel(Long id,
						 Calendar dataInclusao,
						 Calendar dataAlteracao,
						 String usuario, 
						 String idFuncionario,
						 String funcionario, 
						 String idCliente, 
						 String cliente,
						 String idFornecedor, 
						 String fornecedor) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.usuario = usuario;
		this.idFuncionario = idFuncionario;
		this.funcionario = funcionario;
		this.idCliente = idCliente;
		this.cliente = cliente;
		this.idFornecedor = idFornecedor;
		this.fornecedor = fornecedor;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getIdFuncionario() {
		return idFuncionario;
	}

	public void setIdFuncionario(String idFuncionario) {
		this.idFuncionario = idFuncionario;
	}

	public String getFuncionario() {
		return funcionario;
	}

	public void setFuncionario(String funcionario) {
		this.funcionario = funcionario;
	}

	public String getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(String idCliente) {
		this.idCliente = idCliente;
	}

	public String getCliente() {
		return cliente;
	}

	public void setCliente(String cliente) {
		this.cliente = cliente;
	}

	public String getIdFornecedor() {
		return idFornecedor;
	}

	public void setIdFornecedor(String idFornecedor) {
		this.idFornecedor = idFornecedor;
	}

	public String getFornecedor() {
		return fornecedor;
	}

	public void setFornecedor(String fornecedor) {
		this.fornecedor = fornecedor;
	}
}
