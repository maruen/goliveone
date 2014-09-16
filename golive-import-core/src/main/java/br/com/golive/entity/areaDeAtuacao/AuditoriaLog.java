package br.com.golive.entity.areaDeAtuacao;

import java.math.BigDecimal;
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
	private BigDecimal valorAlterado;
	
	@Label(name = "label.valorAtual")
	private BigDecimal valorAtual;

	@Label(name = "label.usuario")
	private String usuario;
	
	@Label(name = "label.observacao")
	private String observacao;

	public AuditoriaLog() {
		super();
	}

	public AuditoriaLog(final Long id, final Calendar calendar, final String formulario, final Long id2, final String acao, final BigDecimal valorAlterado, final BigDecimal valorAtual, final String usuario, final String observacao) {
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

}
