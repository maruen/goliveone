package br.com.golive.entity.empresas.regioes.estados;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "Estados",
		nomeDoArquivoGerado = "Estados",
		nomeArquivoJasper = "Estados")
public class EstadosModel extends Model{
	
	private static final long serialVersionUID = 1L;

	private Long codIbge;
	private String abreviacao;
	private String estado;
	private String idPais;
	private String pais;
	private String idRegiao;
	private String regiao;
	
	public EstadosModel(){
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}
	
	public EstadosModel(Long id,
						Calendar dataInclusao,
						Calendar dataAlteracao,
						Long codIbge,
						String abreviacao,
						String estado,
						String idPais,
						String pais,
						String idRegiao,
						String regiao){
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.codIbge = codIbge;
		this.abreviacao = abreviacao;
		this.estado = estado;
		this.idPais = idPais;
		this.pais = pais;
		this.idRegiao = idRegiao;
		this.regiao = regiao;
	}
	
	public Long getCodIbge() {
		return codIbge;
	}

	public void setCodIbge(Long codIbge) {
		this.codIbge = codIbge;
	}

	public String getAbreviacao() {
		return abreviacao;
	}

	public void setAbreviacao(String abreviacao) {
		this.abreviacao = abreviacao;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getIdPais() {
		return idPais;
	}

	public void setIdPais(String idPais) {
		this.idPais = idPais;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

	public String getIdRegiao() {
		return idRegiao;
	}

	public void setIdRegiao(String idRegiao) {
		this.idRegiao = idRegiao;
	}

	public String getRegiao() {
		return regiao;
	}

	public void setRegiao(String regiao) {
		this.regiao = regiao;
	}
}
