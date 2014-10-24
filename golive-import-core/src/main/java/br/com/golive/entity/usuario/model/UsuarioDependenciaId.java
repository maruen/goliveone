package br.com.golive.entity.usuario.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Transient;

@Embeddable
public class UsuarioDependenciaId implements Serializable {

	@Transient
	private static final long serialVersionUID = 7198573869537771373L;

	@Column(name = "tbUsuario_Id", insertable = false, updatable = false)
	private Long tbUsuario;

	@Column(name = "tbEmpresa_Id", insertable = false, updatable = false)
	private Long tbEmpresa;

	@Column(name = "tbDatabase_Id", insertable = false, updatable = false)
	private Long tbDatabase;

	@Column(name = "tbDatabaseUser_Id", insertable = false, updatable = false)
	private Long tbDatabaseUser;

	@Column(name = "tbDatabaseAddress_Id", insertable = false, updatable = false)
	private Long tbDatabaseAddress;

	public UsuarioDependenciaId() {
		super();
	}

	public UsuarioDependenciaId(final Long tbUsuario, final Long tbEmpresa, final Long tbDatabase, final Long tbDatabaseUser, final Long tbDatabaseAddress) {
		super();
		this.tbUsuario = tbUsuario;
		this.tbEmpresa = tbEmpresa;
		this.tbDatabase = tbDatabase;
		this.tbDatabaseUser = tbDatabaseUser;
		this.tbDatabaseAddress = tbDatabaseAddress;
	}

	public Long getTbUsuario() {
		return tbUsuario;
	}

	public void setTbUsuario(final Long tbUsuario) {
		this.tbUsuario = tbUsuario;
	}

	public Long getTbEmpresa() {
		return tbEmpresa;
	}

	public void setTbEmpresa(final Long tbEmpresa) {
		this.tbEmpresa = tbEmpresa;
	}

	public Long getTbDatabase() {
		return tbDatabase;
	}

	public void setTbDatabase(final Long tbDatabase) {
		this.tbDatabase = tbDatabase;
	}

	public Long getTbDatabaseUser() {
		return tbDatabaseUser;
	}

	public void setTbDatabaseUser(final Long tbDatabaseUser) {
		this.tbDatabaseUser = tbDatabaseUser;
	}

	public Long getTbDatabaseAddress() {
		return tbDatabaseAddress;
	}

	public void setTbDatabaseAddress(final Long tbDatabaseAddress) {
		this.tbDatabaseAddress = tbDatabaseAddress;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = (prime * result) + ((tbDatabase == null) ? 0 : tbDatabase.hashCode());
		result = (prime * result) + ((tbDatabaseAddress == null) ? 0 : tbDatabaseAddress.hashCode());
		result = (prime * result) + ((tbDatabaseUser == null) ? 0 : tbDatabaseUser.hashCode());
		result = (prime * result) + ((tbEmpresa == null) ? 0 : tbEmpresa.hashCode());
		result = (prime * result) + ((tbUsuario == null) ? 0 : tbUsuario.hashCode());
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
		if (tbDatabase == null) {
			if (other.tbDatabase != null) {
				return false;
			}
		} else if (!tbDatabase.equals(other.tbDatabase)) {
			return false;
		}
		if (tbDatabaseAddress == null) {
			if (other.tbDatabaseAddress != null) {
				return false;
			}
		} else if (!tbDatabaseAddress.equals(other.tbDatabaseAddress)) {
			return false;
		}
		if (tbDatabaseUser == null) {
			if (other.tbDatabaseUser != null) {
				return false;
			}
		} else if (!tbDatabaseUser.equals(other.tbDatabaseUser)) {
			return false;
		}
		if (tbEmpresa == null) {
			if (other.tbEmpresa != null) {
				return false;
			}
		} else if (!tbEmpresa.equals(other.tbEmpresa)) {
			return false;
		}
		if (tbUsuario == null) {
			if (other.tbUsuario != null) {
				return false;
			}
		} else if (!tbUsuario.equals(other.tbUsuario)) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "UsuarioDependenciaId [tbUsuario=" + tbUsuario + ", tbEmpresa=" + tbEmpresa + ", tbDatabase=" + tbDatabase + ", tbDatabaseUser=" + tbDatabaseUser + ", tbDatabaseAddress=" + tbDatabaseAddress + "]";
	}

}