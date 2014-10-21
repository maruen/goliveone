package br.com.golive.entity.empresas.cnae.grupo;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "Grupo",
		nomeDoArquivoGerado = "Grupo",
		nomeArquivoJasper = "Grupo")
public class GrupoModel extends Model {
	
	
	private static final long serialVersionUID = 1L;
	
	private String codSecao;
	private String denominacaoSecao;
	private String idDivisao;
	private String codDivisao;
	private String denominacaoDivisao;
	private String idGrupo;
	private String codGrupo;
	private String denominacaoGrupo;
	
	public GrupoModel(){
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}
	
	public GrupoModel(Long id,
					  Calendar dataInclusao,
					  Calendar dataAlteracao,
					  String codSecao,
					  String denominacaoSecao,
					  String idDivisao,
					  String codDivisao,
					  String denominacaoDivisao,
					  String idGrupo,
					  String codGrupo,
					  String denominacaoGrupo){
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.codSecao = codSecao;
		this.denominacaoSecao = denominacaoSecao;
		this.idDivisao = idDivisao;
		this.codDivisao = codDivisao;
		this.denominacaoDivisao = denominacaoDivisao;
		this.idGrupo = idGrupo;
		this.codGrupo = codGrupo;
		this.denominacaoGrupo = denominacaoGrupo;
	}
	
	public Calendar getDataAlteracao() {
		return dataAlteracao;
	}

	public void setDataAlteracao(Calendar dataAlteracao) {
		this.dataAlteracao = dataAlteracao;
	}

	public String getCodSecao() {
		return codSecao;
	}

	public void setCodSecao(String codSecao) {
		this.codSecao = codSecao;
	}

	public String getDenominacaoSecao() {
		return denominacaoSecao;
	}

	public void setDenominacaoSecao(String denominacaoSecao) {
		this.denominacaoSecao = denominacaoSecao;
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

	public String getIdGrupo() {
		return idGrupo;
	}

	public void setIdGrupo(String idGrupo) {
		this.idGrupo = idGrupo;
	}

	public String getCodGrupo() {
		return codGrupo;
	}

	public void setCodGrupo(String codGrupo) {
		this.codGrupo = codGrupo;
	}

	public String getDenominacaoGrupo() {
		return denominacaoGrupo;
	}

	public void setDenominacaoGrupo(String denominacaoGrupo) {
		this.denominacaoGrupo = denominacaoGrupo;
	}
}
