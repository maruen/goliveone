package br.com.golive.entity.empresas.cnae.divisao;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;

@Data
@EqualsAndHashCode(callSuper = false)
@Jasper(titulo = "Divisao",
		nomeDoArquivoGerado = "Divisao",
		nomeArquivoJasper = "Divisao" )
public class DivisaoModel {
	private Long id;
	private Date dataInclusao;
	private Date dataAlteracao;
	private String codSecao;
	private String denominacao;
	private String idDivisao;
	private String codDivisao;
	private String denominacaoDivisao;
	
	public DivisaoModel(){
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}
	
	public DivisaoModel(Long id,
						Date dataInclusao,
						Date dataAlteracao,
						String codSecao,
						String denominacao,
						String idDivisao,
						String codDivisao,
						String denominacaoDivisao){
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.codSecao = codSecao;
		this.denominacao = denominacao;
		this.idDivisao = idDivisao;
		this.codDivisao = codDivisao;
		this.denominacaoDivisao = denominacaoDivisao;
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

	public String getIdDivisao() {
		return idDivisao;
	}

	public void setIdDivisao(String idDivisao) {
		this.idDivisao = idDivisao;
	}

	public String getCodDivisao() {
		return codDivisao;
	}

	public void setCodDivisao(String codDivisao) {
		this.codDivisao = codDivisao;
	}

	public String getDenominacaoDivisao() {
		return denominacaoDivisao;
	}

	public void setDenominacaoDivisao(String denominacaoDivisao) {
		this.denominacaoDivisao = denominacaoDivisao;
	}
}
