package br.com.golive.entity.areaDeAtuacao;

import java.util.Calendar;

import lombok.Data;
import br.com.golive.annotation.Label;

@Data
@Label(name = "label.auditoria/Log")
public class AuditoriaLog {

	@Label(name = "label.id")
	private Long id;

	@Label(name = "label.dataEHora")
	private Calendar calendar;

	@Label(name = "label.formulario")
	private String formulario;

	@Label(name = "label.id")
	private Long id2;

	@Label(name = "label.acao")
	private String acao;

	@Label(name = "label.valorAlterado")
	private String valorAlterado;

	@Label(name = "label.valorAtual")
	private String valorAtual;

	@Label(name = "label.usuario")
	private String usuario;

	@Label(name = "label.observacao")
	private String observacao;

	public AuditoriaLog() {
		super();
	}

	public AuditoriaLog(final Long id, final Calendar calendar, final String formulario, final Long id2, final String acao, final String valorAlterado, final String valorAtual, final String usuario, final String observacao) {
		super();
		this.id = id;
		this.calendar = calendar;
		this.formulario = formulario;
		this.id2 = id2;
		this.acao = acao;
		this.valorAlterado = valorAlterado;
		this.valorAtual = valorAtual;
		this.usuario = usuario;
		this.observacao = observacao;
	}

	public Long getId() {
		return id;
	}

	public void setId(final Long id) {
		this.id = id;
	}

	public Calendar getCalendar() {
		return calendar;
	}

	public void setCalendar(final Calendar calendar) {
		this.calendar = calendar;
	}

	public String getFormulario() {
		return formulario;
	}

	public void setFormulario(final String formulario) {
		this.formulario = formulario;
	}

	public Long getId2() {
		return id2;
	}

	public void setId2(final Long id2) {
		this.id2 = id2;
	}

	public String getAcao() {
		return acao;
	}

	public void setAcao(final String acao) {
		this.acao = acao;
	}

	public String getValorAlterado() {
		return valorAlterado;
	}

	public void setValorAlterado(final String valorAlterado) {
		this.valorAlterado = valorAlterado;
	}

	public String getValorAtual() {
		return valorAtual;
	}

	public void setValorAtual(final String valorAtual) {
		this.valorAtual = valorAtual;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(final String usuario) {
		this.usuario = usuario;
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(final String observacao) {
		this.observacao = observacao;
	}

}
