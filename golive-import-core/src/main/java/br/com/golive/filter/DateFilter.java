package br.com.golive.filter;

import java.util.Date;

import br.com.golive.constants.TipoFiltroData;

public class DateFilter extends GoliveFilter {

	private String nome;

	private Date inicio;
	private Date fim;

	public DateFilter() {
		super();
		tipo = TipoFiltroData.IGUAL;
	}

	public Date getInicio() {
		return inicio;
	}

	public void setInicio(final Date inicio) {
		this.inicio = inicio;
	}

	public Date getFim() {
		return fim;
	}

	public void setFim(final Date fim) {
		this.fim = fim;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(final String nome) {
		this.nome = nome;
	}

}
