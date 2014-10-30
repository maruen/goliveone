package br.com.golive.entity.grupoprodutos.repositorio;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;

import br.com.golive.entity.grupoprodutos.model.GrupoProdutosModel;
import br.com.golive.jpa.JpaGoLive;

public class GrupoProdutoJPA extends JpaGoLive<GrupoProdutosModel, Long> {

	@SuppressWarnings("deprecation")
	public List<GrupoProdutosModel> obterLista() {
		final Criteria criteria = createNativeCriteria();
		criteria.setFetchMode("departamentoModel", FetchMode.EAGER);
		return extractListByCriteria(criteria);
	}

}
