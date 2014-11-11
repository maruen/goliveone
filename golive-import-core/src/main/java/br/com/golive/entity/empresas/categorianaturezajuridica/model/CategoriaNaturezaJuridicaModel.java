package br.com.golive.entity.empresas.categorianaturezajuridica.model;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;


@Jasper(titulo = "CategoriasNaturezasJuridicas", 
		nomeDoArquivoGerado = "CategoriasNaturezasJuridicas", 
		nomeArquivoJasper = "CategoriasNaturezasJuridicas")	

public class CategoriaNaturezaJuridicaModel extends Model {
	
	private static final long serialVersionUID = 1L;
	
	private Long codCatNatJur;
	private String categoriaNaturezaJuridica;
	
	public CategoriaNaturezaJuridicaModel(){
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}
	
	public CategoriaNaturezaJuridicaModel(Long id, 
											 Calendar dataAlteracao, 
											 Calendar dataInclusao, 
											 Long codCatNatJur, 
											 String categoriaNaturezaJuridica){
		super();
		this.id = id;
		this.dataAlteracao = dataAlteracao;
		this.dataInclusao = dataInclusao;
		this.codCatNatJur = codCatNatJur;
		this.categoriaNaturezaJuridica = categoriaNaturezaJuridica;
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
