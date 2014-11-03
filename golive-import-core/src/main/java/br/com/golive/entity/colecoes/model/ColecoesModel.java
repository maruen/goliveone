package br.com.golive.entity.colecoes.model;

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
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;

@Data
@EqualsAndHashCode(callSuper=false)
@Entity
@Table(name = "tbColecoesProduto")
@Jasper(titulo = "Colecoes", nomeDoArquivoGerado = "file.name.model", nomeArquivoJasper = "Colecoes")
@Label(name = "label.colecoes")
public class ColecoesModel extends Model {
	
	@Transient
	private static final long serialVersionUID = 1L;
	

	@Column(name = "Colecao")
	private String colecao;

	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.REMOVE }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbColecoesProduto_tbGrupoProduto",
		joinColumns = @JoinColumn(name = "tbColecoesProduto_Id", 	 referencedColumnName = "Id"), 
		inverseJoinColumns = @JoinColumn(name = "tbGrupoProduto_Id", referencedColumnName = "Id")
	)
	private GrupoProdutosModel grupoProdutoSelected;

	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.REMOVE }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbColecoesProduto_tbDepartamentoProduto",
		joinColumns 		= @JoinColumn(name = "tbColecoesProduto_Id", 	 referencedColumnName = "Id"), 
		inverseJoinColumns 	= @JoinColumn(name = "tbDepartamentoProduto_Id", referencedColumnName = "Id")
	)
	private DepartamentoModel departamentoSelected;

	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.REMOVE }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbColecoesProduto_tbSubGrupoProduto",
		joinColumns 		= @JoinColumn(name = "tbColecoesProduto_Id", referencedColumnName = "Id"),
		inverseJoinColumns 	= @JoinColumn(name = "tbSubGrupoProduto_Id", referencedColumnName = "Id")
	)
	private SubGrupoProdutoModel subGrupoProdutoSelected;


}