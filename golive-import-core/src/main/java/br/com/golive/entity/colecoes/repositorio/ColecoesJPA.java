package br.com.golive.entity.colecoes.repositorio;

import static org.hibernate.FetchMode.EAGER;

import java.util.List;

import org.hibernate.Criteria;

import br.com.golive.entity.colecoes.model.ColecoesModel;
import br.com.golive.jpa.JpaGoLive;

public class ColecoesJPA extends JpaGoLive<ColecoesModel, Long> {
	
	@SuppressWarnings("deprecation")
	public List<ColecoesModel> listarTodos() {
		Criteria criteria = createNativeCriteria();
		criteria.setFetchMode("departamentoSelected", EAGER);
		criteria.setFetchMode("grupoProdutoSelected", EAGER);
		criteria.setFetchMode("subGrupoProdutoSelected", EAGER);
		criteria.setFetchMode("colecaoSelected", EAGER);
		return extractListByCriteria(criteria);
	}


}
