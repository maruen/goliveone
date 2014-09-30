package br.com.golive.filter;

public class NumberFilter extends GoliveFilter<Long> {

	private Long inicio;
	private Long fim;

	@Override
	public Long getInicio() {
		return inicio;
	}

	@Override
	public void setInicio(final Long inicio) {
		this.inicio = inicio;
	}

	@Override
	public Long getFim() {
		return fim;
	}

	@Override
	public void setFim(final Long fim) {
		this.fim = fim;
	}

}
