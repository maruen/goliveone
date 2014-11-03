package br.com.golive.entity.especialidades.repository;

import static org.hibernate.FetchMode.EAGER;

import java.util.List;

import org.hibernate.Criteria;

import br.com.golive.entity.especialidades.model.CorProdutoModel;
import br.com.golive.jpa.JpaGoLive;

public class CorProdutoJPA extends JpaGoLive<CorProdutoModel, Long> {
	
	@SuppressWarnings("deprecation")
	public List<CorProdutoModel> obterLista() {
		Criteria criteria = createNativeCriteria();
		criteria.setFetchMode("departamentoSelected", EAGER);
		criteria.setFetchMode("grupoProdutoSelected", EAGER);
		return extractListByCriteria(criteria);
	}
	
	
	
}
