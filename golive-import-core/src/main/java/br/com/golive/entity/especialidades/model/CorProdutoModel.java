package br.com.golive.entity.especialidades.model;

import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import br.com.golive.annotation.Jasper;
import br.com.golive.entity.Model;
import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;


@Jasper(titulo="Cores",
		nomeDoArquivoGerado="file.name.model",
		nomeArquivoJasper ="Cores"
		)

@Entity
@Data
@Table(name="tbCorProduto")
@EqualsAndHashCode(callSuper=false)
public class CorProdutoModel extends Model{
	
	private static final long serialVersionUID = 1L;
		
	private String 		 		 corCodigo;
	private String		 		 corDescricao;
	private SubGrupoProdutoModel subGrupoProdutoSelected;
	
	
}
