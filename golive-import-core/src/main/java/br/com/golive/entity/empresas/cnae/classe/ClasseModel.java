package br.com.golive.entity.empresas.cnae.classe;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;


@Jasper(titulo = "Classe",
		nomeDoArquivoGerado = "Classe",
		nomeArquivoJasper = "Classe")

public class ClasseModel extends Model {
	
	
	private static final long serialVersionUID = 1L;
	
	private String codSecao;
	private String denominacaoSecao;
	private String idDivisao;
	private String codDivisao;
	private String denominacaoDivisao;
	private String idCodGrupo;
	private String codGrupo;
	private String denominacaoCodGrupo;
	private String idCodClasse;
	private String codClasse;
	private String denominacaoClasse;
	
	public ClasseModel(){
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}
	
	public ClasseModel(Long id, 
					  Calendar dataInclusao,
					  Calendar dataAlteracao, 
					  String codSecao, 
					  String denominacaoSecao, 
					  String idDivisao,
					  String codDivisao,
					  String denominacaoDivisao,
					  String idCodGrupo,
					  String codGrupo,
					  String denominacaoCodGrupo,
					  String idCodClasse,
					  String codClasse,
					  String denominacaoClasse){
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.codSecao = codSecao;
		this.denominacaoSecao = denominacaoSecao;
		this.idDivisao = idDivisao;
		this.codDivisao = codDivisao;
		this.denominacaoDivisao = denominacaoDivisao;
		this.idCodGrupo = idCodGrupo;
		this.codGrupo = codGrupo;
		this.denominacaoCodGrupo = denominacaoCodGrupo;
		this.idCodClasse = idCodClasse;
		this.codClasse = codClasse;
		this.denominacaoClasse = denominacaoClasse;
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

	public String getIdCodGrupo() {
		return idCodGrupo;
	}

	public void setIdCodGrupo(String idCodGrupo) {
		this.idCodGrupo = idCodGrupo;
	}

	public String getCodGrupo() {
		return codGrupo;
	}

	public void setCodGrupo(String codGrupo) {
		this.codGrupo = codGrupo;
	}

	public String getDenominacaoCodGrupo() {
		return denominacaoCodGrupo;
	}

	public void setDenominacaoCodGrupo(String denominacaoCodGrupo) {
		this.denominacaoCodGrupo = denominacaoCodGrupo;
	}

	public String getIdCodClasse() {
		return idCodClasse;
	}

	public void setIdCodClasse(String idCodClasse) {
		this.idCodClasse = idCodClasse;
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
