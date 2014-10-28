package br.com.golive.entity.subgrupoprodutos.model;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "SubGrupoProdutos", nomeDoArquivoGerado = "file.name.model", nomeArquivoJasper = "SubGrupoProdutos")
public class SubGrupoProdutoModel extends Model {

	
	private static final long serialVersionUID = 1L;

	private String departamento;
	private String idGrupoProdutos;
	private String grupoProdutos;
	private String idSubGrupoProdutos;
	private String subGrupoProdutos;
	
	public SubGrupoProdutoModel(Long id,
								Calendar dataInclusao,
								Calendar dataAlteracao,
								String departamento,
								String idGrupoProdutos,
								String grupoProdutos,
								String idSubGrupoProdutos,
								String subGrupoProdutos) {
		
		
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

	public void setDepartamento(final String departamento) {
		this.departamento = departamento;
	}

	public String getIdGrupoProdutos() {
		return idGrupoProdutos;
	}

	public void setIdGrupoProdutos(final String idGrupoProdutos) {
		this.idGrupoProdutos = idGrupoProdutos;
	}

	public String getGrupoProdutos() {
		return grupoProdutos;
	}

	public void setGrupoProdutos(final String grupoProdutos) {
		this.grupoProdutos = grupoProdutos;
	}

	public String getIdSubGrupoProdutos() {
		return idSubGrupoProdutos;
	}

	public void setIdSubGrupoProdutos(final String idSubGrupoProdutos) {
		this.idSubGrupoProdutos = idSubGrupoProdutos;
	}

	public String getSubGrupoProdutos() {
		return subGrupoProdutos;
	}

	public void setSubGrupoProdutos(final String subGrupoProdutos) {
		this.subGrupoProdutos = subGrupoProdutos;
	}
}