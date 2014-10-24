package br.com.golive.entity.empresas.ncm.secao.model;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "NcmSecao",
		nomeDoArquivoGerado = "NcmSecao",
		nomeArquivoJasper = "NcmSecao")
public class NcmSecaoModel extends Model {
	
	private static final long serialVersionUID = 1L;

	private String codSecao;
	private String secao;
	
	public NcmSecaoModel(){
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}
	
	public NcmSecaoModel(Long id,
					  Calendar dataInclusao,
					  Calendar dataAlteracao,
					  String codSecao,
					  String secao){
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.codSecao = codSecao;
		this.secao = secao;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Calendar getDataInclusao() {
		return dataInclusao;
	}

	public void setDataInclusao(Calendar dataInclusao) {
		this.dataInclusao = dataInclusao;
	}

	public Calendar getDataAlteracao() {
		return dataAlteracao;
	}

	public void setDataAlteracao(Calendar dataAlteracao) {
		this.dataAlteracao = dataAlteracao;
	}

	public String getCodSecao() {
		return codSecao;
	}

	public void setCodSecao(String codSecao) {
		this.codSecao = codSecao;
	}

	public String getSecao() {
		return secao;
	}

	public void setSecao(String secao) {
		this.secao = secao;
	}
}
