package br.com.golive.entity.finalidadecodigobarras.repositorio;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;

import br.com.golive.entity.finalidadecodigobarras.model.ProdutoFinalidadeCodigoBarrasModel;
import br.com.golive.jpa.JpaGoLive;

public class ProdutoFinalidadeCodigoBarrasJPA extends JpaGoLive<ProdutoFinalidadeCodigoBarrasModel, Long> {

	public List<ProdutoFinalidadeCodigoBarrasModel> obterLista() {
		final Criteria criteria = createNativeCriteria();
		criteria.addOrder(Order.asc("id"));
		return extractListByCriteria(criteria);
	}
}