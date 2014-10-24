package br.com.golive.entity.departamento.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import br.com.golive.annotation.Jasper;
import br.com.golive.annotation.Label;
import br.com.golive.annotation.QueryAuditoria;
import br.com.golive.entity.Model;

@Entity
@Table(name = "tbDepartamentoProduto")
@Label(name = "label.cadastroDepartamento")
@QueryAuditoria(query = "INSERT INTO tbAuditoria_tbDepartamentoProduto VALUES (?,?,?,?)")
@Jasper(titulo = "Departamento", nomeDoArquivoGerado = "file.name.model", nomeArquivoJasper = "Departamento")
public class DepartamentoModel extends Model {

	private static final long serialVersionUID = -7554696042401221262L;

	@Column(name = "DepartamentoProduto")
	private String departamento;

	public DepartamentoModel() {
	}

	public String getDepartamento() {
		return departamento;
	}

	public void setDepartamento(final String departamento) {
		this.departamento = departamento;
	}
}
