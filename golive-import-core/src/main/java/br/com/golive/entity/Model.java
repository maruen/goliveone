package br.com.golive.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Transient;

@MappedSuperclass
public class Model implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected Long id;
	
	@Column(name="SystemIncludeDateTime")
	protected Date dataInclusao;
	
	@Column(name="SystemChangeDateTime")
	protected Date dataAlteracao;
	
	@Transient 
	protected Usuario usuario;

	@Transient 
	protected String nomeFormulario;
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public Long getId() {
		return id;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	public Usuario getUsuario() {
		return usuario;
	}
	
	public String getNomeFormulario() {
		return nomeFormulario;
	}

	public void setNomeFormulario(String nomeFormulario) {
		this.nomeFormulario = nomeFormulario;
	}
	
	public Date getDataInclusao() {
		return dataInclusao;
	}

	public void setDataInclusao(Date dataInclusao) {
		this.dataInclusao = dataInclusao;
	}

	public Date getDataAlteracao() {
		return dataAlteracao;
	}

	public void setDataAlteracao(Date dataAlteracao) {
		this.dataAlteracao = dataAlteracao;
	}
	
	public boolean hasId() {
		if (this.id == null) {
			return false;
		}
		return true;
	}
	
}
