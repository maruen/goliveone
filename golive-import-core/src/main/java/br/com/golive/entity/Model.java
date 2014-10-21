package br.com.golive.entity;

import java.io.Serializable;
import java.util.Date;

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
import br.com.golive.entity.usuario.model.Usuario;

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
	protected Date dataInclusao;
	
	@Label(name = "label.ultimaAlteracao")
	@Column(name="SystemChangeDateTime")
	@Temporal(TemporalType.TIMESTAMP)
	protected Date dataAlteracao;
	
	@Transient 
	protected Usuario usuario;

	@Transient 
	protected String nomeFormulario;

	public Model() {
		super();
	}

	public Model(final Long id, final Date dataInclusao, final Date dataAlteracao, final Usuario usuario, final String nomeFormulario) {
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

	public Date getDataInclusao() {
		return dataInclusao;
	}

	public void setDataInclusao(final Date dataInclusao) {
		this.dataInclusao = dataInclusao;
	}

	public Date getDataAlteracao() {
		return dataAlteracao;
	}

	public void setDataAlteracao(final Date dataAlteracao) {
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
	
	public boolean hasId() {
		if ((this != null) && (this.id != null)) {
			return true;
		}
		return false;
	}

	@Override
	public String toString() {
		return "Model [id=" + id + ", usuario=" + usuario + ", nomeFormulario=" + nomeFormulario + "]";
	}

}