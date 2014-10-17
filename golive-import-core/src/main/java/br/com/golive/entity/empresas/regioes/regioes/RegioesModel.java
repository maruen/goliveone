package br.com.golive.entity.empresas.regioes.regioes;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;

@Data
@EqualsAndHashCode(callSuper = false)
@Jasper(titulo = "Regioes",
		nomeDoArquivoGerado = "Regioes",
		nomeArquivoJasper = "Regioes")
public class RegioesModel {
	private Long id;
	private Date dataInclusao;
	private Date dataAlteracao;
	private String regiao;
	
	public RegioesModel(){
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}

	public RegioesModel(Long id, 
						Date dataInclusao, 
						Date dataAlteracao,
						String regiao) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
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

	public String getRegiao() {
		return regiao;
	}

	public void setRegiao(String regiao) {
		this.regiao = regiao;
	}
}
