package br.com.golive.entity.perfilconfiguracao.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Transient;

@Embeddable
public class ColunaPerfilId implements Serializable {

	@Transient
	private static final long serialVersionUID = -4850543578021656523L;

	@Column(name = "tbUsuario_Id")
	private Long idUsuario;

	@Column(name = "TableName")
	private String tabela;

	@Column(name = "ColumnName")
	private String coluna;

	@Column(name = "PageBeanName")
	private String managedBeanName;

	public ColunaPerfilId() {
		super();
	}

	public ColunaPerfilId(final Long idUsuario, final String tabela, final String coluna, final String managedBeanName) {
		super();
		this.idUsuario = idUsuario;
		this.tabela = tabela;
		this.coluna = coluna;
		this.managedBeanName = managedBeanName;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = (prime * result) + ((coluna == null) ? 0 : coluna.hashCode());
		result = (prime * result) + ((idUsuario == null) ? 0 : idUsuario.hashCode());
		result = (prime * result) + ((managedBeanName == null) ? 0 : managedBeanName.hashCode());
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
		if (managedBeanName == null) {
			if (other.managedBeanName != null) {
				return false;
			}
		} else if (!managedBeanName.equals(other.managedBeanName)) {
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

	public Long getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(final Long idUsuario) {
		this.idUsuario = idUsuario;
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

	public String getManagedBeanName() {
		return managedBeanName;
	}

	public void setManagedBeanName(final String managedBeanName) {
		this.managedBeanName = managedBeanName;
	}

}