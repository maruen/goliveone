package br.com.golive.entity.finalidadecor.repositorio;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;

import br.com.golive.entity.finalidadecor.model.ProdutoFinalidadeCorModel;
import br.com.golive.jpa.JpaGoLive;

public class ProdutoFinalidadeCorJPA extends JpaGoLive<ProdutoFinalidadeCorModel, Long> {

	public List<ProdutoFinalidadeCorModel> obterLista() {
		final Criteria criteria = createNativeCriteria();
		criteria.addOrder(Order.asc("id"));
		return extractListByCriteria(criteria);
	}
}