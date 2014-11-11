package br.com.golive.filter;

import java.util.Date;

public class DateFilter extends GoliveFilter<Date> {

	private Date inicio;
	private Date fim;

	@Override
	public Date getInicio() {
		return inicio;
	}

	@Override
	public void setInicio(final Date inicio) {
		this.inicio = inicio;
	}

	@Override
	public Date getFim() {
		return fim;
	}

	@Override
	public void setFim(final Date fim) {
		this.fim = fim;
	}

}
