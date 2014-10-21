package br.com.golive.entity.padroesespessura;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "PadroesEspessura", 
		nomeDoArquivoGerado = "file.name.model", 
		nomeArquivoJasper = "PadroesEspessura")
public class PadroesEspessuraModel extends Model{
	
	private static final long serialVersionUID = 1L;
	
	
	private String espessura;
	private String unidade;
	private String descricao;
	private String idColecao;
	private String codColecao;
	private String colecao;
	private String idCor;
	private String codCor;
	private String cor;

	public PadroesEspessuraModel() {
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}

	public PadroesEspessuraModel(Long id, 
								 Calendar dataInclusao, 
								 Calendar dataAlteracao,
								 String espessura,
								 String unidade,
								 String descricao,
								 String idColecao,
								 String codColecao,
								 String colecao,
								 String idCor,
								 String codCor,
								 String cor) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.espessura = espessura;
		this.unidade = unidade;
		this.descricao = descricao;
		this.idColecao = idColecao;
		this.codColecao = codColecao;
		this.colecao = colecao;
		this.idCor = idCor;
		this.codCor = codCor;
		this.cor = cor;
	}

	public String getEspessura() {
		return espessura;
	}

	public void setEspessura(String espessura) {
		this.espessura = espessura;
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
