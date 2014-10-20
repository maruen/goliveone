package br.com.golive.entity.perfil.usuario.model;

import java.util.Calendar;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import br.com.golive.entity.Model;
import br.com.golive.entity.empresas.model.Empresa;
import br.com.golive.utils.GoliveOneProperties;

@Entity
@Table(name = "tbUser")
public class Usuario extends Model {

	private static final long serialVersionUID = -8750720313507700912L;

	@Column(name = "IdUser")
	private Long id;

	@Column(name = "NameUser")
	private String nome;

	@Column(name = "SystemIncludeDateTime")
	private Calendar dataInclusao;

	@Column(name = "PasswordUser")
	private String senha;

	@OneToMany
	@JoinTable(name = "tbUserEmploy", joinColumns = @JoinColumn(name = "IdUser"), inverseJoinColumns = @JoinColumn(name = "IdEmploy"))
	private List<Empresa> empresas;

	@Column(name = "LocaleUser")
	private String locale;

	@Column(name = "EmailUser")
	private String email;

	@Transient
	private GoliveOneProperties labels;

	public Usuario() {
		super();
	}

	public Usuario(final Long id, final String nome, final Calendar dataInclusao, final String senha, final List<Empresa> empresas, final String locale, final String email, final GoliveOneProperties labels) {
		super();
		this.id = id;
		this.nome = nome;
		this.dataInclusao = dataInclusao;
		this.senha = senha;
		this.empresas = empresas;
		this.locale = locale;
		this.email = email;
		this.labels = labels;
	}
	
	public String getNome() {
		return nome;
	}

	public void setNome(final String nome) {
		this.nome = nome;
	}

	
	public String getSenha() {
		return senha;
	}

	public void setSenha(final String senha) {
		this.senha = senha;
	}

	public List<Empresa> getEmpresas() {
		return empresas;
	}

	public void setEmpresas(final List<Empresa> empresas) {
		this.empresas = empresas;
	}

	public String getLocale() {
		return locale;
	}

	public void setLocale(final String locale) {
		this.locale = locale;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(final String email) {
		this.email = email;
	}

	public GoliveOneProperties getLabels() {
		return labels;
	}

	public void setLabels(final GoliveOneProperties labels) {
		this.labels = labels;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = (prime * result) + ((dataInclusao == null) ? 0 : dataInclusao.hashCode());
		result = (prime * result) + ((email == null) ? 0 : email.hashCode());
		result = (prime * result) + ((empresas == null) ? 0 : empresas.hashCode());
		result = (prime * result) + ((id == null) ? 0 : id.hashCode());
		result = (prime * result) + ((labels == null) ? 0 : labels.hashCode());
		result = (prime * result) + ((locale == null) ? 0 : locale.hashCode());
		result = (prime * result) + ((nome == null) ? 0 : nome.hashCode());
		result = (prime * result) + ((senha == null) ? 0 : senha.hashCode());
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
		final Usuario other = (Usuario) obj;
		if (dataInclusao == null) {
			if (other.dataInclusao != null) {
				return false;
			}
		} else if (!dataInclusao.equals(other.dataInclusao)) {
			return false;
		}
		if (email == null) {
			if (other.email != null) {
				return false;
			}
		} else if (!email.equals(other.email)) {
			return false;
		}
		if (empresas == null) {
			if (other.empresas != null) {
				return false;
			}
		} else if (!empresas.equals(other.empresas)) {
			return false;
		}
		if (id == null) {
			if (other.id != null) {
				return false;
			}
		} else if (!id.equals(other.id)) {
			return false;
		}
		if (labels == null) {
			if (other.labels != null) {
				return false;
			}
		} else if (!labels.equals(other.labels)) {
			return false;
		}
		if (locale == null) {
			if (other.locale != null) {
				return false;
			}
		} else if (!locale.equals(other.locale)) {
			return false;
		}
		if (nome == null) {
			if (other.nome != null) {
				return false;
			}
		} else if (!nome.equals(other.nome)) {
			return false;
		}
		if (senha == null) {
			if (other.senha != null) {
				return false;
			}
		} else if (!senha.equals(other.senha)) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "Usuario [id=" + id + ", nome=" + nome + ", dataInclusao=" + dataInclusao + ", senha=" + senha + ", empresas=" + empresas + ", locale=" + locale + ", email=" + email + ", labels=" + labels + "]";
	}

}
