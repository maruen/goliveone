package br.com.golive.entity.perfilconfiguracao.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Transient;

@Embeddable
public class ColunaPerfilId implements Serializable {

	@Transient
	private static final long serialVersionUID = 3599153101483962156L;

	@Column(name = "tbUsuario_Id")
	private Long idUsuario;

	@Column(name = "Ordernation")
	private Long ordem;

	@Column(name = "TableName")
	private String tabela;

	@Column(name = "ColumnName")
	private String coluna;

	@Column(name = "PatternFilter")
	private String padraoFiltro;

	public ColunaPerfilId() {
		super();
	}

	public ColunaPerfilId(final Long idUsuario, final Long ordem, final String tabela, final String coluna, final String padraoFiltro) {
		super();
		this.idUsuario = idUsuario;
		this.ordem = ordem;
		this.tabela = tabela;
		this.coluna = coluna;
		this.padraoFiltro = padraoFiltro;
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

	public String getPadraoFiltro() {
		return padraoFiltro;
	}

	public void setPadraoFiltro(final String padraoFiltro) {
		this.padraoFiltro = padraoFiltro;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = (prime * result) + ((coluna == null) ? 0 : coluna.hashCode());
		result = (prime * result) + ((idUsuario == null) ? 0 : idUsuario.hashCode());
		result = (prime * result) + ((ordem == null) ? 0 : ordem.hashCode());
		result = (prime * result) + ((padraoFiltro == null) ? 0 : padraoFiltro.hashCode());
		result = (prime * result) + ((tabela == null) ? 0 : tabela.hashCode());
		return result;
	}

	@Override
	public boolean equals(final Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		final ColunaPerfilId other = (ColunaPerfilId) obj;
		if (coluna == null) {
			if (other.coluna != null) {
				return false;
			}
		} else if (!coluna.equals(other.coluna)) {
			return false;
		}
		if (idUsuario == null) {
			if (other.idUsuario != null) {
				return false;
			}
		} else if (!idUsuario.equals(other.idUsuario)) {
			return false;
		}
		if (ordem == null) {
			if (other.ordem != null) {
				return false;
			}
		} else if (!ordem.equals(other.ordem)) {
			return false;
		}
		if (padraoFiltro == null) {
			if (other.padraoFiltro != null) {
				return false;
			}
		} else if (!padraoFiltro.equals(other.padraoFiltro)) {
			return false;
		}
		if (tabela == null) {
			if (other.tabela != null) {
				return false;
			}
		} else if (!tabela.equals(other.tabela)) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "ColunaPerfilId [idUsuario=" + idUsuario + ", ordem=" + ordem + ", tabela=" + tabela + ", coluna=" + coluna + ", padraoFiltro=" + padraoFiltro + "]";
	}

}