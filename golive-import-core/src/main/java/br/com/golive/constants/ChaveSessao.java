package br.com.golive.constants;


public enum ChaveSessao {

	USUARIO_LOGADO("usuarioLogado"),
	ULTIMA_PAGINA("lastPage"),
	EMPRESA_SELECIONADA("empresaSelecionada");

	private String chave;

	private ChaveSessao(final String chave) {
		this.chave = chave;
	}

	public String getChave() {
		return chave;
	}

	public void setChave(final String chave) {
		this.chave = chave;
	}

}
