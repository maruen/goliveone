package br.com.golive.entity.areaDeAtuacao;

import java.io.Serializable;
import java.util.Calendar;

import lombok.Data;
import br.com.golive.annotation.Label;

@Label(name = "label.dadosGerais")
@Data
public class Cadastro implements Serializable {
	
	private static final long serialVersionUID = -7415246692175931894L;

	@Label(name = "label.id")
	private Long id;

	@Label(name = "label.inclusao")
	private Calendar dataInclusao;

	@Label(name = "label.ultimaAlteracao")
	private Calendar dataAlteracao;

	@Label(name = "label.descricao")
	private String areaDeAtuacao;

	public Cadastro(final Long id, final Calendar dataInclusao, final Calendar dataAlteracao, final String areaDeAtuacao) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.areaDeAtuacao = areaDeAtuacao;
	}

	
}
