package br.com.golive.entity.empresas.cnae.cnaesimpeditivossimpesnacional;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;

@Data
@EqualsAndHashCode(callSuper = false)
@Jasper(titulo = "CnaesImpeditivosSimplesNacional",
		nomeDoArquivoGerado = "CnaesImpeditivosSimplesNacional",
		nomeArquivoJasper = "CnaesImpeditivosSimplesNacional")
public class CnaesImpeditivosSimplesNacionalModel {
	private Long id;
	private Date dataInclusao;
	private Date dataAlteracao;
	private String idSubClasse;
	private String codSubClasse;
	private String denominacao;
	
	public CnaesImpeditivosSimplesNacionalModel(){
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}
	
	public CnaesImpeditivosSimplesNacionalModel(Long id,
												Date dataInclusao,
												Date dataAlteracao,
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
