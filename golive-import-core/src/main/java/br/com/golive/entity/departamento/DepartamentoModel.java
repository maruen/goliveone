package br.com.golive.entity.departamento;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;


@Data
@EqualsAndHashCode(callSuper=false)
@Jasper(titulo="Departamento",
		nomeDoArquivoGerado="Departamento",
		nomeArquivoJasper ="Departamento"
		)

public class DepartamentoModel {
	
	private Long 		 id;
	private Date 		 dataInclusao; 
	private Date 		 dataAlteracao;	
	private String 		 departamento;
	private String 		 descricaoProduto;

	public DepartamentoModel() {
		this.dataInclusao 	= new Date();
		this.dataAlteracao 	= new Date();
	}
	
	public DepartamentoModel(Long id, Date dataInclusao, Date dataAlteracao) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
	}

	
}
