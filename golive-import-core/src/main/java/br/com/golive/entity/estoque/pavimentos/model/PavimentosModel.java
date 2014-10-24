package br.com.golive.entity.estoque.pavimentos.model;

import java.util.Calendar;

import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;

@Jasper(titulo = "Pavimentos", 
		nomeDoArquivoGerado = "Pavimentos", 
		nomeArquivoJasper = "Pavimentos")
public class PavimentosModel extends Model {

	private static final long serialVersionUID = 1L;

	private String pavimento;

	public PavimentosModel() {
		this.dataInclusao = Calendar.getInstance();
		this.dataAlteracao = Calendar.getInstance();
	}

	public PavimentosModel(Long id, 
						   Calendar dataInclusao,
						   Calendar dataAlteracao, 
						   String paviemtno) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.pavimento = paviemtno;
	}

	public String getPavimento() {
		return pavimento;
	}

	public void setPavimento(String pavimento) {
		this.pavimento = pavimento;
	}
}
