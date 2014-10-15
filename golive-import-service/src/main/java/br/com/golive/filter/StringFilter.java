package br.com.golive.filter;

public class StringFilter extends GoliveFilter<String> {

	private String inicio;

	@Override
	public String getInicio() {
		return inicio;
	}

	@Override
	public String getFim() {
		return inicio;
	}

	@Override
	public void setInicio(final String inicio) {
		this.inicio = inicio;
	}

	@Override
	public void setFim(final String fim) {
		this.inicio = fim;
	}

}
