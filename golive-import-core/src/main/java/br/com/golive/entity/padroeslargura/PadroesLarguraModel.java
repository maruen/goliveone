package br.com.golive.entity.padroeslargura;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;

@Data
@EqualsAndHashCode(callSuper=false)
@Jasper(titulo="PadroesLargura",
		nomeDoArquivoGerado="file.name.model",
		nomeArquivoJasper="PadroesLargura")
public class PadroesLarguraModel {
	private Long id;
	private Date dataInclusao;
	private Date dataAlteracao;
	private String largura;
	private String unidade;
	private String descricao;
	private String idColecao;
	private String codColecao;
	private String colecao;
	private String idCor;
	private String codCor;
	private String cor;
	
	public PadroesLarguraModel(){
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}
	
	public PadroesLarguraModel(Long id, 
							   Date dataInclusao, 
							   Date dataAlteracao, 
							   String largura, 
							   String unidade, 
							   String descricao, 
							   String idColecao, 
							   String codColecao, 
							   String colecao, 
							   String idCor, 
							   String codCor, 
							   String cor){
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.largura = largura;
		this.unidade = unidade;
		this.descricao = descricao;
		this.idColecao = idColecao;
		this.codColecao = codColecao;
		this.colecao = colecao;
		this.idCor = idCor;
		this.codCor = codCor;
		this.cor = cor;
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

	public String getLargura() {
		return largura;
	}

	public void setLargura(String largura) {
		this.largura = largura;
	}

	public String getUnidade() {
		return unidade;
	}

	public void setUnidade(String unidade) {
		this.unidade = unidade;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getIdColecao() {
		return idColecao;
	}

	public void setIdColecao(String idColecao) {
		this.idColecao = idColecao;
	}

	public String getCodColecao() {
		return codColecao;
	}

	public void setCodColecao(String codColecao) {
		this.codColecao = codColecao;
	}

	public String getColecao() {
		return colecao;
	}

	public void setColecao(String colecao) {
		this.colecao = colecao;
	}

	public String getIdCor() {
		return idCor;
	}

	public void setIdCor(String idCor) {
		this.idCor = idCor;
	}

	public String getCodCor() {
		return codCor;
	}

	public void setCodCor(String codCor) {
		this.codCor = codCor;
	}

	public String getCor() {
		return cor;
	}

	public void setCor(String cor) {
		this.cor = cor;
	}
}
