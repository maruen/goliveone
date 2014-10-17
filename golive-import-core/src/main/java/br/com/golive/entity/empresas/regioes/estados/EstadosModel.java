package br.com.golive.entity.empresas.regioes.estados;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;

@Data
@EqualsAndHashCode(callSuper = false)
@Jasper(titulo = "Estados",
		nomeDoArquivoGerado = "Estados",
		nomeArquivoJasper = "Estados")
public class EstadosModel {
	private Long id;
	private Date dataInclusao;
	private Date dataAlteracao;
	private Long codIbge;
	private String abreviacao;
	private String estado;
	private String idPais;
	private String pais;
	private String idRegiao;
	private String regiao;
	
	public EstadosModel(){
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}
	
	public EstadosModel(Long id,
						Date dataInclusao,
						Date dataAlteracao,
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