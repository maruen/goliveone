package br.com.golive.entity.empresas.cnae.divisao.model;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "Divisao",
		nomeDoArquivoGerado = "Divisao",
		nomeArquivoJasper = "Divisao" )
public class DivisaoModel extends Model {
	
	
	private static final long serialVersionUID = 1L;
	
	private String codSecao;
	private String denominacao;
	private String idDivisao;
	private String codDivisao;
	private String denominacaoDivisao;
	
	public DivisaoModel(){
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}
	
	public DivisaoModel(Long id,
						Calendar dataInclusao,
						Calendar dataAlteracao,
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
