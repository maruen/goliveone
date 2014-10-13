package br.com.golive.entity.empresas.cargos;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;

@Data
@EqualsAndHashCode(callSuper = false)
@Jasper(titulo = "Cargos", 
		nomeDoArquivoGerado = "file.name.model", 
		nomeArquivoJasper = "Cargos")
public class CargosModel {
	private Date dataInclusao;
	private Date dataAlteracao;
	private Long id;
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

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCargo() {
		return cargo;
	}

	public void setCargo(String cargo) {
		this.cargo = cargo;
	}
}
