package br.com.golive.entity;

import java.io.Serializable;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import br.com.golive.annotation.Label;
import br.com.golive.annotation.StandardColumn;
import br.com.golive.entity.perfil.usuario.model.Usuario;

@MappedSuperclass
public class Model implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@StandardColumn
	@Column(name="id")
	@Label(name = "label.id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected Long id;
	
	@StandardColumn
	@Label(name = "label.inclusao")
	@Column(name="SystemIncludeDateTime")
	@Temporal(TemporalType.TIMESTAMP)
	protected Calendar dataInclusao;
	
	@Label(name = "label.ultimaAlteracao")
	@Column(name="SystemChangeDateTime")
	@Temporal(TemporalType.TIMESTAMP)
	protected Calendar dataAlteracao;
	
	@Transient 
	protected Usuario usuario;

	@Transient 
	protected String nomeFormulario;

	public Model() {
		super();
	}

	public Model(final Long id, final Calendar dataInclusao, final Calendar dataAlteracao, final Usuario usuario, final String nomeFormulario) {
		super();
		this.id = id;
		this.dataInclusao = dataInclusao;
		this.dataAlteracao = dataAlteracao;
		this.usuario = usuario;
		this.nomeFormulario = nomeFormulario;
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

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(final Usuario usuario) {
		this.usuario = usuario;
	}

	public String getNomeFormulario() {
		return nomeFormulario;
	}

	public void setNomeFormulario(final String nomeFormulario) {
		this.nomeFormulario = nomeFormulario;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = (prime * result) + ((dataAlteracao == null) ? 0 : dataAlteracao.hashCode());
		result = (prime * result) + ((dataInclusao == null) ? 0 : dataInclusao.hashCode());
		result = (prime * result) + ((id == null) ? 0 : id.hashCode());
		result = (prime * result) + ((nomeFormulario == null) ? 0 : nomeFormulario.hashCode());
		result = (prime * result) + ((usuario == null) ? 0 : usuario.hashCode());
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
		final Model other = (Model) obj;
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
		if (nomeFormulario == null) {
			if (other.nomeFormulario != null) {
				return false;
			}
		} else if (!nomeFormulario.equals(other.nomeFormulario)) {
			return false;
		}
		if (usuario == null) {
			if (other.usuario != null) {
				return false;
			}
		} else if (!usuario.equals(other.usuario)) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "Model [id=" + id + ", dataInclusao=" + dataInclusao + ", dataAlteracao=" + dataAlteracao + ", usuario=" + usuario + ", nomeFormulario=" + nomeFormulario + "]";
	}
	
	
}
