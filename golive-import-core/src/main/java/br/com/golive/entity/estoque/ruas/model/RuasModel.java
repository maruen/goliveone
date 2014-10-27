package br.com.golive.entity.estoque.ruas.model;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "Ruas", 
		nomeDoArquivoGerado = "Ruas", 
		nomeArquivoJasper = "Ruas")
public class RuasModel extends Model {

	private static final long serialVersionUID = 1L;

	private String rua;
	private String idPavimento;
	private String pavimento;

	public RuasModel() {
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}

	public RuasModel(Long id, 
					 Calendar dataInclusao, 
					 Calendar dataAlteracao,
					 String rua, 
					 String idPavimento,
					 String pavimento) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.rua = rua;
		this.idPavimento = idPavimento;
		this.pavimento = pavimento;
	}

	public String getRua() {
		return rua;
	}

	public void setRua(String rua) {
		this.rua = rua;
	}

	public String getIdPavimento() {
		return idPavimento;
	}

	public void setIdPavimento(String idPavimento) {
		this.idPavimento = idPavimento;
	}

	public String getPavimento() {
		return pavimento;
	}

	public void setPavimento(String pavimento) {
		this.pavimento = pavimento;
	}
}
