package br.com.golive.filter;

public class DoubleFilter extends GoliveFilter<Double> {

	private Double inicio;
	private Double fim;

	@Override
	public Double getInicio() {
		return inicio;
	}

	@Override
	public void setInicio(final Double inicio) {
		this.inicio = inicio;
	}

	@Override
	public Double getFim() {
		return fim;
	}

	@Override
	public void setFim(final Double fim) {
		this.fim = fim;
	}

}
