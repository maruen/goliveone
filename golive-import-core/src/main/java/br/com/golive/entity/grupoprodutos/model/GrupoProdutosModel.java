package br.com.golive.entity.grupoprodutos.model;

import java.util.Date;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "GrupoProdutos", 
		nomeDoArquivoGerado = "file.name.model", 
		nomeArquivoJasper = "GrupoProdutos")
public class GrupoProdutosModel extends Model{

	private static final long serialVersionUID = 1L;

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