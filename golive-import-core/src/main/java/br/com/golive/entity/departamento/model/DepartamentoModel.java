package br.com.golive.entity.departamento.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import br.com.golive.annotation.Jasper;
import br.com.golive.annotation.Label;
import br.com.golive.entity.Model;

@Jasper(titulo = "Departamento", nomeDoArquivoGerado = "file.name.model", nomeArquivoJasper = "Departamento")
@Entity
@Table(name = "tbDepartamentoProduto")
@Label(name = "label.cadastroDepartamento")
public class DepartamentoModel extends Model {

	@Transient
	private static final long serialVersionUID = 1L;

	@Column(name = "DepartamentoProduto")
	private String departamento;

	@Override
	public String toString() {
		return departamento;
	}

	public DepartamentoModel() {
		super();
	}

	public String getDepartamento() {
		return departamento;
	}

	public void setDepartamento(final String departamento) {
		this.departamento = departamento;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = (prime * result) + ((departamento == null) ? 0 : departamento.hashCode());
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
		final DepartamentoModel other = (DepartamentoModel) obj;
		if (departamento == null) {
			if (other.departamento != null) {
				return false;
			}
		} else if (!departamento.equals(other.departamento)) {
			return false;
		}
		return true;
	}

}
