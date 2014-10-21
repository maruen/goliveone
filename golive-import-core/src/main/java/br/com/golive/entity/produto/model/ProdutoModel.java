package br.com.golive.entity.produto.model;

import java.util.Calendar;
import java.util.List;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;


@Jasper(titulo="Produto",
		nomeDoArquivoGerado="Produto",
		nomeArquivoJasper ="Produto"
		)

public class ProdutoModel extends Model{
	
	private static final long serialVersionUID = 1L;
	
	
	private Long 		 codigoProduto;
	private String 		 descricaoProduto;
	private List<String> unidades;
	private List<String> codigos;
	private List<String> descricoes;
	private List<String> colecoes;
	private List<String> codigoBarras;
	private List<String> cores;
	private List<String> padraoLargura;
	private List<String> padraoEspessura;

	public ProdutoModel() {
		this.dataInclusao 	= Calendar.getInstance();
		this.dataAlteracao 	= Calendar.getInstance();
	}
	
	public ProdutoModel(Long id, Calendar dataInclusao, Calendar dataAlteracao) {
		super();
		this.id = id;
		this.dataInclusao 	= Calendar.getInstance();
		this.dataAlteracao 	= Calendar.getInstance();
	}
	
	public Long getCodigoProduto() {
		return codigoProduto;
	}

	public void setCodigoProduto(Long codigoProduto) {
		this.codigoProduto = codigoProduto;
	}

	public String getDescricaoProduto() {
		return descricaoProduto;
	}

	public void setDescricaoProduto(String descricaoProduto) {
		this.descricaoProduto = descricaoProduto;
	}

	public List<String> getUnidades() {
		return unidades;
	}

	public void setUnidades(List<String> unidades) {
		this.unidades = unidades;
	}

	public List<String> getCodigos() {
		return codigos;
	}

	public void setCodigos(List<String> codigos) {
		this.codigos = codigos;
	}

	public List<String> getDescricoes() {
		return descricoes;
	}

	public void setDescricoes(List<String> descricoes) {
		this.descricoes = descricoes;
	}

	public List<String> getColecoes() {
		return colecoes;
	}

	public void setColecoes(List<String> colecoes) {
		this.colecoes = colecoes;
	}

	public List<String> getCodigoBarras() {
		return codigoBarras;
	}

	public void setCodigoBarras(List<String> codigoBarras) {
		this.codigoBarras = codigoBarras;
	}

	public List<String> getCores() {
		return cores;
	}

	public void setCores(List<String> cores) {
		this.cores = cores;
	}

	public List<String> getPadraoLargura() {
		return padraoLargura;
	}

	public void setPadraoLargura(List<String> padraoLargura) {
		this.padraoLargura = padraoLargura;
	}

	public List<String> getPadraoEspessura() {
		return padraoEspessura;
	}

	public void setPadraoEspessura(List<String> padraoEspessura) {
		this.padraoEspessura = padraoEspessura;
	}

	
}
