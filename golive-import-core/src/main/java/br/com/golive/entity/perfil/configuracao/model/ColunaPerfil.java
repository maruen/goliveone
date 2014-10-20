package br.com.golive.entity.perfil.configuracao.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import br.com.golive.entity.Model;
import br.com.golive.entity.empresas.model.Empresa;
import br.com.golive.entity.perfil.usuario.model.Usuario;

@Entity
@Table(name = "tbConfiguracaoColunaPagina")
//@IdClass(value = ColunaPerfilId.class)
public class ColunaPerfil extends Model {

	private static final long serialVersionUID = -161500950585892955L;
	
	@Column(name = "IdUser")
	private Usuario usuario;

	@Id
	@Column(name = "IdEmploye")
	private Empresa empresa;

	@Column(name = "Order")
	private Long ordem;

	@Column(name = "TableName")
	private String tabela;

	@Column(name = "ColumnName")
	private String coluna;

	@Column(name = "PatternFilter")
	private String padraoFiltro;

	public ColunaPerfil() {
		super();
	}

	public ColunaPerfil(final Usuario usuario, final Long ordem, final Empresa empresa, final String tabela, final String coluna, final String padraoFiltro) {
		super();
		this.usuario = usuario;
		this.ordem = ordem;
		this.empresa = empresa;
		this.tabela = tabela;
		this.coluna = coluna;
		this.padraoFiltro = padraoFiltro;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(final Usuario usuario) {
		this.usuario = usuario;
	}

	public Long getOrdem() {
		return ordem;
	}

	public void setOrdem(final Long ordem) {
		this.ordem = ordem;
	}

	public Empresa getEmpresa() {
		return empresa;
	}

	public void setEmpresa(final Empresa empresa) {
		this.empresa = empresa;
	}

	public String getTabela() {
		return tabela;
	}

	public void setTabela(final String tabela) {
		this.tabela = tabela;
	}

	public String getColuna() {
		return coluna;
	}

	public void setColuna(final String coluna) {
		this.coluna = coluna;
	}

	public String getPadraoFiltro() {
		return padraoFiltro;
	}

	public void setPadraoFiltro(final String padraoFiltro) {
		this.padraoFiltro = padraoFiltro;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = (prime * result) + ((coluna == null) ? 0 : coluna.hashCode());
		result = (prime * result) + ((empresa == null) ? 0 : empresa.hashCode());
		result = (prime * result) + ((ordem == null) ? 0 : ordem.hashCode());
		result = (prime * result) + ((padraoFiltro == null) ? 0 : padraoFiltro.hashCode());
		result = (prime * result) + ((tabela == null) ? 0 : tabela.hashCode());
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
		final ColunaPerfil other = (ColunaPerfil) obj;
		if (coluna == null) {
			if (other.coluna != null) {
				return false;
			}
		} else if (!coluna.equals(other.coluna)) {
			return false;
		}
		if (empresa == null) {
			if (other.empresa != null) {
				return false;
			}
		} else if (!empresa.equals(other.empresa)) {
			return false;
		}
		if (ordem == null) {
			if (other.ordem != null) {
				return false;
			}
		} else if (!ordem.equals(other.ordem)) {
			return false;
		}
		if (padraoFiltro == null) {
			if (other.padraoFiltro != null) {
				return false;
			}
		} else if (!padraoFiltro.equals(other.padraoFiltro)) {
			return false;
		}
		if (tabela == null) {
			if (other.tabela != null) {
				return false;
			}
		} else if (!tabela.equals(other.tabela)) {
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
		return "ColunaPerfil [usuario=" + usuario + ", ordem=" + ordem + ", empresa=" + empresa + ", tabela=" + tabela + ", coluna=" + coluna + ", padraoFiltro=" + padraoFiltro + "]";
	}

}
