package br.com.golive.constants;

public enum TipoFiltroData {

	MENOR("label.menor.que"), MAIOR("label.maior.que"), IGUAL("label.igual");

	private String label;

	public String getLabel() {
		return label;
	}

	public void setLabel(final String label) {
		this.label = label;
	}

	private TipoFiltroData(final String label) {
		this.label = label;
	}

}
