package br.com.golive.entity.finalidadedescricao.repositorio;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;

import br.com.golive.entity.finalidadedescricao.model.ProdutoFinalidadeDescricaoModel;
import br.com.golive.jpa.JpaGoLive;

public class ProdutoFinalidadeDescricaoJPA extends JpaGoLive<ProdutoFinalidadeDescricaoModel, Long> {

	public List<ProdutoFinalidadeDescricaoModel> obterLista() {
		final Criteria criteria = createNativeCriteria();
		criteria.addOrder(Order.asc("id"));
		return extractListByCriteria(criteria);
	}
}