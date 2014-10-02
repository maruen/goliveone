package br.com.golive.entity.areaDeAtuacao;

import java.util.List;

import lombok.Data;
import br.com.golive.annotation.Jasper;

@Data
@Jasper(titulo = "tittle.relatorio.cadastro", nomeDoArquivoGerado = "file.name.areaDeAtuacao.Cadastro", nomeArquivoJasper = "cadastrosCadastrosClassificacaoEmpresasAreaDeAtuacaoCadastro")
public class AreaDeAtuacaoEmbed {

	private Cadastro cadastroAreaAtuacao;

	private AuditoriaLog auditoriaLog;

	private List<AuditoriaLog> listaAuditoriaLogs;

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

	public void setCadastroAreaAtuacao(final Cadastro cadastroAreaAtuacao) {
		this.cadastroAreaAtuacao = cadastroAreaAtuacao;
	}

	public AuditoriaLog getAuditoriaLog() {
		return auditoriaLog;
	}

	public void setAuditoriaLog(final AuditoriaLog auditoriaLog) {
		this.auditoriaLog = auditoriaLog;
	}

	public List<AuditoriaLog> getListaAuditoriaLogs() {
		return listaAuditoriaLogs;
	}

	public void setListaAuditoriaLogs(List<AuditoriaLog> listaAuditoriaLogs) {
		this.listaAuditoriaLogs = listaAuditoriaLogs;
	}

}
