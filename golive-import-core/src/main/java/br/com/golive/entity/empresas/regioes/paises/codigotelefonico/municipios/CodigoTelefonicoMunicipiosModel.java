package br.com.golive.entity.empresas.regioes.paises.codigotelefonico.municipios;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "CodigoTelefonicoMunicipios",
		nomeDoArquivoGerado = "CodigoTelefonicoMunicipios",
		nomeArquivoJasper = "CodigoTelefonicoMunicipios")
public class CodigoTelefonicoMunicipiosModel extends Model {

	private static final long serialVersionUID = 1L;
	
	private Long codTelPais;
	private String idMunicipio;
	private Long codTelMunicipio;
	private String idEstado;
	private String abrEstado;
	private String estado;
	private String idRegiao;
	private String regiao;
	private String idPais;
	private String pais;
	
	public CodigoTelefonicoMunicipiosModel(){
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}
	
	public CodigoTelefonicoMunicipiosModel(Long id,
						  Calendar dataInclusao,
						  Calendar dataAlteracao,
						  Long codTelPais,
						  String idMunicipio,
						  Long codTelMunicipio,
						  String idEstado,
						  String abrEstado,
						  String estado,
						  String idRegiao,
						  String regiao,
						  String idPais,
						  String pais){
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.codTelPais = codTelPais;
		this.idMunicipio = idMunicipio;
		this.codTelMunicipio = codTelMunicipio;
		this.idEstado = idEstado;
		this.abrEstado = abrEstado;
		this.estado = estado;
		this.idRegiao = idRegiao;
		this.regiao = regiao;
		this.idPais = idPais;
		this.pais = pais;
	}
	
	
	public Long getCodTelPais() {
		return codTelPais;
	}

	public void setCodTelPais(Long codTelPais) {
		this.codTelPais = codTelPais;
	}

	public String getIdMunicipio() {
		return idMunicipio;
	}

	public void setIdMunicipio(String idMunicipio) {
		this.idMunicipio = idMunicipio;
	}

	public Long getCodTelMunicipio() {
		return codTelMunicipio;
	}

	public void setCodTelMunicipio(Long codTelMunicipio) {
		this.codTelMunicipio = codTelMunicipio;
	}

	public String getIdEstado() {
		return idEstado;
	}

	public void setIdEstado(String idEstado) {
		this.idEstado = idEstado;
	}

	public String getAbrEstado() {
		return abrEstado;
	}

	public void setAbrEstado(String abrEstado) {
		this.abrEstado = abrEstado;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
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
}
