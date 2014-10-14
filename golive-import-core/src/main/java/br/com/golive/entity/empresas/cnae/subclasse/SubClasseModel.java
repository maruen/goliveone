package br.com.golive.entity.empresas.cnae.subclasse;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;

@Data
@EqualsAndHashCode(callSuper = false)
@Jasper(titulo = "SubClasse",
		nomeDoArquivoGerado = "SubClasse",
		nomeArquivoJasper = "SubClasse")
public class SubClasseModel {
	private Long id;
	private Date dataInclusao;
	private Date dataAlteracao;
	private String codSubClasse;
	private String denominacaoSubClasse;
	private String idSecao;
	private String codSecao;
	private String denominacaoSecao;
	private String idDivisao;
	private String codDivisao;
	private String denominacaoDivisao;
	private String idGrupo;
	private String codGrupo;
	private String denominacaoGrupo;
	private String idClasse;
	private String codClasse;
	private String denominacaoClasse;
	
	public SubClasseModel(){
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}
	
	public SubClasseModel(Long id,
						  Date dataInclusao, 
						  Date dataAlteracao,
						  String codSubClasse,
						  String denominacaoSubClasse,
						  String idSecao,
						  String codSecao,
						  String denominacaoSecao,
						  String idDivisao,
						  String codDivisao,
						  String denominacaoDivisao,
						  String idGrupo,
						  String codGrupo,
						  String denominacaoGrupo,
						  String idClasse,
						  String codClasse,
						  String denominacaoClasse){
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.codSubClasse = codSubClasse;
		this.denominacaoSubClasse = denominacaoSubClasse;
		this.idSecao = idSecao;
		this.codSecao = codSecao;
		this.denominacaoSecao = denominacaoSecao;
		this.idDivisao = idDivisao;
		this.codDivisao = codDivisao;
		this.denominacaoDivisao = denominacaoDivisao;
		this.idGrupo = idGrupo;
		this.codGrupo = codGrupo;
		this.denominacaoGrupo = denominacaoGrupo;
		this.idClasse = idClasse;
		this.codClasse = codClasse;
		this.denominacaoClasse = denominacaoClasse;
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

	public String getCodSubClasse() {
		return codSubClasse;
	}

	public void setCodSubClasse(String codSubClasse) {
		this.codSubClasse = codSubClasse;
	}

	public String getDenominacaoSubClasse() {
		return denominacaoSubClasse;
	}

	public void setDenominacaoSubClasse(String denominacaoSubClasse) {
		this.denominacaoSubClasse = denominacaoSubClasse;
	}

	public String getIdSecao() {
		return idSecao;
	}

	public void setIdSecao(String idSecao) {
		this.idSecao = idSecao;
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

	public String getIdClasse() {
		return idClasse;
	}

	public void setIdClasse(String idClasse) {
		this.idClasse = idClasse;
	}

	public String getCodClasse() {
		return codClasse;
	}

	public void setCodClasse(String codClasse) {
		this.codClasse = codClasse;
	}

	public String getDenominacaoClasse() {
		return denominacaoClasse;
	}

	public void setDenominacaoClasse(String denominacaoClasse) {
		this.denominacaoClasse = denominacaoClasse;
	}
}
