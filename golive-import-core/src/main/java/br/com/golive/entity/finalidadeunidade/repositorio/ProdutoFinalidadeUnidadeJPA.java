package br.com.golive.entity.finalidadeunidade.repositorio;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;

import br.com.golive.entity.finalidadeunidade.model.ProdutoFinalidadeUnidadeModel;
import br.com.golive.jpa.JpaGoLive;

public class ProdutoFinalidadeUnidadeJPA extends JpaGoLive<ProdutoFinalidadeUnidadeModel, Long> {

	public List<ProdutoFinalidadeUnidadeModel> obterLista() {
		final Criteria criteria = createNativeCriteria();
		criteria.addOrder(Order.asc("id"));
		return extractListByCriteria(criteria);
	}
}