package br.com.golive.entity.empresas.cargos;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "Cargos", 
		nomeDoArquivoGerado = "file.name.model", 
		nomeArquivoJasper = "Cargos")

public class CargosModel extends Model{
	
	private static final long serialVersionUID = 1L;

	private String cargo;
	
	public CargosModel(){
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}
	
	public CargosModel(Long id, 
					   Calendar dataInclucao, 
					   Calendar dataAlteracao, 
					   String cargo){
		super();
		this.id = id;
		this.dataInclusao = dataInclucao;
		this.dataAlteracao = dataAlteracao;
		this.cargo = cargo;
	}

	
	public String getCargo() {
		return cargo;
	}

	public void setCargo(String cargo) {
		this.cargo = cargo;
	}
}
