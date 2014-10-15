package br.com.golive.entity.areaDeAtuacao;

import java.io.Serializable;
import java.util.Calendar;
import java.util.List;

import javax.persistence.Column;

import br.com.golive.annotation.Jasper;
import br.com.golive.annotation.Label;

@Jasper(titulo = "tittle.relatorio.cadastro", nomeDoArquivoGerado = "file.name.areaDeAtuacao.Cadastro", nomeArquivoJasper = "cadastrosCadastrosClassificacaoEmpresasAreaDeAtuacaoCadastro")
public class AreaDeAtuacaoModel implements Serializable{

	private static final long serialVersionUID = 1L;

	@Label(name = "label.id")
	@Column
	private Long id;

	@Label(name = "label.inclusao")
	@Column
	private Calendar dataInclusao;

	@Label(name = "label.ultimaAlteracao")
	@Column
	private Calendar dataAlteracao;


	@Label(name = "label.descricao")
	@Column
	private String areaDeAtuacao;

	private List<AuditoriaLog> listaAuditoriaLogs;

	public AreaDeAtuacaoModel() {
		super();
	}

	public AreaDeAtuacaoModel(final Long id, final Calendar dataInclusao, final Calendar dataAlteracao, final String areaDeAtuacao, final List<AuditoriaLog> listaAuditoriaLogs) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.areaDeAtuacao = areaDeAtuacao;
		this.listaAuditoriaLogs = listaAuditoriaLogs;
	}

	public Long getId() {
		return id;
	}

	public void setId(final Long id) {
		this.id = id;
	}

	public Calendar getDataInclusao() {
		return dataInclusao;
	}

	public void setDataInclusao(final Calendar dataInclusao) {
		this.dataInclusao = dataInclusao;
	}

	public Calendar getDataAlteracao() {
		return dataAlteracao;
	}

	public void setDataAlteracao(final Calendar dataAlteracao) {
		this.dataAlteracao = dataAlteracao;
	}

	public String getAreaDeAtuacao() {
		return areaDeAtuacao;
	}

	public void setAreaDeAtuacao(final String areaDeAtuacao) {
		this.areaDeAtuacao = areaDeAtuacao;
	}

	public List<AuditoriaLog> getListaAuditoriaLogs() {
		return listaAuditoriaLogs;
	}

	public void setListaAuditoriaLogs(final List<AuditoriaLog> listaAuditoriaLogs) {
		this.listaAuditoriaLogs = listaAuditoriaLogs;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = (prime * result) + ((areaDeAtuacao == null) ? 0 : areaDeAtuacao.hashCode());
		result = (prime * result) + ((dataAlteracao == null) ? 0 : dataAlteracao.hashCode());
		result = (prime * result) + ((dataInclusao == null) ? 0 : dataInclusao.hashCode());
		result = (prime * result) + ((id == null) ? 0 : id.hashCode());
		result = (prime * result) + ((listaAuditoriaLogs == null) ? 0 : listaAuditoriaLogs.hashCode());
		return result;
	}

	@Override
	public boolean equals(final Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		final AreaDeAtuacaoModel other = (AreaDeAtuacaoModel) obj;
		if (areaDeAtuacao == null) {
			if (other.areaDeAtuacao != null) {
				return false;
			}
		} else if (!areaDeAtuacao.equals(other.areaDeAtuacao)) {
			return false;
		}
		if (dataAlteracao == null) {
			if (other.dataAlteracao != null) {
				return false;
			}
		} else if (!dataAlteracao.equals(other.dataAlteracao)) {
			return false;
		}
		if (dataInclusao == null) {
			if (other.dataInclusao != null) {
				return false;
			}
		} else if (!dataInclusao.equals(other.dataInclusao)) {
			return false;
		}
		if (id == null) {
			if (other.id != null) {
				return false;
			}
		} else if (!id.equals(other.id)) {
			return false;
		}
		if (listaAuditoriaLogs == null) {
			if (other.listaAuditoriaLogs != null) {
				return false;
			}
		} else if (!listaAuditoriaLogs.equals(other.listaAuditoriaLogs)) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "AreaDeAtuacaoModel [id=" + id + ", dataInclusao=" + dataInclusao + ", dataAlteracao=" + dataAlteracao + ", areaDeAtuacao=" + areaDeAtuacao + ", listaAuditoriaLogs=" + listaAuditoriaLogs + "]";
	}

}
