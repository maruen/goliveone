package br.com.golive.entity.finalidadecolecao.repositorio;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;

import br.com.golive.entity.finalidadecolecao.model.ProdutoFinalidadeColecaoModel;
import br.com.golive.jpa.JpaGoLive;

public class ProdutoFinalidadeColecaoJPA extends JpaGoLive<ProdutoFinalidadeColecaoModel, Long> {

	public List<ProdutoFinalidadeColecaoModel> obterLista() {
		final Criteria criteria = createNativeCriteria();
		criteria.addOrder(Order.asc("id"));
		return extractListByCriteria(criteria);
	}
}