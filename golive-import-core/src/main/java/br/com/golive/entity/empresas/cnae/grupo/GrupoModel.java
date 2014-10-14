package br.com.golive.entity.empresas.cnae.grupo;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;

@Data
@EqualsAndHashCode(callSuper = false)
@Jasper(titulo = "Grupo",
		nomeDoArquivoGerado = "Grupo",
		nomeArquivoJasper = "Grupo")
public class GrupoModel {
	private Long id;
	private Date dataInclusao;
	private Date dataAlteracao;
	private String codSecao;
	private String denominacaoSecao;
	private String idDivisao;
	private String codDivisao;
	private String denominacaoDivisao;
	private String idGrupo;
	private String codGrupo;
	private String denominacaoGrupo;
	
	public GrupoModel(){
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}
	
	public GrupoModel(Long id,
					  Date dataInclusao,
					  Date dataAlteracao,
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
