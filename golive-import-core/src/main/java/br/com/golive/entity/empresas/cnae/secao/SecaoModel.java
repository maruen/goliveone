package br.com.golive.entity.empresas.cnae.secao;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;

@Data
@EqualsAndHashCode(callSuper = false)
@Jasper(titulo = "Secao",
		nomeDoArquivoGerado = "Secao",
		nomeArquivoJasper = "Secao")
public class SecaoModel {
	private Long id;
	private Date dataInclusao;
	private Date dataAlteracao;
	private String codSecao;
	private String denominacao;
	
	public SecaoModel(){
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}
	
	public SecaoModel(Long id,
					  Date dataInclusao,
					  Date dataAlteracao,
					  String codSecao,
					  String denominacao){
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.codSecao = codSecao;
		this.denominacao = denominacao;
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

	public String getCodSecao() {
		return codSecao;
	}

	public void setCodSecao(String codSecao) {
		this.codSecao = codSecao;
	}

	public String getDenominacao() {
		return denominacao;
	}

	public void setDenominacao(String denominacao) {
		this.denominacao = denominacao;
	}
}
