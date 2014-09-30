package br.com.golive.constants;

public enum TipoFiltro {

	CONTEM("label.contem"), INTERVALO("label.intervalo"), MENOR("label.menor.que"), MAIOR("label.maior.que"), IGUAL("label.igual"), PERIODO("label.periodo");

	private String label;

	public String getLabel() {
		return label;
	}

	public void setLabel(final String label) {
		this.label = label;
	}

	private TipoFiltro(final String label) {
		this.label = label;
	}

}
