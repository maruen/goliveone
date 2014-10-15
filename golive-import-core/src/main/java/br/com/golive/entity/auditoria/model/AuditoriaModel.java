package br.com.golive.entity.auditoria.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * The persistent class for the tbAuditoria database table.
 * 
 */
@Entity
@Table(name="tbAuditoria")
public class AuditoriaModel implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="Id")
	private Long id;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="DataHoraOcorrencia")
	private Date dataHoraOcorrencia;

	@Column(name="FormularioNome")
	private String formularioNome;

	@Column(name="Observacao")
	private String observacao;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="SystemDateTime")
	private Date systemDateTime;

	@Column(name="UsuarioSistemaAcao")
	private String usuarioSistemaAcao;

	@Column(name="UsuarioSistemaInformacaoAnterior")
	private String usuarioSistemaInformacaoAnterior;

	@Column(name="UsuarioSistemaInformacaoAtual")
	private String usuarioSistemaInformacaoAtual;

	public AuditoriaModel() {
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getDataHoraOcorrencia() {
		return this.dataHoraOcorrencia;
	}

	public void setDataHoraOcorrencia(Date dataHoraOcorrencia) {
		this.dataHoraOcorrencia = dataHoraOcorrencia;
	}

	public String getFormularioNome() {
		return this.formularioNome;
	}

	public void setFormularioNome(String formularioNome) {
		this.formularioNome = formularioNome;
	}

	public String getObservacao() {
		return this.observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	public Date getSystemDateTime() {
		return this.systemDateTime;
	}

	public void setSystemDateTime(Date systemDateTime) {
		this.systemDateTime = systemDateTime;
	}

	public String getUsuarioSistemaAcao() {
		return this.usuarioSistemaAcao;
	}

	public void setUsuarioSistemaAcao(String usuarioSistemaAcao) {
		this.usuarioSistemaAcao = usuarioSistemaAcao;
	}

	public String getUsuarioSistemaInformacaoAnterior() {
		return this.usuarioSistemaInformacaoAnterior;
	}

	public void setUsuarioSistemaInformacaoAnterior(String usuarioSistemaInformacaoAnterior) {
		this.usuarioSistemaInformacaoAnterior = usuarioSistemaInformacaoAnterior;
	}

	public String getUsuarioSistemaInformacaoAtual() {
		return this.usuarioSistemaInformacaoAtual;
	}

	public void setUsuarioSistemaInformacaoAtual(String usuarioSistemaInformacaoAtual) {
		this.usuarioSistemaInformacaoAtual = usuarioSistemaInformacaoAtual;
	}


}