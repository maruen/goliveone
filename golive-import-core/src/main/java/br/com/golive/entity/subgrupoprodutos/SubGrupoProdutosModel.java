package br.com.golive.entity.subgrupoprodutos;

import java.util.Date;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "SubGrupoProdutos", 
		nomeDoArquivoGerado = "file.name.model", 
		nomeArquivoJasper = "SubGrupoProdutos")

public class SubGrupoProdutosModel extends Model {

	
	private static final long serialVersionUID = 1L;
	
	
	private String departamento;
	private String idGrupoProdutos;
	private String grupoProdutos;
	private String idSubGrupoProdutos;
	private String subGrupoProdutos;

	public SubGrupoProdutosModel() {
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}

	public SubGrupoProdutosModel(Long id, 
								 Date dataInclusao, 
								 Date dataAlteracao,
								 String departamento,
								 String idGrupoProdutos,
								 String grupoProdutos,
								 String idSubGrupoProdutos,
								 String subGrupoProdutos) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.departamento = departamento;
		this.idGrupoProdutos = idGrupoProdutos;
		this.grupoProdutos = grupoProdutos;
		this.idSubGrupoProdutos = idSubGrupoProdutos;
		this.subGrupoProdutos = subGrupoProdutos;
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

	public String getIdSubGrupoProdutos() {
		return idSubGrupoProdutos;
	}

	public void setIdSubGrupoProdutos(String idSubGrupoProdutos) {
		this.idSubGrupoProdutos = idSubGrupoProdutos;
	}

	public String getSubGrupoProdutos() {
		return subGrupoProdutos;
	}

	public void setSubGrupoProdutos(String subGrupoProdutos) {
		this.subGrupoProdutos = subGrupoProdutos;
	}
}