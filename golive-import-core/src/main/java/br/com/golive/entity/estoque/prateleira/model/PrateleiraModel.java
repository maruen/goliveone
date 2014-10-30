package br.com.golive.entity.estoque.prateleira.model;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "Prateleiras", 
		nomeDoArquivoGerado = "Prateleiras", 
		nomeArquivoJasper = "Prateleiras")
public class PrateleiraModel extends Model {

	private static final long serialVersionUID = 1L;

	private String prateleira;
	private String idRua;
	private String rua;
	private String idPavimento;
	private String pavimento;

	public PrateleiraModel() {
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}

	public PrateleiraModel(Long id,
							Calendar dataInclusao,
							Calendar dataAlteracao,
							String prateleira, 
							String idRua, 
							String rua,
							String idPavimento, 
							String pavimento) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.prateleira = prateleira;
		this.idRua = idRua;
		this.rua = rua;
		this.idPavimento = idPavimento;
		this.pavimento = pavimento;
	}

	public String getPrateleira() {
		return prateleira;
	}

	public void setPrateleira(String prateleira) {
		this.prateleira = prateleira;
	}

	public String getIdRua() {
		return idRua;
	}

	public void setIdRua(String idRua) {
		this.idRua = idRua;
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
