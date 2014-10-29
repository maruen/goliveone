package br.com.golive.entity.departamentos.model;

import java.util.Calendar;

import javax.persistence.Transient;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "Departamentos",
		nomeDoArquivoGerado = "Departamentos",
		nomeArquivoJasper = "Departamentos")
public class DepartamentosModel extends Model{
	
	@Transient
	private static final long serialVersionUID = 1L;
	
	private String departamentos;
	
	public DepartamentosModel(){
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}
	
	public DepartamentosModel(Long id,
							  Calendar dataInclusao,
							  Calendar dataAlteracao,
							  String departamentos){
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.departamentos = departamentos;
	}
	
	public String getDepartamentos() {
		return departamentos;
	}

	public void setDepartamentos(String departamentos) {
		this.departamentos = departamentos;
	}
}
