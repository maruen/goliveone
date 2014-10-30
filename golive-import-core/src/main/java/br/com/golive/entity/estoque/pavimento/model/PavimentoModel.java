package br.com.golive.entity.estoque.pavimento.model;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "Pavimentos", 
		nomeDoArquivoGerado = "Pavimentos", 
		nomeArquivoJasper = "Pavimentos")
public class PavimentoModel extends Model {

	private static final long serialVersionUID = 1L;

	private String pavimento;

	public PavimentoModel() {
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}

	public PavimentoModel(Long id, 
						   Calendar dataInclusao,
						   Calendar dataAlteracao, 
						   String pavimento) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.pavimento = pavimento;
	}

	public String getPavimento() {
		return pavimento;
	}

	public void setPavimento(String pavimento) {
		this.pavimento = pavimento;
	}
}
