package br.com.golive.entity.grupoprodutos;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;

@Data
@EqualsAndHashCode(callSuper = false)
@Jasper(titulo = "GrupoProdutos", 
		nomeDoArquivoGerado = "GrupoProdutos", 
		nomeArquivoJasper = "GrupoProdutos")
public class GrupoProdutosModel {

	private Long id;
	private Date dataInclusao;
	private Date dataAlteracao;
	private String departamento;
	private String idGrupoProdutos;
	private String grupoProdutos;

	public GrupoProdutosModel() {
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}

	public GrupoProdutosModel(Long id, Date dataInclusao, Date dataAlteracao, 
							  String departamento, String idGrupoProdutos, 
							  String grupoProdutos) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.departamento = departamento;
		this.idGrupoProdutos = idGrupoProdutos;
		this.grupoProdutos = grupoProdutos;
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

	public String getDepartamento() {
		return departamento;
	}

	public void setDepartamento(String departamento) {
		this.departamento = departamento;
	}

	public String getIdGrupoProdutos() {
		return idGrupoProdutos;
	}

	public void setIdGrupoProdutos(String idGrupoProdutos) {
		this.idGrupoProdutos = idGrupoProdutos;
	}

	public String getGrupoProdutos() {
		return grupoProdutos;
	}

	public void setGrupoProdutos(String grupoProdutos) {
		this.grupoProdutos = grupoProdutos;
	}
}