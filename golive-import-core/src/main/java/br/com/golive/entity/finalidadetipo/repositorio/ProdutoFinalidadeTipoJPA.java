package br.com.golive.entity.finalidadetipo.repositorio;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;

import br.com.golive.entity.finalidadetipo.model.ProdutoFinalidadeTipoModel;
import br.com.golive.jpa.JpaGoLive;

public class ProdutoFinalidadeTipoJPA extends JpaGoLive<ProdutoFinalidadeTipoModel, Long> {

	public List<ProdutoFinalidadeTipoModel> obterLista() {
		final Criteria criteria = createNativeCriteria();
		criteria.addOrder(Order.asc("id"));
		return extractListByCriteria(criteria);
	}
}