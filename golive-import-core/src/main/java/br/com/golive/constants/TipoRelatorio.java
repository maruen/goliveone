package br.com.golive.constants;

public enum TipoRelatorio {
	PDF("pdf"), EXCEL("xls"), IMPRESSAO("impressao");

	private String extensao;

	private TipoRelatorio(final String extensao) {
		this.setExtensao(extensao);
	}

	public String getExtensao() {
		return extensao;
	}

	public void setExtensao(final String extensao) {
		this.extensao = extensao;
	}
}
