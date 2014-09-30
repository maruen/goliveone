package br.com.golive.filter;

import java.util.Date;

public class DateFilter extends GoliveFilter<Date> {

	private Date inicio;
	private Date fim;

	// public DateFilter() {
	// super();
	// tipo = TipoFiltroData.IGUAL;
	// }

	@Override
	public Date getInicio() {
		return inicio;
	}

	public void setInicio(final Date inicio) {
		this.inicio = inicio;
	}

	@Override
	public Date getFim() {
		return fim;
	}

	public void setFim(final Date fim) {
		this.fim = fim;
	}

}
