package br.com.golive.entity.departamentos;

import java.util.Date;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "Departamentos",
		nomeDoArquivoGerado = "Departamentos",
		nomeArquivoJasper = "Departamentos")
public class DepartamentosModel extends Model{
	
	
	private static final long serialVersionUID = 1L;
	private String departamentos;
	
	public DepartamentosModel(){
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}
	
	public DepartamentosModel(Long id,
							  Date dataInclusao,
							  Date dataAlteracao,
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
