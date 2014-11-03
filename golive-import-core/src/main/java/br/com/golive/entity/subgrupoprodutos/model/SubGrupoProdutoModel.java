package br.com.golive.entity.subgrupoprodutos.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
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
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;

@Jasper(titulo 				= "SubGrupoProdutos",
		nomeDoArquivoGerado = "file.name.model",
		nomeArquivoJasper 	= "SubGrupoProdutos")


@Data
@EqualsAndHashCode(callSuper=false)
@Entity
@Table(name = "tbSubGrupoProduto")
@Label(name = "label.cadastroSubGrupoProduto")
public class SubGrupoProdutoModel extends Model {
	
	private static final long serialVersionUID = 1L;
		
	@Column(name="SubGrupoProduto")
	private String subGrupoProduto;
	
	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.REMOVE }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbSubGrupoProduto_tbGrupoProduto",
				joinColumns = @JoinColumn(name = "tbSubGrupoProduto_Id", referencedColumnName = "Id"),
				inverseJoinColumns = @JoinColumn(name = "tbGrupoProduto_Id", referencedColumnName = "Id"))
	private GrupoProdutosModel grupoProdutoSelected;
	
	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.REMOVE }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbSubGrupoProduto_tbDepartamentoProduto", 
			joinColumns = @JoinColumn(name = "tbSubGrupoProduto_Id", referencedColumnName = "Id"), 
			inverseJoinColumns = @JoinColumn(name = "tbDepartamentoProduto_Id", referencedColumnName = "Id" )  )
	private DepartamentoModel departamentoSelected;
	

	@LogList
	@Transient
	private List<AuditoriaModel> auditoriaLogs;
	
}