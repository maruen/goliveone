package br.com.golive.entity.finalidadepadraolargura.repositorio;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;

import br.com.golive.entity.finalidadepadraolargura.model.ProdutoFinalidadePadraoLarguraModel;
import br.com.golive.jpa.JpaGoLive;

public class ProdutoFinalidadePadraoLarguraJPA extends JpaGoLive<ProdutoFinalidadePadraoLarguraModel, Long>{

	public List<ProdutoFinalidadePadraoLarguraModel> obterLista() {
		final Criteria criteria = createNativeCriteria();
		criteria.addOrder(Order.asc("id"));
		return extractListByCriteria(criteria);
	}
}