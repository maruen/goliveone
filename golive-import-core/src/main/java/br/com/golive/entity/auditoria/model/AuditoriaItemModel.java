package br.com.golive.entity.auditoria.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import br.com.golive.entity.Model;

/**
 * The persistent class for the tbAuditoria database table.
 * 
 */
@Entity
@Table(name = "tbAuditoriaItem")
public class AuditoriaItemModel extends Model {

	private static final long serialVersionUID = 1L;

	@Column(name = "LabelPropertyCampo")
	private String campo;

	@Column(name = "InformacaoAnterior")
	private String informacaoAnterior;

	@Column(name = "InformacaoAtual")
	private String informacaoAtual;

	public AuditoriaItemModel() {
	}

	public String getCampo() {
		return campo;
	}

	public void setCampo(final String campo) {
		this.campo = campo;
	}

	public String getInformacaoAnterior() {
		return informacaoAnterior;
	}

	public void setInformacaoAnterior(final String informacaoAnterior) {
		this.informacaoAnterior = informacaoAnterior;
	}

	public String getInformacaoAtual() {
		return informacaoAtual;
	}

	public void setInformacaoAtual(final String informacaoAtual) {
		this.informacaoAtual = informacaoAtual;
	}

}