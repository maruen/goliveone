package br.com.golive.entity.subgrupoprodutos.repository;

import static org.hibernate.FetchMode.EAGER;

import java.util.List;

import org.hibernate.Criteria;

import br.com.golive.entity.subgrupoprodutos.model.SubGrupoProdutoModel;
import br.com.golive.jpa.JpaGoLive;

public class SubGrupoProdutoJPA extends JpaGoLive<SubGrupoProdutoModel, Long> {
	
	@SuppressWarnings("deprecation")
	public List<SubGrupoProdutoModel> obterLista() {
		Criteria criteria = createNativeCriteria();
		criteria.setFetchMode("departamentoSelected", EAGER);
		criteria.setFetchMode("grupoProdutoSelected", EAGER);
		return extractListByCriteria(criteria);
	}
	
	
	
}
