package br.com.golive.entity.usuario.model;

import java.io.Serializable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Transient;

import br.com.golive.entity.database.model.DataBase;
import br.com.golive.entity.database.model.EnderecoBase;
import br.com.golive.entity.database.model.UsuarioBaseDados;
import br.com.golive.entity.empresas.empresa.model.Empresa;

/**
 * The persistent class for the tbUsuario_Dependencies database table.
 * 
 */
@Entity
@Table(name = "tbUsuario_Dependencies")
@NamedQuery(name = "tbUsuario_Dependency.findAll", query = "SELECT t FROM UsuarioDependencia t")
public class UsuarioDependencia implements Serializable {

	@Transient
	private static final long serialVersionUID = 7395274085994417268L;

	@EmbeddedId
	private UsuarioDependenciaId id;

	@ManyToOne
	private Usuario tbUsuario;

	@ManyToOne
	private Empresa tbEmpresa;

	@ManyToOne
	private DataBase tbDatabase;

	@ManyToOne
	private UsuarioBaseDados tbDatabaseUser;

	@ManyToOne
	private EnderecoBase tbDatabaseAddress;

	public UsuarioDependencia() {
		super();
	}

	public UsuarioDependencia(final UsuarioDependenciaId id, final Usuario tbUsuario, final Empresa tbEmpresa, final DataBase tbDatabase, final UsuarioBaseDados tbDatabaseUser, final EnderecoBase tbDatabaseAddress) {
		super();
		this.id = id;
		this.tbUsuario = tbUsuario;
		this.tbEmpresa = tbEmpresa;
		this.tbDatabase = tbDatabase;
		this.tbDatabaseUser = tbDatabaseUser;
		this.tbDatabaseAddress = tbDatabaseAddress;
	}

	public UsuarioDependenciaId getId() {
		return id;
	}

	public void setId(final UsuarioDependenciaId id) {
		this.id = id;
	}

	public Usuario getTbUsuario() {
		return tbUsuario;
	}

	public void setTbUsuario(final Usuario tbUsuario) {
		this.tbUsuario = tbUsuario;
	}

	public Empresa getTbEmpresa() {
		return tbEmpresa;
	}

	public void setTbEmpresa(final Empresa tbEmpresa) {
		this.tbEmpresa = tbEmpresa;
	}

	public DataBase getTbDatabase() {
		return tbDatabase;
	}

	public void setTbDatabase(final DataBase tbDatabase) {
		this.tbDatabase = tbDatabase;
	}

	public UsuarioBaseDados getTbDatabaseUser() {
		return tbDatabaseUser;
	}

	public void setTbDatabaseUser(final UsuarioBaseDados tbDatabaseUser) {
		this.tbDatabaseUser = tbDatabaseUser;
	}

	public EnderecoBase getTbDatabaseAddress() {
		return tbDatabaseAddress;
	}

	public void setTbDatabaseAddress(final EnderecoBase tbDatabaseAddress) {
		this.tbDatabaseAddress = tbDatabaseAddress;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = (prime * result) + ((id == null) ? 0 : id.hashCode());
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
		final UsuarioDependencia other = (UsuarioDependencia) obj;
		if (id == null) {
			if (other.id != null) {
				return false;
			}
		} else if (!id.equals(other.id)) {
			return false;
		}
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
		return "UsuarioDependencia [id=" + id + ", tbUsuario=" + tbUsuario + ", tbEmpresa=" + tbEmpresa + ", tbDatabase=" + tbDatabase + ", tbDatabaseUser=" + tbDatabaseUser + ", tbDatabaseAddress=" + tbDatabaseAddress + "]";
	}

}