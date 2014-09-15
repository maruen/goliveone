package br.com.golive.entity.areaDeAtuacao;

import lombok.Data;

@Data
public class AreaDeAtuacaoEmbed {

	private Cadastro cadastroAreaAtuacao;
	
	private AuditoriaLog auditoriaLog;

	public AreaDeAtuacaoEmbed(final Cadastro cadastroAreaAtuacao, final AuditoriaLog auditoriaLog) {
		super();
		this.cadastroAreaAtuacao = cadastroAreaAtuacao;
		this.auditoriaLog = auditoriaLog;
	}

	public AreaDeAtuacaoEmbed() {
		super();
	}

	public Cadastro getCadastroAreaAtuacao() {
		return cadastroAreaAtuacao;
	}

	public void setCadastroAreaAtuacao(Cadastro cadastroAreaAtuacao) {
		this.cadastroAreaAtuacao = cadastroAreaAtuacao;
	}

	public AuditoriaLog getAuditoriaLog() {
		return auditoriaLog;
	}

	public void setAuditoriaLog(AuditoriaLog auditoriaLog) {
		this.auditoriaLog = auditoriaLog;
	}
	
}
