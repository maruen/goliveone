package br.com.golive.entity.subgrupoprodutos.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;
import br.com.golive.annotation.Label;
import br.com.golive.entity.Model;

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
	
	
	
}