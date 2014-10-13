package br.com.golive.bean.component;

import java.io.Serializable;

import javax.persistence.Transient;

import br.com.golive.filter.GoliveFilter;

public class ColunaPerfil implements Serializable {

	private static final long serialVersionUID = -161500950585892955L;

	private Long idUsuario;
	private Long ordem;
	private String tabela;
	private String coluna;
	private Boolean visibilidade;
	private String empresaSeleciona;

	@Transient
	private GoliveFilter filtro;

	public ColunaPerfil() {
		super();
	}

	public ColunaPerfil(final Long idUsuario, final Long ordem, final String tabela, final String coluna, final Boolean visibilidade, final String empresaSeleciona) {
		super();
		this.idUsuario = idUsuario;
		this.ordem = ordem;
		this.tabela = tabela;
		this.coluna = coluna;
		this.visibilidade = visibilidade;
		this.setEmpresaSeleciona(empresaSeleciona);
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

	public String getEmpresaSeleciona() {
		return empresaSeleciona;
	}

	public void setEmpresaSeleciona(final String empresaSeleciona) {
		this.empresaSeleciona = empresaSeleciona;
	}

	public GoliveFilter getFiltro() {
		return filtro;
	}

	public void setFiltro(final GoliveFilter filtro) {
		this.filtro = filtro;
	}

}
