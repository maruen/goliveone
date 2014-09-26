package br.com.golive.filter;

import java.util.Date;

import lombok.Data;

@Data
public class DateFilter extends GoliveFilter {

	private Date inicio;
	private Date fim;

	public DateFilter() {
		super();
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

}
