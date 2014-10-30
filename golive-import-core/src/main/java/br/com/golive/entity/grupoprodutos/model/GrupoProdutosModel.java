package br.com.golive.entity.grupoprodutos.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;
import br.com.golive.annotation.Label;
import br.com.golive.annotation.LogList;
import br.com.golive.entity.Model;
import br.com.golive.entity.auditoria.model.AuditoriaModel;
import br.com.golive.entity.departamento.model.DepartamentoModel;

@Entity
@Table(name = "tbGrupoProduto")
@Label(name = "label.gruposDeProdutos")
@Jasper(titulo = "GrupoProdutos", nomeDoArquivoGerado = "file.name.model", nomeArquivoJasper = "GrupoProdutos")
@Data
@EqualsAndHashCode(callSuper = false)
public class GrupoProdutosModel extends Model {

	@Transient
	private static final long serialVersionUID = 1L;

	@Column(name = "GrupoProduto")
	private String grupoDeProduto;

	@OneToOne(cascade = { CascadeType.PERSIST }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbGrupoProduto_tbDepartamentoProduto", joinColumns = @JoinColumn(name = "tbGrupoProduto_Id", referencedColumnName = "Id"), inverseJoinColumns = @JoinColumn(name = "tbDepartamentoProduto_Id", referencedColumnName = "Id"))
	private DepartamentoModel departamentoModel;


	@LogList
	@Transient
	private List<AuditoriaModel> auditoriaLogs;

	@Override
	public String toString() {
		return "GrupoProdutosModel [grupoDeProduto=" + grupoDeProduto + ", departamentoModel=" + departamentoModel + ", auditoriaLogs=" + auditoriaLogs + "]";
	}

}