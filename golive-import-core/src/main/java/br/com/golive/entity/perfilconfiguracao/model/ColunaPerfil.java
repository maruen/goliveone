package br.com.golive.entity.perfilconfiguracao.model;

import java.io.Serializable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "tbConfiguracaoColunaPagina")
public class ColunaPerfil implements Serializable {

	@Transient
	private static final long serialVersionUID = 6175331955969934865L;

	@EmbeddedId
	private ColunaPerfilId id;

	public ColunaPerfil() {
		super();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = (prime * result) + ((id == null) ? 0 : id.hashCode());
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
		return true;
	}

	@Override
	public String toString() {
		return "ColunaPerfil [id=" + id + "]";
	}

	public ColunaPerfil(final ColunaPerfilId id) {
		super();
		this.id = id;
	}

	public ColunaPerfilId getId() {
		return id;
	}

	public void setId(final ColunaPerfilId id) {
		this.id = id;
	}

}
