package br.com.golive.entity.areaDeAtuacao;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import br.com.golive.annotation.Jasper;
import br.com.golive.annotation.Label;
import br.com.golive.annotation.StandardColumn;
import br.com.golive.entity.Model;

@Entity
@Table(name = "tbCadastroClassificacaoAreaDeAtuacao")
@Jasper(titulo = "tittle.relatorio.cadastro", nomeDoArquivoGerado = "file.name.areaDeAtuacao.Cadastro", nomeArquivoJasper = "cadastrosCadastrosClassificacaoEmpresasAreaDeAtuacaoCadastro")
public class AreaDeAtuacaoModel extends Model implements Serializable {


	@Transient
	private static final long serialVersionUID = -4119335235341249584L;

	@StandardColumn
	@Label(name = "label.descricao")
	@Column(name = "Description")
	private String areaDeAtuacao;

	@Transient
	private List<AuditoriaLog> listaAuditoriaLogs;

	public AreaDeAtuacaoModel() {
		super();
	}

	public AreaDeAtuacaoModel(final String areaDeAtuacao, final List<AuditoriaLog> listaAuditoriaLogs) {
		super();
		this.areaDeAtuacao = areaDeAtuacao;
		this.listaAuditoriaLogs = listaAuditoriaLogs;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = (prime * result) + ((areaDeAtuacao == null) ? 0 : areaDeAtuacao.hashCode());
		result = (prime * result) + ((listaAuditoriaLogs == null) ? 0 : listaAuditoriaLogs.hashCode());
		return result;
	}

	@Override
	public boolean equals(final Object obj) {
		if (this == obj) {
			return true;
		}
		if (!super.equals(obj)) {
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
		return "AreaDeAtuacaoModel [areaDeAtuacao=" + areaDeAtuacao + ", listaAuditoriaLogs=" + listaAuditoriaLogs + "]";
	}


}
