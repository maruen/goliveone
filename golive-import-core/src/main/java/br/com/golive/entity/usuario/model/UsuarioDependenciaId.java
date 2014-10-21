package br.com.golive.entity.usuario.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Transient;

@Embeddable
public class UsuarioDependenciaId implements Serializable {

	@Transient
	private static final long serialVersionUID = -6949103089268523542L;

	@Column(name = "tbUsuario_Id", insertable = false, updatable = false)
	private Long tbUsuario_Id;

	@Column(name = "tbEmpresa_Id", insertable = false, updatable = false)
	private Long tbEmpresa_Id;

	@Column(name = "tbDatabase_Id", insertable = false, updatable = false)
	private Long tbDatabase_Id;

	@Column(name = "tbDatabaseUser_Id", insertable = false, updatable = false)
	private Long tbDatabaseUser_Id;

	@Column(name = "tbDatabaseAddress_Id", insertable = false, updatable = false)
	private Long tbDatabaseAddress_Id;

	public UsuarioDependenciaId() {
		super();
	}

	public UsuarioDependenciaId(final Long tbUsuario_Id, final Long tbEmpresa_Id, final Long tbDatabase_Id, final Long tbDatabaseUser_Id, final Long tbDatabaseAddress_Id) {
		super();
		this.tbUsuario_Id = tbUsuario_Id;
		this.tbEmpresa_Id = tbEmpresa_Id;
		this.tbDatabase_Id = tbDatabase_Id;
		this.tbDatabaseUser_Id = tbDatabaseUser_Id;
		this.tbDatabaseAddress_Id = tbDatabaseAddress_Id;
	}

	public Long getTbUsuario_Id() {
		return tbUsuario_Id;
	}

	public void setTbUsuario_Id(final Long tbUsuario_Id) {
		this.tbUsuario_Id = tbUsuario_Id;
	}

	public Long getTbEmpresa_Id() {
		return tbEmpresa_Id;
	}

	public void setTbEmpresa_Id(final Long tbEmpresa_Id) {
		this.tbEmpresa_Id = tbEmpresa_Id;
	}

	public Long getTbDatabase_Id() {
		return tbDatabase_Id;
	}

	public void setTbDatabase_Id(final Long tbDatabase_Id) {
		this.tbDatabase_Id = tbDatabase_Id;
	}

	public Long getTbDatabaseUser_Id() {
		return tbDatabaseUser_Id;
	}

	public void setTbDatabaseUser_Id(final Long tbDatabaseUser_Id) {
		this.tbDatabaseUser_Id = tbDatabaseUser_Id;
	}

	public Long getTbDatabaseAddress_Id() {
		return tbDatabaseAddress_Id;
	}

	public void setTbDatabaseAddress_Id(final Long tbDatabaseAddress_Id) {
		this.tbDatabaseAddress_Id = tbDatabaseAddress_Id;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = (prime * result) + ((tbDatabaseAddress_Id == null) ? 0 : tbDatabaseAddress_Id.hashCode());
		result = (prime * result) + ((tbDatabaseUser_Id == null) ? 0 : tbDatabaseUser_Id.hashCode());
		result = (prime * result) + ((tbDatabase_Id == null) ? 0 : tbDatabase_Id.hashCode());
		result = (prime * result) + ((tbEmpresa_Id == null) ? 0 : tbEmpresa_Id.hashCode());
		result = (prime * result) + ((tbUsuario_Id == null) ? 0 : tbUsuario_Id.hashCode());
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
		final UsuarioDependenciaId other = (UsuarioDependenciaId) obj;
		if (tbDatabaseAddress_Id == null) {
			if (other.tbDatabaseAddress_Id != null) {
				return false;
			}
		} else if (!tbDatabaseAddress_Id.equals(other.tbDatabaseAddress_Id)) {
			return false;
		}
		if (tbDatabaseUser_Id == null) {
			if (other.tbDatabaseUser_Id != null) {
				return false;
			}
		} else if (!tbDatabaseUser_Id.equals(other.tbDatabaseUser_Id)) {
			return false;
		}
		if (tbDatabase_Id == null) {
			if (other.tbDatabase_Id != null) {
				return false;
			}
		} else if (!tbDatabase_Id.equals(other.tbDatabase_Id)) {
			return false;
		}
		if (tbEmpresa_Id == null) {
			if (other.tbEmpresa_Id != null) {
				return false;
			}
		} else if (!tbEmpresa_Id.equals(other.tbEmpresa_Id)) {
			return false;
		}
		if (tbUsuario_Id == null) {
			if (other.tbUsuario_Id != null) {
				return false;
			}
		} else if (!tbUsuario_Id.equals(other.tbUsuario_Id)) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "UsuarioDependenciaId [tbUsuario_Id=" + tbUsuario_Id + ", tbEmpresa_Id=" + tbEmpresa_Id + ", tbDatabase_Id=" + tbDatabase_Id + ", tbDatabaseUser_Id=" + tbDatabaseUser_Id + ", tbDatabaseAddress_Id=" + tbDatabaseAddress_Id + "]";
	}



}