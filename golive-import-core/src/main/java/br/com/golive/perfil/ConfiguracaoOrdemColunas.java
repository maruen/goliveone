package br.com.golive.perfil;

import java.io.Serializable;

public class ConfiguracaoOrdemColunas implements Serializable {

	private static final long serialVersionUID = -161500950585892955L;

	private Long idUsuario;
	private Long ordem;
	private String tabela;
	private String coluna;
	private Boolean visibilidade;

	public ConfiguracaoOrdemColunas() {
		super();
	}

	public ConfiguracaoOrdemColunas(final Long idUsuario, final Long ordem, final String tabela, final String coluna, final Boolean visibilidade) {
		super();
		this.idUsuario = idUsuario;
		this.ordem = ordem;
		this.tabela = tabela;
		this.coluna = coluna;
		this.visibilidade = visibilidade;
	}

	public Long getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(final Long idUsuario) {
		this.idUsuario = idUsuario;
	}

	public Long getOrdem() {
		return ordem;
	}

	public void setOrdem(final Long ordem) {
		this.ordem = ordem;
	}

	public String getTabela() {
		return tabela;
	}

	public void setTabela(final String tabela) {
		this.tabela = tabela;
	}

	public String getColuna() {
		return coluna;
	}

	public void setColuna(final String coluna) {
		this.coluna = coluna;
	}

	public Boolean getVisibilidade() {
		return visibilidade;
	}

	public void setVisibilidade(final Boolean visibilidade) {
		this.visibilidade = visibilidade;
	}


}
