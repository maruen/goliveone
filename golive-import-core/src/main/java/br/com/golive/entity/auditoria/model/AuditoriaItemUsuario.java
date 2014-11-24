package br.com.golive.entity.auditoria.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

import br.com.golive.entity.usuario.model.Usuario;

@Entity
@IdClass(value = AuditoriaItemUsuarioId.class)
@Table(name = "tbAuditoriaItem_tbAuditoria")
public class AuditoriaItemUsuario implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "tbUsuario_Id")
	private Usuario usuario;

	@Id
	@Column(name = "tbAuditoriaItem_Id")
	private AuditoriaItemModel item;

	@Id
	@Column(name = "tbAuditoria_Id")
	private AuditoriaModel auditoriaModel;

	public AuditoriaItemUsuario() {
		super();
	}

	public AuditoriaItemUsuario(final Usuario usuario, final AuditoriaItemModel item, final AuditoriaModel auditoriaModel) {
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

}
