package br.com.golive.entity.areaDeAtuacao.model;

import java.io.Serializable;
import java.util.Calendar;

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
	private static final long serialVersionUID = 6985132663796954210L;

	@StandardColumn
	@Label(name = "label.descricao")
	@Column(name = "Description")
	private String areaDeAtuacao;

	public AreaDeAtuacaoModel() {
		super();
	}

	public AreaDeAtuacaoModel(final Long id, final Calendar dataInclusao, final Calendar dataAlteracao, final String areaDeAtuacao) {
		super(id, dataInclusao, dataAlteracao);
		this.areaDeAtuacao = areaDeAtuacao;
	}

	public String getAreaDeAtuacao() {
		return areaDeAtuacao;
	}

	public void setAreaDeAtuacao(final String areaDeAtuacao) {
		this.areaDeAtuacao = areaDeAtuacao;
	}

	public AreaDeAtuacaoModel(final String areaDeAtuacao) {
		super();
		this.areaDeAtuacao = areaDeAtuacao;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = (prime * result) + ((areaDeAtuacao == null) ? 0 : areaDeAtuacao.hashCode());
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
		return true;
	}

	@Override
	public String toString() {
		return "AreaDeAtuacaoModel [areaDeAtuacao=" + areaDeAtuacao + "]";
	}

}
