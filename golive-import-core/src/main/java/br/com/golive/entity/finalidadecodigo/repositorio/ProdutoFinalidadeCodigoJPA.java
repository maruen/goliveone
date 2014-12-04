package br.com.golive.entity.finalidadecodigo.repositorio;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;

import br.com.golive.entity.finalidadecodigo.model.ProdutoFinalidadeCodigoModel;
import br.com.golive.jpa.JpaGoLive;

public class ProdutoFinalidadeCodigoJPA extends JpaGoLive<ProdutoFinalidadeCodigoModel, Long> {

	public List<ProdutoFinalidadeCodigoModel> obterLista() {
		final Criteria criteria = createNativeCriteria();
		criteria.addOrder(Order.asc("id"));
		return extractListByCriteria(criteria);
	}
}