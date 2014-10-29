package br.com.golive.entity.grupoprodutos.repositorio;

import java.util.List;

import javax.persistence.Query;

import br.com.golive.entity.grupoprodutodepartamento.model.GrupoProdutoDepartamento;
import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.jpa.JpaGoLive;

public class GrupoProdutoJPA extends JpaGoLive<GrupoProdutosModel, Long> {

	public List<GrupoProdutoDepartamento> obterLista() {

		final StringBuilder sql = new StringBuilder();
		sql.append("SELECT * FROM TBGRUPOPRODUTO_TBDEPARTAMENTOPRODUTO");
		final Query query = createQueryByClassWithSql(sql.toString(), GrupoProdutoDepartamento.class);

		final Query query2 = createNativeQuery(sql.toString());
		query2.getResultList();
		return query.getResultList();
	}

}
