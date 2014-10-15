package br.com.golive.entity.empresas.regioes.paises.codigotelefonico.paises;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;

@Data
@EqualsAndHashCode(callSuper = false)
@Jasper(titulo = "CodigoTelefonicoPaises",
		nomeDoArquivoGerado = "CodigoTelefonicoPaises",
		nomeArquivoJasper = "CodigoTelefonicoPaises")
public class PaisesModel {
	private Long id;
	private Date dataInclusao;
	private Date dataAlteracao;
	private Long codTelPaises;
	private String paisPortugues;
	private String paisIngles;
	private String paisNativo;
	
	public PaisesModel(){
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}
	
	public PaisesModel(Long id,
					   Date dataInclusao,
					   Date dataAlteracao,
					   Long codTelPaises,
					   String paisPortugues,
					   String paisIngles,
					   String paisNativo){
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.codTelPaises = codTelPaises;
		this.paisPortugues = paisPortugues;
		this.paisIngles = paisIngles;
		this.paisNativo = paisNativo;
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

	public Long getCodTelPaises() {
		return codTelPaises;
	}

	public void setCodTelPaises(Long codTelPaises) {
		this.codTelPaises = codTelPaises;
	}

	public String getPaisPortugues() {
		return paisPortugues;
	}

	public void setPaisPortugues(String paisPortugues) {
		this.paisPortugues = paisPortugues;
	}

	public String getPaisIngles() {
		return paisIngles;
	}

	public void setPaisIngles(String paisIngles) {
		this.paisIngles = paisIngles;
	}

	public String getPaisNativo() {
		return paisNativo;
	}

	public void setPaisNativo(String paisNativo) {
		this.paisNativo = paisNativo;
	}
}
