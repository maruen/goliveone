package br.com.golive.entity.perfil.configuracao.model;

import java.io.Serializable;

import br.com.golive.entity.empresas.model.Empresa;
import br.com.golive.entity.perfil.usuario.model.Usuario;

@SuppressWarnings("serial")
public class ColunaPerfilId implements Serializable {

	private Usuario usuario;
	private Empresa empresa;

	public ColunaPerfilId() {
		super();
	}

	public ColunaPerfilId(final Usuario usuario, final Empresa empresa) {
		super();
		this.usuario = usuario;
		this.empresa = empresa;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(final Usuario usuario) {
		this.usuario = usuario;
	}

	public Empresa getEmpresa() {
		return empresa;
	}

	public void setEmpresa(final Empresa empresa) {
		this.empresa = empresa;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = (prime * result) + ((empresa == null) ? 0 : empresa.hashCode());
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
		final ColunaPerfilId other = (ColunaPerfilId) obj;
		if (empresa == null) {
			if (other.empresa != null) {
				return false;
			}
		} else if (!empresa.equals(other.empresa)) {
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

	@Override
	public String toString() {
		return "ColunaPerfilId [usuario=" + usuario + ", empresa=" + empresa + "]";
	}

}
