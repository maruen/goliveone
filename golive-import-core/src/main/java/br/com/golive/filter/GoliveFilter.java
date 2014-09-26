package br.com.golive.filter;

import br.com.golive.constants.TipoFiltroData;

public abstract class GoliveFilter {

	protected TipoFiltroData tipo;

	public TipoFiltroData getTipo() {
		return tipo;
	}

	public void setTipo(final TipoFiltroData tipo) {
		this.tipo = tipo;
	}

}
