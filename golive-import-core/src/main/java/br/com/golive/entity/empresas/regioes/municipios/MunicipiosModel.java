package br.com.golive.entity.empresas.regioes.municipios;

import java.util.Date;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "Municipios",
		nomeDoArquivoGerado = "Municipios",
		nomeArquivoJasper = "Municipios")
public class MunicipiosModel extends Model{

	private static final long serialVersionUID = 1L;

	private String codMunicipioIbge;
	private String municipio;
	private String idPais;
	private String pais;
	private String idEstado;
	private String codEstadoIbge;
	private String estado;
	private String regiao;
	
	public MunicipiosModel(){
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}

	public MunicipiosModel(Long id, 
						   Date dataInclusao, 
						   Date dataAlteracao,
						   String codMunicipioIbge, 
						   String municipio, 
						   String idPais,
						   String pais, 
						   String idEstado, 
						   String codEstadoIbge, 
						   String estado,
						   String regiao) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.codMunicipioIbge = codMunicipioIbge;
		this.municipio = municipio;
		this.idPais = idPais;
		this.pais = pais;
		this.idEstado = idEstado;
		this.codEstadoIbge = codEstadoIbge;
		this.estado = estado;
		this.regiao = regiao;
	}

	public String getCodMunicipioIbge() {
		return codMunicipioIbge;
	}

	public void setCodMunicipioIbge(String codMunicipioIbge) {
		this.codMunicipioIbge = codMunicipioIbge;
	}

	public String getMunicipio() {
		return municipio;
	}

	public void setMunicipio(String municipio) {
		this.municipio = municipio;
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

	public String getIdEstado() {
		return idEstado;
	}

	public void setIdEstado(String idEstado) {
		this.idEstado = idEstado;
	}

	public String getCodEstadoIbge() {
		return codEstadoIbge;
	}

	public void setCodEstadoIbge(String codEstadoIbge) {
		this.codEstadoIbge = codEstadoIbge;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getRegiao() {
		return regiao;
	}

	public void setRegiao(String regiao) {
		this.regiao = regiao;
	}
}
