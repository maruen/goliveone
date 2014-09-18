package br.com.golive.entity;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;


@Data
@EqualsAndHashCode(callSuper=false)
@Deprecated
public class GenericModel {
	
	private Long id;
	private Date dataInclusao 	= new Date();
	private Date dataAlteracao	= new Date();
	
	
	public GenericModel(Long id, Date dataInclusao, Date dataAlteracao) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
	}
	
	
	
	
	
}
