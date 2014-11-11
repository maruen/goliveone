package br.com.golive.entity.empresas.cnae.cnaeimpeditivosimpesnacional.model;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "CnaesImpeditivosSimplesNacional",
		nomeDoArquivoGerado = "CnaesImpeditivosSimplesNacional",
		nomeArquivoJasper = "CnaesImpeditivosSimplesNacional")


public class CnaeImpeditivoSimplesNacionalModel extends Model{
	
	
	private static final long serialVersionUID = 1L;
	
	private String idSubClasse;
	private String codSubClasse;
	private String denominacao;
	
	public CnaeImpeditivoSimplesNacionalModel(){
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}
	
	public CnaeImpeditivoSimplesNacionalModel(Long id,
												Calendar dataInclusao,
												Calendar dataAlteracao,
												String idSubClasse,
												String codSubClasse,
												String denominacao){
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.idSubClasse = idSubClasse;
		this.codSubClasse = codSubClasse;
		this.denominacao = denominacao;
	}
	
	public String getIdSubClasse() {
		return idSubClasse;
	}

	public void setIdSubClasse(String idSubClasse) {
		this.idSubClasse = idSubClasse;
	}

	public String getCodSubClasse() {
		return codSubClasse;
	}

	public void setCodSubClasse(String codSubClasse) {
		this.codSubClasse = codSubClasse;
	}

	public String getDenominacao() {
		return denominacao;
	}

	public void setDenominacao(String denominacao) {
		this.denominacao = denominacao;
	}
}
