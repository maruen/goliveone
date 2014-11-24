package br.com.golive.entity.auditoria.model;

import java.io.Serializable;

import br.com.golive.entity.usuario.model.Usuario;

public class AuditoriaItemUsuarioId implements Serializable {

	private static final long serialVersionUID = 1L;

	private Usuario usuario;

	private AuditoriaItemModel item;

	private AuditoriaModel auditoriaModel;

	public AuditoriaItemUsuarioId() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AuditoriaItemUsuarioId(final Usuario usuario, final AuditoriaItemModel item, final AuditoriaModel auditoriaModel) {
		super();
		this.usuario = usuario;
		this.item = item;
		this.auditoriaModel = auditoriaModel;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(final Usuario usuario) {
		this.usuario = usuario;
	}

	public AuditoriaItemModel getItem() {
		return item;
	}

	public void setItem(final AuditoriaItemModel item) {
		this.item = item;
	}

	public AuditoriaModel getAuditoriaModel() {
		return auditoriaModel;
	}

	public void setAuditoriaModel(final AuditoriaModel auditoriaModel) {
		this.auditoriaModel = auditoriaModel;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = (prime * result) + ((auditoriaModel == null) ? 0 : auditoriaModel.hashCode());
		result = (prime * result) + ((item == null) ? 0 : item.hashCode());
		result = (prime * result) + ((usuario == null) ? 0 : usuario.hashCode());
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
		final AuditoriaItemUsuarioId other = (AuditoriaItemUsuarioId) obj;
		if (auditoriaModel == null) {
			if (other.auditoriaModel != null) {
				return false;
			}
		} else if (!auditoriaModel.equals(other.auditoriaModel)) {
			return false;
		}
		if (item == null) {
			if (other.item != null) {
				return false;
			}
		} else if (!item.equals(other.item)) {
			return false;
		}
		if (usuario == null) {
			if (other.usuario != null) {
				return false;
			}
		} else if (!usuario.equals(other.usuario)) {
			return false;
		}
		return true;
	}
}
