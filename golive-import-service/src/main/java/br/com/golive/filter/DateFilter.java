package br.com.golive.filter;

import java.util.Calendar;

public class DateFilter extends GoliveFilter<Calendar> {

	private Calendar inicio;
	private Calendar fim;

	@Override
	public Calendar getInicio() {
		return inicio;
	}

	@Override
	public void setInicio(final Calendar inicio) {
		this.inicio = inicio;
	}

	@Override
	public Calendar getFim() {
		return fim;
	}

	@Override
	public void setFim(final Calendar fim) {
		this.fim = fim;
	}

}
