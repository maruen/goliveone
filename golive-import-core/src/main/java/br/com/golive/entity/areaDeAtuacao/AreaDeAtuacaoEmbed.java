package br.com.golive.entity.areaDeAtuacao;

import br.com.golive.annotation.Jasper;
import lombok.Data;

@Data
@Jasper(titulo="tittle.relatorio.cadastro", 
nomeDoArquivoGerado="file.name.areaDeAtuacao.Cadastro",
nomeArquivoJasper ="cadastrosCadastrosClassificacaoEmpresasAreaDeAtuacaoCadastro")
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
