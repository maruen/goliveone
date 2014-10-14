package br.com.golive.constants;

public enum TipoFiltro {

	CONTEM("label.contem", "contem"),
	INTERVALO("label.intervalo", "intervalo"),
	MENOR("label.menor.que", "menor"),
	MAIOR("label.maior.que", "maior"),
	IGUAL("label.igual", "igual"),
	PERIODO("label.periodo", "periodo");

	private String label;

	private String descricao;

	public String getLabel() {
		return label;
	}

	public void setLabel(final String label) {
		this.label = label;
	}

	private TipoFiltro(final String label, final String descricao) {
		this.label = label;
		this.descricao = descricao;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(final String descricao) {
		this.descricao = descricao;
	}

	public static TipoFiltro obterPorDescricao(final String descricao) {
		if ((descricao == null) && (descricao.isEmpty())) {
			return TipoFiltro.IGUAL;
		}
		for (final TipoFiltro tipo : TipoFiltro.values()) {
			if (tipo.getDescricao().equals(descricao)) {
				return tipo;
			}
		}
		return TipoFiltro.IGUAL;
	}

}
