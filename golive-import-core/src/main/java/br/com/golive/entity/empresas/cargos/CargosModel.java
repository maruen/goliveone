package br.com.golive.entity.empresas.cargos;

import java.util.Date;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "Cargos", 
		nomeDoArquivoGerado = "file.name.model", 
		nomeArquivoJasper = "Cargos")

public class CargosModel extends Model{
	
	private static final long serialVersionUID = 1L;

	private String cargo;
	
	public CargosModel(){
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}
	
	public CargosModel(Long id, 
					   Date dataInclucao, 
					   Date dataAlteracao, 
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
