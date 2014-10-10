package br.com.golive.entity.areaDeAtuacao;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Data;
import br.com.golive.annotation.Jasper;

@Data
@Jasper(titulo = "tittle.relatorio.cadastro", nomeDoArquivoGerado = "file.name.areaDeAtuacao.Cadastro", nomeArquivoJasper = "cadastrosCadastrosClassificacaoEmpresasAreaDeAtuacaoCadastro")
@Entity
@Table(name = "Tabela1")
public class AreaDeAtuacaoEmbed {

	@Column(name = "id")
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

	public void setListaAuditoriaLogs(final List<AuditoriaLog> listaAuditoriaLogs) {
		this.listaAuditoriaLogs = listaAuditoriaLogs;
	}

}
