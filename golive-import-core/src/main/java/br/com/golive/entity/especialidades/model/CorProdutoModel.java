package br.com.golive.entity.especialidades.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;
import br.com.golive.annotation.Label;
import br.com.golive.entity.Model;
import br.com.golive.entity.colecoes.model.ColecoesModel;
import br.com.golive.entity.departamento.model.DepartamentoModel;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;


@Jasper(titulo="Cores",
		nomeDoArquivoGerado="file.name.model",
		nomeArquivoJasper ="Cores"
		)

@Entity
@Data
@Table(name="tbCorProduto")
@Label(name= "label.cadastroCores")
@EqualsAndHashCode(callSuper=false)
public class CorProdutoModel extends Model{
	
	private static final long serialVersionUID = 1L;
		
	@Column(name="CorCodigo")
	private String  corCodigo;
	
	@Column(name="CorDescricao")
	private String corDescricao;
	
	
	
	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.REMOVE }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbCorProduto_tbSubGrupoProduto",
				joinColumns = @JoinColumn(name = "tbCorProduto_Id", referencedColumnName = "Id"),
				inverseJoinColumns = @JoinColumn(name = "tbSubGrupoProduto_Id", referencedColumnName = "Id"))
	private SubGrupoProdutoModel subGrupoProdutoSelected;
	
	
	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.REMOVE }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbCorProduto_tbGrupoProduto",
				joinColumns = @JoinColumn(name = "tbCorProduto_Id", referencedColumnName = "Id"),
				inverseJoinColumns = @JoinColumn(name = "tbGrupoProduto_Id", referencedColumnName = "Id"))
	private GrupoProdutosModel grupoProdutoSelected;
	
	
	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.REMOVE }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbCorProduto_tbDepartamentoProduto", 
			joinColumns = @JoinColumn(name = "tbCorProduto_Id", referencedColumnName = "Id"), 
			inverseJoinColumns = @JoinColumn(name = "tbDepartamentoProduto_Id", referencedColumnName = "Id" ))
	private DepartamentoModel departamentoSelected;
	
	
	@OneToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH, CascadeType.REMOVE }, fetch = FetchType.LAZY)
	@JoinTable(name = "tbCorProduto_tbColecoesProduto", 
			joinColumns = @JoinColumn(name = "tbCorProduto_Id", referencedColumnName = "Id"), 
			inverseJoinColumns = @JoinColumn(name = "tbColecoesProduto_Id", referencedColumnName = "Id" ))
	private ColecoesModel colecaoSelected;
	
	
	
	
}
