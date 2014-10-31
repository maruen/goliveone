package br.com.golive.entity.perfilconfiguracao.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;

@Data
@Entity
@Table(name = "tbConfiguracaoColunaPagina")
public class ColunaPerfil implements Serializable {

	@Transient
	private static final long serialVersionUID = -2992148672417370061L;

	@EmbeddedId
	private ColunaPerfilId id;

	@Column(name = "PatternFilter")
	private String padraoFiltro;

	@Column(name = "Ordernation")
	private Long ordem;

	@Column(name = "Visible")
	private boolean visivel;

	@Column(name = "WidthColumn")
	private Long width;

	public ColunaPerfil() {
		super();
	}

	public ColunaPerfil(final ColunaPerfilId id, final String padraoFiltro, final Long ordem, final boolean visivel, final Long width) {
		super();
		this.id = id;
		this.padraoFiltro = padraoFiltro;
		this.ordem = ordem;
		this.visivel = visivel;
		this.width = width;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = (prime * result) + ((id == null) ? 0 : id.hashCode());
		result = (prime * result) + ((ordem == null) ? 0 : ordem.hashCode());
		result = (prime * result) + ((padraoFiltro == null) ? 0 : padraoFiltro.hashCode());
		result = (prime * result) + (visivel ? 1231 : 1237);
		result = (prime * result) + ((width == null) ? 0 : width.hashCode());
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
		final ColunaPerfil other = (ColunaPerfil) obj;
		if (id == null) {
			if (other.id != null) {
				return false;
			}
		} else if (!id.equals(other.id)) {
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
		if (visivel != other.visivel) {
			return false;
		}
		if (width == null) {
			if (other.width != null) {
				return false;
			}
		} else if (!width.equals(other.width)) {
			return false;
		}
		return true;
	}

}
