package br.com.golive.utils;

import java.util.Date;

import lombok.Data;
import br.com.golive.constants.TipoFiltroData;

@Data
public class DateFilter {

	private final String fieldManagedBean;
	private Date inicio;
	private Date fim;
	private TipoFiltroData tipo;

	public DateFilter(final String fieldManagedBean) {
		super();
		this.fieldManagedBean = fieldManagedBean;
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

	public TipoFiltroData getTipo() {
		return tipo;
	}

	public void setTipo(final TipoFiltroData tipo) {
		this.tipo = tipo;
	}

	public String getFieldManagedBean() {
		return fieldManagedBean;
	}
}
