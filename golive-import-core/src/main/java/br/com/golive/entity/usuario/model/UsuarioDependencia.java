package br.com.golive.entity.usuario.model;

import java.io.Serializable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * The persistent class for the tbUsuario_Dependencies database table.
 * 
 */
@Entity
@Table(name = "tbUsuario_Dependencies")
@NamedQuery(name = "tbUsuario_Dependency.findAll", query = "SELECT t FROM UsuarioDependencia t")
public class UsuarioDependencia implements Serializable {

	@Transient
	private static final long serialVersionUID = -3829930931317965724L;

	@EmbeddedId
	private UsuarioDependenciaId id;

	public UsuarioDependencia() {
		super();
	}

	public UsuarioDependencia(final UsuarioDependenciaId id) {
		super();
		this.id = id;
	}

	public UsuarioDependenciaId getId() {
		return id;
	}

	public void setId(final UsuarioDependenciaId id) {
		this.id = id;
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
		final UsuarioDependencia other = (UsuarioDependencia) obj;
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
		return "UsuarioDependencia [id=" + id + "]";
	}

}