package br.com.golive.entity.empresas.categoriasnaturezasjuridicas;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;

@Data
@EqualsAndHashCode(callSuper = false)
@Jasper(titulo = "CategoriasNaturezasJuridicas", 
		nomeDoArquivoGerado = "CategoriasNaturezasJuridicas", 
		nomeArquivoJasper = "CategoriasNaturezasJuridicas")	
public class CategoriasNaturezasJuridicasModel {
	private Date dataInclusao;
	private Date dataAlteracao;
	private Long id;
	private Long codCatNatJur;
	private String categoriaNaturezaJuridica;
	
	public CategoriasNaturezasJuridicasModel(){
		this.dataInclusao = new Date();
		this.dataAlteracao = new Date();
	}
	
	public CategoriasNaturezasJuridicasModel(Long id, 
											 Date dataAlteracao, 
											 Date dataInclusao, 
											 Long codCatNatJur, 
											 String categoriaNaturezaJuridica){
		super();
		this.id = id;
		this.dataAlteracao = dataAlteracao;
		this.dataInclusao = dataInclusao;
		this.codCatNatJur = codCatNatJur;
		this.categoriaNaturezaJuridica = categoriaNaturezaJuridica;
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

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getCodCatNatJur() {
		return codCatNatJur;
	}

	public void setCodCatNatJur(Long codCatNatJur) {
		this.codCatNatJur = codCatNatJur;
	}

	public String getCategoriaNaturezaJuridica() {
		return categoriaNaturezaJuridica;
	}

	public void setCategoriaNaturezaJuridica(String categoriaNaturezaJuridica) {
		this.categoriaNaturezaJuridica = categoriaNaturezaJuridica;
	}
}
