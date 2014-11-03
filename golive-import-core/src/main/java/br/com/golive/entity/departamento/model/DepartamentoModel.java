package br.com.golive.entity.departamento.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;
import br.com.golive.annotation.Label;
import br.com.golive.entity.Model;

@Jasper(titulo = "Departamento", nomeDoArquivoGerado = "file.name.model", nomeArquivoJasper = "Departamento")
@Entity
@Table(name = "tbDepartamentoProduto")
@Label(name = "label.cadastroDepartamento")
@Data
@EqualsAndHashCode(callSuper = false)
public class DepartamentoModel extends Model {

	@Transient
	private static final long serialVersionUID = 1L;

	@Column(name = "DepartamentoProduto")
	private String departamento;

	@Override
	public String toString() {
		return departamento;
	}

}
