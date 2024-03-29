package br.com.golive.entity.auditoria.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import br.com.golive.entity.Model;

/**
 * The persistent class for the tbAuditoria database table.
 * 
 */
@Entity
@Table(name = "tbAuditoria")
public class AuditoriaModel extends Model {

	private static final long serialVersionUID = 1L;

	@Column(name = "LabelPropertyFormulario")
	private String formularioNome;

	@Column(name = "AcaoUsuario")
	private String acaoUsuario;

	@Column(name = "Observacao")
	private String observacao;

	@Transient
	private List<AuditoriaItemModel> items;

	public AuditoriaModel() {
	}

	public String getFormularioNome() {
		return formularioNome;
	}

	public void setFormularioNome(final String formularioNome) {
		this.formularioNome = formularioNome;
	}

	public String getAcaoUsuario() {
		return acaoUsuario;
	}

	public void setAcaoUsuario(final String acaoUsuario) {
		this.acaoUsuario = acaoUsuario;
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(final String observacao) {
		this.observacao = observacao;
	}

}