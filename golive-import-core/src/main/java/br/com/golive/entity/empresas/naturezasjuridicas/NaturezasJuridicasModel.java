package br.com.golive.entity.empresas.naturezasjuridicas;

import java.util.Date;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "NaturezasJuridicas",
		nomeDoArquivoGerado = "NaturezasJuridicas",
		nomeArquivoJasper = "NaturezasJuridicas")
public class NaturezasJuridicasModel extends Model {

	private static final long serialVersionUID = 1L;

	private String codNaturezasJuridicas;
	private String naturezasJuridicas;
	private String representante;
	private String qualificacao;
	private String idCodCatNatJur;
	private String codCatNatJur;
	private String categoriaNaturezaJuridica;
	
	public NaturezasJuridicasModel(){
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}

	public NaturezasJuridicasModel(Long id,
								   Date dataInclusao,
								   Date dataAlteracao,
								   String codNaturezasJuridicas,
								   String naturezasJuridicas, 
								   String representante,
								   String qualificacao, 
								   String idCodCatNatJur,
								   String codCatNatJur,
								   String categoriaNaturezaJuridica) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.codNaturezasJuridicas = codNaturezasJuridicas;
		this.naturezasJuridicas = naturezasJuridicas;
		this.representante = representante;
		this.qualificacao = qualificacao;
		this.idCodCatNatJur = idCodCatNatJur;
		this.codCatNatJur = codCatNatJur;
		this.categoriaNaturezaJuridica = categoriaNaturezaJuridica;
	}

	public String getCodNaturezasJuridicas() {
		return codNaturezasJuridicas;
	}

	public void setCodNaturezasJuridicas(String codNaturezasJuridicas) {
		this.codNaturezasJuridicas = codNaturezasJuridicas;
	}

	public String getNaturezasJuridicas() {
		return naturezasJuridicas;
	}

	public void setNaturezasJuridicas(String naturezasJuridicas) {
		this.naturezasJuridicas = naturezasJuridicas;
	}

	public String getRepresentante() {
		return representante;
	}

	public void setRepresentante(String representante) {
		this.representante = representante;
	}

	public String getQualificacao() {
		return qualificacao;
	}

	public void setQualificacao(String qualificacao) {
		this.qualificacao = qualificacao;
	}

	public String getIdCodCatNatJur() {
		return idCodCatNatJur;
	}

	public void setIdCodCatNatJur(String idCodCatNatJur) {
		this.idCodCatNatJur = idCodCatNatJur;
	}

	public String getCodCatNatJur() {
		return codCatNatJur;
	}

	public void setCodCatNatJur(String codCatNatJur) {
		this.codCatNatJur = codCatNatJur;
	}

	public String getCategoriaNaturezaJuridica() {
		return categoriaNaturezaJuridica;
	}

	public void setCategoriaNaturezaJuridica(String categoriaNaturezaJuridica) {
		this.categoriaNaturezaJuridica = categoriaNaturezaJuridica;
	}
}
