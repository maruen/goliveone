package br.com.golive.entity.finalidadepadraoespessura.repositorio;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;

import br.com.golive.entity.finalidadepadraoespessura.model.ProdutoFinalidadePadraoEspessuraModel;
import br.com.golive.jpa.JpaGoLive;

public class ProdutoFinalidadePadraoEspessuraJPA extends JpaGoLive<ProdutoFinalidadePadraoEspessuraModel, Long> {

	public List<ProdutoFinalidadePadraoEspessuraModel> obterLista() {
		final Criteria criteria = createNativeCriteria();
		criteria.addOrder(Order.asc("id"));
		return extractListByCriteria(criteria);
	}
}