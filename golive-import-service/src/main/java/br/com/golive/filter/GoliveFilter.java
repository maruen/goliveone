package br.com.golive.filter;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

import br.com.golive.constants.TipoFiltro;

public abstract class GoliveFilter<T> {

	private TipoFiltro tipo;
	private Class<T> clazz;

	public GoliveFilter() {
		super();
		tipo = TipoFiltro.IGUAL;

		Type type = getClass().getGenericSuperclass();
		if (!(type instanceof ParameterizedType)) {
			type = this.getClass().getSuperclass().getGenericSuperclass();
		}
		try {
			clazz = (Class<T>) ((ParameterizedType) type).getActualTypeArguments()[0];
		} catch (final java.lang.ClassCastException e) {
			type = this.getClass().getSuperclass().getGenericSuperclass();
			clazz = (Class<T>) ((ParameterizedType) type).getActualTypeArguments()[0];
		}
	}

	public abstract T getInicio();

	public abstract T getFim();

	public abstract void setInicio(final T inicio);

	public abstract void setFim(final T fim);

	public TipoFiltro getTipo() {
		return tipo;
	}

	public void setTipo(final TipoFiltro tipo) {
		this.tipo = tipo;
	}

	public Class<T> getGenericType() {
		return clazz;
	}

	public TipoFiltro getIgual() {
		return TipoFiltro.IGUAL;
	}

	public TipoFiltro getMaior() {
		return TipoFiltro.MAIOR;
	}

	public TipoFiltro getMenor() {
		return TipoFiltro.MENOR;
	}

	public TipoFiltro getPeriodo() {
		return TipoFiltro.PERIODO;
	}

	public TipoFiltro getIntervalo() {
		return TipoFiltro.INTERVALO;
	}

	public TipoFiltro getContem() {
		return TipoFiltro.CONTEM;
	}
}
