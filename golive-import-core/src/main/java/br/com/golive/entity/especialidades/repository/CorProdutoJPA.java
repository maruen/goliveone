package br.com.golive.entity.especialidades.repository;

import static org.hibernate.FetchMode.EAGER;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import br.com.golive.entity.colecoes.model.ColecoesModel;
import br.com.golive.entity.especialidades.model.CorProdutoModel;
import br.com.golive.jpa.JpaGoLive;

public class CorProdutoJPA extends JpaGoLive<CorProdutoModel, Long> {

	@SuppressWarnings("deprecation")
	public List<CorProdutoModel> obterLista() {
		final Criteria criteria = createNativeCriteria();
		criteria.setFetchMode("departamentoSelected", EAGER);
		criteria.setFetchMode("grupoProdutoSelected", EAGER);
		criteria.setFetchMode("subGrupoProdutoSelected", EAGER);
		criteria.setFetchMode("colecaoSelected", EAGER);
		return extractListByCriteria(criteria);
	}

	public List<CorProdutoModel> obterListaPorColecao(final ColecoesModel colecoesModel) {
		final Criteria criteria = createNativeCriteria();
		criteria.add(Restrictions.eq("colecaoSelected", colecoesModel));
		return extractListByCriteria(criteria);
	}

}
