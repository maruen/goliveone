package br.com.golive.entity.departamentos;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;

@Data
@EqualsAndHashCode(callSuper = false)
@Jasper(titulo = "Departamentos",
		nomeDoArquivoGerado = "Departamentos",
		nomeArquivoJasper = "Departamentos")
public class DepartamentosModel {
	private Long id;
	private Date dataInclusao;
	private Date dataAlteracao;
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

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public String getDepartamentos() {
		return departamentos;
	}

	public void setDepartamentos(String departamentos) {
		this.departamentos = departamentos;
	}
}
